import 'package:sqflite/sqflite.dart';

import '../../domain/enums/app_enums.dart';
import '../database/app_database.dart';

final class StarterSeed {
  static const _seedVersion = 'starter-2026-07-21';

  static Future<void> apply() async {
    final db = await AppDatabase.instance;
    final metadata = await db.query(
      'app_metadata',
      where: 'key = ?',
      whereArgs: const <Object?>['starter_seed_version'],
      limit: 1,
    );
    if (metadata.isNotEmpty && metadata.single['value'] == _seedVersion) {
      return;
    }

    await db.transaction((txn) async {
      final categoryIds = <String, int>{};
      for (final name in _categories) {
        final id = await _upsertCategory(txn, name);
        categoryIds[name] = id;
      }

      final yardId = await _upsertYard(txn);

      for (final object in _objects) {
        final objectId = await _upsertObject(txn, object);
        await txn.delete(
          'recoverable_components',
          where: 'object_template_id = ? AND source_type = ?',
          whereArgs: <Object?>[objectId, SourceType.seed.dbValue],
        );

        var sortOrder = 0;
        for (final component in object.components) {
          final categoryId = categoryIds[component.category]!;
          await txn.insert('recoverable_components', <String, Object?>{
            'object_template_id': objectId,
            'component_name': component.name,
            'yield_kind': component.kind.dbValue,
            'category_id': categoryId,
            'recovery_level': component.level.dbValue,
            'low_weight_g': component.lowG,
            'typical_weight_g': component.typicalG,
            'high_weight_g': component.highG,
            'confidence': ConfidenceLevel.low.dbValue,
            'sort_order': sortOrder++,
            'source_type': SourceType.seed.dbValue,
            'source_notes':
                'Broad starter range. Replace with measured personal data.',
            'created_at': _now,
            'updated_at': _now,
            'is_active': 1,
          });
        }
      }

      await txn.insert('app_metadata', <String, Object?>{
        'key': 'starter_seed_version',
        'value': _seedVersion,
        'updated_at': _now,
      }, conflictAlgorithm: ConflictAlgorithm.replace);

      await txn.insert('app_metadata', <String, Object?>{
        'key': 'default_scrapyard_id',
        'value': yardId.toString(),
        'updated_at': _now,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    });
  }

  static String get _now => DateTime.now().toUtc().toIso8601String();

  static Future<int> _upsertCategory(Transaction txn, String name) async {
    final found = await txn.query(
      'scrap_categories',
      columns: const <String>['id'],
      where: 'name = ?',
      whereArgs: <Object?>[name],
      limit: 1,
    );
    if (found.isNotEmpty) return found.single['id'] as int;

    return txn.insert('scrap_categories', <String, Object?>{
      'name': name,
      'description': 'Starter Scrap Helper category.',
      'source_type': SourceType.seed.dbValue,
      'source_notes': 'Starter category; map to your yard wording.',
      'created_at': _now,
      'updated_at': _now,
      'is_active': 1,
    });
  }

  static Future<int> _upsertYard(Transaction txn) async {
    final found = await txn.query(
      'scrapyards',
      columns: const <String>['id'],
      where: 'name = ?',
      whereArgs: const <Object?>['EH Recycling'],
      limit: 1,
    );
    if (found.isNotEmpty) return found.single['id'] as int;

    return txn.insert('scrapyards', <String, Object?>{
      'name': 'EH Recycling',
      'location': 'Vancouver, Washington',
      'notes': 'Enter current yard prices before relying on estimates.',
      'source_type': SourceType.manual.dbValue,
      'source_notes': 'Primary local yard entered by user.',
      'created_at': _now,
      'updated_at': _now,
      'is_active': 1,
    });
  }

  static Future<int> _upsertObject(Transaction txn, _SeedObject object) async {
    final found = await txn.query(
      'object_templates',
      columns: const <String>['id'],
      where: 'name = ? AND subtype = ?',
      whereArgs: <Object?>[object.name, object.subtype],
      limit: 1,
    );

    final values = <String, Object?>{
      'name': object.name,
      'subtype': object.subtype,
      'description': object.description,
      'whole_weight_low_g': object.lowG,
      'whole_weight_typical_g': object.typicalG,
      'whole_weight_high_g': object.highG,
      'weight_confidence': ConfidenceLevel.low.dbValue,
      'resale_check_required': object.resaleCheck ? 1 : 0,
      'tools_needed': object.tools,
      'safety_warnings': object.safety,
      'preparation_notes': object.preparation,
      'source_type': SourceType.seed.dbValue,
      'source_notes':
          'Broad starter range; calibrate from actual loads and receipts.',
      'seed_version': _seedVersion,
      'updated_at': _now,
      'is_active': 1,
    };

    if (found.isNotEmpty) {
      final id = found.single['id'] as int;
      await txn.update(
        'object_templates',
        values,
        where: 'id = ? AND source_type = ?',
        whereArgs: <Object?>[id, SourceType.seed.dbValue],
      );
      return id;
    }

    values['created_at'] = _now;
    return txn.insert('object_templates', values);
  }

  static const _categories = <String>[
    'Shred Steel',
    'Stainless Steel',
    'Clean Aluminum Wheel',
    'Electric Motors',
    'Transformers',
    'Insulated Copper Wire',
    'Power Cords',
    'Low Grade Circuit Boards',
    'Cast Iron',
  ];

  static const _objects = <_SeedObject>[
    _SeedObject(
      name: 'Microwave',
      description: 'Countertop or over-range household microwave.',
      lowG: 11300,
      typicalG: 15800,
      highG: 20400,
      tools: 'Screwdrivers, sockets, cutters',
      safety:
          'High-voltage capacitor may retain a dangerous charge. Do not touch or process the magnetron.',
      preparation:
          'Remove cord, transformer, board, and loose wire only if trained to work safely.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole microwave',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          11300,
          15800,
          20400,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Transformer',
          'Transformers',
          RecoveryLevel.quick,
          2200,
          3200,
          4500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.quick,
          180,
          320,
          500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          8500,
          11800,
          15300,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Transformer',
          'Transformers',
          RecoveryLevel.standard,
          2200,
          3200,
          4500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.standard,
          180,
          320,
          500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control board',
          'Low Grade Circuit Boards',
          RecoveryLevel.standard,
          90,
          220,
          400,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Insulated wire',
          'Insulated Copper Wire',
          RecoveryLevel.standard,
          220,
          450,
          700,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          7800,
          10800,
          14200,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Transformer',
          'Transformers',
          RecoveryLevel.deep,
          2200,
          3200,
          4500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord and wire',
          'Insulated Copper Wire',
          RecoveryLevel.deep,
          450,
          800,
          1200,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control board',
          'Low Grade Circuit Boards',
          RecoveryLevel.deep,
          90,
          220,
          400,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          7400,
          10200,
          13600,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Top-Load Washer',
      description: 'Household top-load washing machine.',
      lowG: 54400,
      typicalG: 68000,
      highG: 81600,
      tools: 'Sockets, screwdrivers, cutters',
      safety:
          'Heavy item. Use safe lifting methods and secure during transport.',
      preparation: 'Drain water and remove loose hoses before hauling.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole washer',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          54400,
          68000,
          81600,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.quick,
          4500,
          6800,
          9000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.quick,
          350,
          600,
          900,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          48000,
          59800,
          71000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.standard,
          4500,
          6800,
          9000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.standard,
          650,
          1200,
          2000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control board',
          'Low Grade Circuit Boards',
          RecoveryLevel.standard,
          80,
          220,
          500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          46500,
          57800,
          69000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.deep,
          4500,
          6800,
          9000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.deep,
          900,
          1600,
          2600,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control board',
          'Low Grade Circuit Boards',
          RecoveryLevel.deep,
          80,
          220,
          500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          45000,
          56000,
          67500,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Electric Dryer',
      description: 'Household electric clothes dryer.',
      lowG: 40800,
      typicalG: 52200,
      highG: 63500,
      tools: 'Sockets, screwdrivers, cutters',
      safety: 'Heavy and awkward. Watch sharp sheet-metal edges.',
      preparation: 'Remove lint and secure the door before transport.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole dryer',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          40800,
          52200,
          63500,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.quick,
          2700,
          4100,
          5500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.quick,
          450,
          850,
          1350,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          36000,
          45900,
          56000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.standard,
          2700,
          4100,
          5500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.standard,
          650,
          1200,
          2000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          35000,
          44500,
          54500,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Motor',
          'Electric Motors',
          RecoveryLevel.deep,
          2700,
          4100,
          5500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.deep,
          900,
          1500,
          2400,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          34000,
          43200,
          53000,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Dishwasher',
      description: 'Household built-in dishwasher.',
      lowG: 24900,
      typicalG: 34000,
      highG: 45400,
      tools: 'Sockets, screwdrivers, cutters',
      safety: 'Sharp sheet metal and broken glass may be present.',
      preparation: 'Drain water and remove detergent residue.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole dishwasher',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          24900,
          34000,
          45400,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Pump motor',
          'Electric Motors',
          RecoveryLevel.quick,
          1400,
          2600,
          4100,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.quick,
          180,
          350,
          600,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          22000,
          29800,
          40000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Pump motor',
          'Electric Motors',
          RecoveryLevel.standard,
          1400,
          2600,
          4100,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.standard,
          350,
          700,
          1200,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Stainless tub',
          'Stainless Steel',
          RecoveryLevel.standard,
          0,
          6000,
          14000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          14000,
          23200,
          36000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Pump motor',
          'Electric Motors',
          RecoveryLevel.deep,
          1400,
          2600,
          4100,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.deep,
          500,
          900,
          1500,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Stainless tub',
          'Stainless Steel',
          RecoveryLevel.deep,
          0,
          6500,
          15000,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          13000,
          22000,
          34500,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Electric Range',
      description: 'Household electric oven and range.',
      lowG: 59000,
      typicalG: 78000,
      highG: 99800,
      tools: 'Sockets, screwdrivers, cutters',
      safety: 'Very heavy. Glass cooktops can shatter.',
      preparation: 'Secure doors and racks before moving.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole range',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          59000,
          78000,
          99800,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Power cord',
          'Power Cords',
          RecoveryLevel.quick,
          650,
          1100,
          1800,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          56000,
          74400,
          95500,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.standard,
          900,
          1600,
          2700,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control boards',
          'Low Grade Circuit Boards',
          RecoveryLevel.standard,
          100,
          300,
          700,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          54500,
          72200,
          93000,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Wire and cord',
          'Insulated Copper Wire',
          RecoveryLevel.deep,
          1200,
          2100,
          3400,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Control boards',
          'Low Grade Circuit Boards',
          RecoveryLevel.deep,
          100,
          300,
          700,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          53000,
          70500,
          91500,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Steel BBQ Grill',
      description: 'Common steel outdoor barbecue grill.',
      lowG: 18100,
      typicalG: 29500,
      highG: 45400,
      tools: 'Sockets, penetrating oil, cutters',
      safety: 'Remove propane cylinder. Confirm no fuel remains.',
      preparation: 'Remove propane tank, ash, grease, and loose trash.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole grill',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          18100,
          29500,
          45400,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Cast iron grates',
          'Cast Iron',
          RecoveryLevel.quick,
          3600,
          6800,
          11300,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.quick,
          13500,
          21700,
          33500,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Cast iron grates',
          'Cast Iron',
          RecoveryLevel.standard,
          3600,
          6800,
          11300,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.standard,
          13000,
          21000,
          32500,
          YieldKind.remainder,
        ),
        _SeedComponent(
          'Cast iron grates',
          'Cast Iron',
          RecoveryLevel.deep,
          3600,
          6800,
          11300,
          YieldKind.recoveredComponent,
        ),
        _SeedComponent(
          'Steel remainder',
          'Shred Steel',
          RecoveryLevel.deep,
          12500,
          20200,
          31500,
          YieldKind.remainder,
        ),
      ],
    ),
    _SeedObject(
      name: 'Aluminum Car Wheel',
      description: 'Bare aluminum automotive wheel after tire removal.',
      lowG: 6800,
      typicalG: 9000,
      highG: 11300,
      resaleCheck: true,
      tools: 'Valve stem tool; tire removal service',
      safety: 'Account for tire-removal cost before pickup.',
      preparation:
          'Remove tire, valve stem, weights, and non-aluminum inserts.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Clean aluminum wheel',
          'Clean Aluminum Wheel',
          RecoveryLevel.sellWhole,
          6800,
          9000,
          11300,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Clean aluminum wheel',
          'Clean Aluminum Wheel',
          RecoveryLevel.quick,
          6800,
          9000,
          11300,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Clean aluminum wheel',
          'Clean Aluminum Wheel',
          RecoveryLevel.standard,
          6800,
          9000,
          11300,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Clean aluminum wheel',
          'Clean Aluminum Wheel',
          RecoveryLevel.deep,
          6800,
          9000,
          11300,
          YieldKind.wholeObject,
        ),
      ],
    ),
    _SeedObject(
      name: 'Four-Drawer Filing Cabinet',
      description: 'Standard vertical four-drawer steel filing cabinet.',
      lowG: 20400,
      typicalG: 29400,
      highG: 38500,
      tools: 'Screwdrivers or sockets',
      safety: 'Drawers shift weight and can slide during handling.',
      preparation: 'Remove contents and secure or remove drawers.',
      components: <_SeedComponent>[
        _SeedComponent(
          'Whole cabinet',
          'Shred Steel',
          RecoveryLevel.sellWhole,
          20400,
          29400,
          38500,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Steel cabinet',
          'Shred Steel',
          RecoveryLevel.quick,
          20400,
          29400,
          38500,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Steel cabinet',
          'Shred Steel',
          RecoveryLevel.standard,
          20400,
          29400,
          38500,
          YieldKind.wholeObject,
        ),
        _SeedComponent(
          'Steel cabinet',
          'Shred Steel',
          RecoveryLevel.deep,
          20400,
          29400,
          38500,
          YieldKind.wholeObject,
        ),
      ],
    ),
  ];
}

final class _SeedObject {
  const _SeedObject({
    required this.name,
    required this.description,
    required this.lowG,
    required this.typicalG,
    required this.highG,
    this.resaleCheck = false,
    required this.tools,
    required this.safety,
    required this.preparation,
    required this.components,
  });

  final String name;
  String get subtype => '';
  final String description;
  final int lowG;
  final int typicalG;
  final int highG;
  final bool resaleCheck;
  final String tools;
  final String safety;
  final String preparation;
  final List<_SeedComponent> components;
}

final class _SeedComponent {
  const _SeedComponent(
    this.name,
    this.category,
    this.level,
    this.lowG,
    this.typicalG,
    this.highG,
    this.kind,
  );

  final String name;
  final String category;
  final RecoveryLevel level;
  final int lowG;
  final int typicalG;
  final int highG;
  final YieldKind kind;
}
