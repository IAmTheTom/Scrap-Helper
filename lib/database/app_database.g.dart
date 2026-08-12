// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VehiclesTable extends Vehicles
    with TableInfo<$VehiclesTable, VehicleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mpgMeta = const VerificationMeta('mpg');
  @override
  late final GeneratedColumn<double> mpg = GeneratedColumn<double>(
    'mpg',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cargoLengthMeta = const VerificationMeta(
    'cargoLength',
  );
  @override
  late final GeneratedColumn<double> cargoLength = GeneratedColumn<double>(
    'cargo_length',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cargoWidthMeta = const VerificationMeta(
    'cargoWidth',
  );
  @override
  late final GeneratedColumn<double> cargoWidth = GeneratedColumn<double>(
    'cargo_width',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cargoHeightMeta = const VerificationMeta(
    'cargoHeight',
  );
  @override
  late final GeneratedColumn<double> cargoHeight = GeneratedColumn<double>(
    'cargo_height',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadLimitMeta = const VerificationMeta(
    'payloadLimit',
  );
  @override
  late final GeneratedColumn<double> payloadLimit = GeneratedColumn<double>(
    'payload_limit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fullCargoMeta = const VerificationMeta(
    'fullCargo',
  );
  @override
  late final GeneratedColumn<int> fullCargo = GeneratedColumn<int>(
    'full_cargo',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _largeUprightMeta = const VerificationMeta(
    'largeUpright',
  );
  @override
  late final GeneratedColumn<int> largeUpright = GeneratedColumn<int>(
    'large_upright',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _mediumMeta = const VerificationMeta('medium');
  @override
  late final GeneratedColumn<int> medium = GeneratedColumn<int>(
    'medium',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    mpg,
    cargoLength,
    cargoWidth,
    cargoHeight,
    payloadLimit,
    fullCargo,
    largeUpright,
    medium,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('mpg')) {
      context.handle(
        _mpgMeta,
        mpg.isAcceptableOrUnknown(data['mpg']!, _mpgMeta),
      );
    } else if (isInserting) {
      context.missing(_mpgMeta);
    }
    if (data.containsKey('cargo_length')) {
      context.handle(
        _cargoLengthMeta,
        cargoLength.isAcceptableOrUnknown(
          data['cargo_length']!,
          _cargoLengthMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cargoLengthMeta);
    }
    if (data.containsKey('cargo_width')) {
      context.handle(
        _cargoWidthMeta,
        cargoWidth.isAcceptableOrUnknown(data['cargo_width']!, _cargoWidthMeta),
      );
    } else if (isInserting) {
      context.missing(_cargoWidthMeta);
    }
    if (data.containsKey('cargo_height')) {
      context.handle(
        _cargoHeightMeta,
        cargoHeight.isAcceptableOrUnknown(
          data['cargo_height']!,
          _cargoHeightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cargoHeightMeta);
    }
    if (data.containsKey('payload_limit')) {
      context.handle(
        _payloadLimitMeta,
        payloadLimit.isAcceptableOrUnknown(
          data['payload_limit']!,
          _payloadLimitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_payloadLimitMeta);
    }
    if (data.containsKey('full_cargo')) {
      context.handle(
        _fullCargoMeta,
        fullCargo.isAcceptableOrUnknown(data['full_cargo']!, _fullCargoMeta),
      );
    } else if (isInserting) {
      context.missing(_fullCargoMeta);
    }
    if (data.containsKey('large_upright')) {
      context.handle(
        _largeUprightMeta,
        largeUpright.isAcceptableOrUnknown(
          data['large_upright']!,
          _largeUprightMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_largeUprightMeta);
    }
    if (data.containsKey('medium')) {
      context.handle(
        _mediumMeta,
        medium.isAcceptableOrUnknown(data['medium']!, _mediumMeta),
      );
    } else if (isInserting) {
      context.missing(_mediumMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      mpg: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}mpg'],
      )!,
      cargoLength: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cargo_length'],
      )!,
      cargoWidth: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cargo_width'],
      )!,
      cargoHeight: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cargo_height'],
      )!,
      payloadLimit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}payload_limit'],
      )!,
      fullCargo: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}full_cargo'],
      )!,
      largeUpright: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}large_upright'],
      )!,
      medium: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}medium'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

class VehicleRow extends DataClass implements Insertable<VehicleRow> {
  final String id;
  final String name;
  final String type;
  final double mpg;
  final double cargoLength;
  final double cargoWidth;
  final double cargoHeight;
  final double payloadLimit;
  final int fullCargo;
  final int largeUpright;
  final int medium;
  final String notes;
  const VehicleRow({
    required this.id,
    required this.name,
    required this.type,
    required this.mpg,
    required this.cargoLength,
    required this.cargoWidth,
    required this.cargoHeight,
    required this.payloadLimit,
    required this.fullCargo,
    required this.largeUpright,
    required this.medium,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['mpg'] = Variable<double>(mpg);
    map['cargo_length'] = Variable<double>(cargoLength);
    map['cargo_width'] = Variable<double>(cargoWidth);
    map['cargo_height'] = Variable<double>(cargoHeight);
    map['payload_limit'] = Variable<double>(payloadLimit);
    map['full_cargo'] = Variable<int>(fullCargo);
    map['large_upright'] = Variable<int>(largeUpright);
    map['medium'] = Variable<int>(medium);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      mpg: Value(mpg),
      cargoLength: Value(cargoLength),
      cargoWidth: Value(cargoWidth),
      cargoHeight: Value(cargoHeight),
      payloadLimit: Value(payloadLimit),
      fullCargo: Value(fullCargo),
      largeUpright: Value(largeUpright),
      medium: Value(medium),
      notes: Value(notes),
    );
  }

  factory VehicleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      mpg: serializer.fromJson<double>(json['mpg']),
      cargoLength: serializer.fromJson<double>(json['cargoLength']),
      cargoWidth: serializer.fromJson<double>(json['cargoWidth']),
      cargoHeight: serializer.fromJson<double>(json['cargoHeight']),
      payloadLimit: serializer.fromJson<double>(json['payloadLimit']),
      fullCargo: serializer.fromJson<int>(json['fullCargo']),
      largeUpright: serializer.fromJson<int>(json['largeUpright']),
      medium: serializer.fromJson<int>(json['medium']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'mpg': serializer.toJson<double>(mpg),
      'cargoLength': serializer.toJson<double>(cargoLength),
      'cargoWidth': serializer.toJson<double>(cargoWidth),
      'cargoHeight': serializer.toJson<double>(cargoHeight),
      'payloadLimit': serializer.toJson<double>(payloadLimit),
      'fullCargo': serializer.toJson<int>(fullCargo),
      'largeUpright': serializer.toJson<int>(largeUpright),
      'medium': serializer.toJson<int>(medium),
      'notes': serializer.toJson<String>(notes),
    };
  }

  VehicleRow copyWith({
    String? id,
    String? name,
    String? type,
    double? mpg,
    double? cargoLength,
    double? cargoWidth,
    double? cargoHeight,
    double? payloadLimit,
    int? fullCargo,
    int? largeUpright,
    int? medium,
    String? notes,
  }) => VehicleRow(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    mpg: mpg ?? this.mpg,
    cargoLength: cargoLength ?? this.cargoLength,
    cargoWidth: cargoWidth ?? this.cargoWidth,
    cargoHeight: cargoHeight ?? this.cargoHeight,
    payloadLimit: payloadLimit ?? this.payloadLimit,
    fullCargo: fullCargo ?? this.fullCargo,
    largeUpright: largeUpright ?? this.largeUpright,
    medium: medium ?? this.medium,
    notes: notes ?? this.notes,
  );
  VehicleRow copyWithCompanion(VehiclesCompanion data) {
    return VehicleRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      mpg: data.mpg.present ? data.mpg.value : this.mpg,
      cargoLength: data.cargoLength.present
          ? data.cargoLength.value
          : this.cargoLength,
      cargoWidth: data.cargoWidth.present
          ? data.cargoWidth.value
          : this.cargoWidth,
      cargoHeight: data.cargoHeight.present
          ? data.cargoHeight.value
          : this.cargoHeight,
      payloadLimit: data.payloadLimit.present
          ? data.payloadLimit.value
          : this.payloadLimit,
      fullCargo: data.fullCargo.present ? data.fullCargo.value : this.fullCargo,
      largeUpright: data.largeUpright.present
          ? data.largeUpright.value
          : this.largeUpright,
      medium: data.medium.present ? data.medium.value : this.medium,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('mpg: $mpg, ')
          ..write('cargoLength: $cargoLength, ')
          ..write('cargoWidth: $cargoWidth, ')
          ..write('cargoHeight: $cargoHeight, ')
          ..write('payloadLimit: $payloadLimit, ')
          ..write('fullCargo: $fullCargo, ')
          ..write('largeUpright: $largeUpright, ')
          ..write('medium: $medium, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    mpg,
    cargoLength,
    cargoWidth,
    cargoHeight,
    payloadLimit,
    fullCargo,
    largeUpright,
    medium,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.mpg == this.mpg &&
          other.cargoLength == this.cargoLength &&
          other.cargoWidth == this.cargoWidth &&
          other.cargoHeight == this.cargoHeight &&
          other.payloadLimit == this.payloadLimit &&
          other.fullCargo == this.fullCargo &&
          other.largeUpright == this.largeUpright &&
          other.medium == this.medium &&
          other.notes == this.notes);
}

class VehiclesCompanion extends UpdateCompanion<VehicleRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<double> mpg;
  final Value<double> cargoLength;
  final Value<double> cargoWidth;
  final Value<double> cargoHeight;
  final Value<double> payloadLimit;
  final Value<int> fullCargo;
  final Value<int> largeUpright;
  final Value<int> medium;
  final Value<String> notes;
  final Value<int> rowid;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.mpg = const Value.absent(),
    this.cargoLength = const Value.absent(),
    this.cargoWidth = const Value.absent(),
    this.cargoHeight = const Value.absent(),
    this.payloadLimit = const Value.absent(),
    this.fullCargo = const Value.absent(),
    this.largeUpright = const Value.absent(),
    this.medium = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehiclesCompanion.insert({
    required String id,
    required String name,
    required String type,
    required double mpg,
    required double cargoLength,
    required double cargoWidth,
    required double cargoHeight,
    required double payloadLimit,
    required int fullCargo,
    required int largeUpright,
    required int medium,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type),
       mpg = Value(mpg),
       cargoLength = Value(cargoLength),
       cargoWidth = Value(cargoWidth),
       cargoHeight = Value(cargoHeight),
       payloadLimit = Value(payloadLimit),
       fullCargo = Value(fullCargo),
       largeUpright = Value(largeUpright),
       medium = Value(medium),
       notes = Value(notes);
  static Insertable<VehicleRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<double>? mpg,
    Expression<double>? cargoLength,
    Expression<double>? cargoWidth,
    Expression<double>? cargoHeight,
    Expression<double>? payloadLimit,
    Expression<int>? fullCargo,
    Expression<int>? largeUpright,
    Expression<int>? medium,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (mpg != null) 'mpg': mpg,
      if (cargoLength != null) 'cargo_length': cargoLength,
      if (cargoWidth != null) 'cargo_width': cargoWidth,
      if (cargoHeight != null) 'cargo_height': cargoHeight,
      if (payloadLimit != null) 'payload_limit': payloadLimit,
      if (fullCargo != null) 'full_cargo': fullCargo,
      if (largeUpright != null) 'large_upright': largeUpright,
      if (medium != null) 'medium': medium,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehiclesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<double>? mpg,
    Value<double>? cargoLength,
    Value<double>? cargoWidth,
    Value<double>? cargoHeight,
    Value<double>? payloadLimit,
    Value<int>? fullCargo,
    Value<int>? largeUpright,
    Value<int>? medium,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return VehiclesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      mpg: mpg ?? this.mpg,
      cargoLength: cargoLength ?? this.cargoLength,
      cargoWidth: cargoWidth ?? this.cargoWidth,
      cargoHeight: cargoHeight ?? this.cargoHeight,
      payloadLimit: payloadLimit ?? this.payloadLimit,
      fullCargo: fullCargo ?? this.fullCargo,
      largeUpright: largeUpright ?? this.largeUpright,
      medium: medium ?? this.medium,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (mpg.present) {
      map['mpg'] = Variable<double>(mpg.value);
    }
    if (cargoLength.present) {
      map['cargo_length'] = Variable<double>(cargoLength.value);
    }
    if (cargoWidth.present) {
      map['cargo_width'] = Variable<double>(cargoWidth.value);
    }
    if (cargoHeight.present) {
      map['cargo_height'] = Variable<double>(cargoHeight.value);
    }
    if (payloadLimit.present) {
      map['payload_limit'] = Variable<double>(payloadLimit.value);
    }
    if (fullCargo.present) {
      map['full_cargo'] = Variable<int>(fullCargo.value);
    }
    if (largeUpright.present) {
      map['large_upright'] = Variable<int>(largeUpright.value);
    }
    if (medium.present) {
      map['medium'] = Variable<int>(medium.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('mpg: $mpg, ')
          ..write('cargoLength: $cargoLength, ')
          ..write('cargoWidth: $cargoWidth, ')
          ..write('cargoHeight: $cargoHeight, ')
          ..write('payloadLimit: $payloadLimit, ')
          ..write('fullCargo: $fullCargo, ')
          ..write('largeUpright: $largeUpright, ')
          ..write('medium: $medium, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $YardsTable extends Yards with TableInfo<$YardsTable, YardRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $YardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityStateZipMeta = const VerificationMeta(
    'cityStateZip',
  );
  @override
  late final GeneratedColumn<String> cityStateZip = GeneratedColumn<String>(
    'city_state_zip',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
    'phone',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hoursMeta = const VerificationMeta('hours');
  @override
  late final GeneratedColumn<String> hours = GeneratedColumn<String>(
    'hours',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _preferredMeta = const VerificationMeta(
    'preferred',
  );
  @override
  late final GeneratedColumn<bool> preferred = GeneratedColumn<bool>(
    'preferred',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("preferred" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    address,
    cityStateZip,
    phone,
    hours,
    notes,
    preferred,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'yards';
  @override
  VerificationContext validateIntegrity(
    Insertable<YardRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('city_state_zip')) {
      context.handle(
        _cityStateZipMeta,
        cityStateZip.isAcceptableOrUnknown(
          data['city_state_zip']!,
          _cityStateZipMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cityStateZipMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
        _phoneMeta,
        phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta),
      );
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('hours')) {
      context.handle(
        _hoursMeta,
        hours.isAcceptableOrUnknown(data['hours']!, _hoursMeta),
      );
    } else if (isInserting) {
      context.missing(_hoursMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('preferred')) {
      context.handle(
        _preferredMeta,
        preferred.isAcceptableOrUnknown(data['preferred']!, _preferredMeta),
      );
    } else if (isInserting) {
      context.missing(_preferredMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  YardRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return YardRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      cityStateZip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_state_zip'],
      )!,
      phone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}phone'],
      )!,
      hours: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hours'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      preferred: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}preferred'],
      )!,
    );
  }

  @override
  $YardsTable createAlias(String alias) {
    return $YardsTable(attachedDatabase, alias);
  }
}

class YardRow extends DataClass implements Insertable<YardRow> {
  final String id;
  final String name;
  final String address;
  final String cityStateZip;
  final String phone;
  final String hours;
  final String notes;
  final bool preferred;
  const YardRow({
    required this.id,
    required this.name,
    required this.address,
    required this.cityStateZip,
    required this.phone,
    required this.hours,
    required this.notes,
    required this.preferred,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['address'] = Variable<String>(address);
    map['city_state_zip'] = Variable<String>(cityStateZip);
    map['phone'] = Variable<String>(phone);
    map['hours'] = Variable<String>(hours);
    map['notes'] = Variable<String>(notes);
    map['preferred'] = Variable<bool>(preferred);
    return map;
  }

  YardsCompanion toCompanion(bool nullToAbsent) {
    return YardsCompanion(
      id: Value(id),
      name: Value(name),
      address: Value(address),
      cityStateZip: Value(cityStateZip),
      phone: Value(phone),
      hours: Value(hours),
      notes: Value(notes),
      preferred: Value(preferred),
    );
  }

  factory YardRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return YardRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      address: serializer.fromJson<String>(json['address']),
      cityStateZip: serializer.fromJson<String>(json['cityStateZip']),
      phone: serializer.fromJson<String>(json['phone']),
      hours: serializer.fromJson<String>(json['hours']),
      notes: serializer.fromJson<String>(json['notes']),
      preferred: serializer.fromJson<bool>(json['preferred']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'address': serializer.toJson<String>(address),
      'cityStateZip': serializer.toJson<String>(cityStateZip),
      'phone': serializer.toJson<String>(phone),
      'hours': serializer.toJson<String>(hours),
      'notes': serializer.toJson<String>(notes),
      'preferred': serializer.toJson<bool>(preferred),
    };
  }

  YardRow copyWith({
    String? id,
    String? name,
    String? address,
    String? cityStateZip,
    String? phone,
    String? hours,
    String? notes,
    bool? preferred,
  }) => YardRow(
    id: id ?? this.id,
    name: name ?? this.name,
    address: address ?? this.address,
    cityStateZip: cityStateZip ?? this.cityStateZip,
    phone: phone ?? this.phone,
    hours: hours ?? this.hours,
    notes: notes ?? this.notes,
    preferred: preferred ?? this.preferred,
  );
  YardRow copyWithCompanion(YardsCompanion data) {
    return YardRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      address: data.address.present ? data.address.value : this.address,
      cityStateZip: data.cityStateZip.present
          ? data.cityStateZip.value
          : this.cityStateZip,
      phone: data.phone.present ? data.phone.value : this.phone,
      hours: data.hours.present ? data.hours.value : this.hours,
      notes: data.notes.present ? data.notes.value : this.notes,
      preferred: data.preferred.present ? data.preferred.value : this.preferred,
    );
  }

  @override
  String toString() {
    return (StringBuffer('YardRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('cityStateZip: $cityStateZip, ')
          ..write('phone: $phone, ')
          ..write('hours: $hours, ')
          ..write('notes: $notes, ')
          ..write('preferred: $preferred')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    address,
    cityStateZip,
    phone,
    hours,
    notes,
    preferred,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YardRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.address == this.address &&
          other.cityStateZip == this.cityStateZip &&
          other.phone == this.phone &&
          other.hours == this.hours &&
          other.notes == this.notes &&
          other.preferred == this.preferred);
}

class YardsCompanion extends UpdateCompanion<YardRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> address;
  final Value<String> cityStateZip;
  final Value<String> phone;
  final Value<String> hours;
  final Value<String> notes;
  final Value<bool> preferred;
  final Value<int> rowid;
  const YardsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.address = const Value.absent(),
    this.cityStateZip = const Value.absent(),
    this.phone = const Value.absent(),
    this.hours = const Value.absent(),
    this.notes = const Value.absent(),
    this.preferred = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  YardsCompanion.insert({
    required String id,
    required String name,
    required String address,
    required String cityStateZip,
    required String phone,
    required String hours,
    required String notes,
    required bool preferred,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       address = Value(address),
       cityStateZip = Value(cityStateZip),
       phone = Value(phone),
       hours = Value(hours),
       notes = Value(notes),
       preferred = Value(preferred);
  static Insertable<YardRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? address,
    Expression<String>? cityStateZip,
    Expression<String>? phone,
    Expression<String>? hours,
    Expression<String>? notes,
    Expression<bool>? preferred,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (address != null) 'address': address,
      if (cityStateZip != null) 'city_state_zip': cityStateZip,
      if (phone != null) 'phone': phone,
      if (hours != null) 'hours': hours,
      if (notes != null) 'notes': notes,
      if (preferred != null) 'preferred': preferred,
      if (rowid != null) 'rowid': rowid,
    });
  }

  YardsCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? address,
    Value<String>? cityStateZip,
    Value<String>? phone,
    Value<String>? hours,
    Value<String>? notes,
    Value<bool>? preferred,
    Value<int>? rowid,
  }) {
    return YardsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      address: address ?? this.address,
      cityStateZip: cityStateZip ?? this.cityStateZip,
      phone: phone ?? this.phone,
      hours: hours ?? this.hours,
      notes: notes ?? this.notes,
      preferred: preferred ?? this.preferred,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (cityStateZip.present) {
      map['city_state_zip'] = Variable<String>(cityStateZip.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (hours.present) {
      map['hours'] = Variable<String>(hours.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (preferred.present) {
      map['preferred'] = Variable<bool>(preferred.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('YardsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('address: $address, ')
          ..write('cityStateZip: $cityStateZip, ')
          ..write('phone: $phone, ')
          ..write('hours: $hours, ')
          ..write('notes: $notes, ')
          ..write('preferred: $preferred, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $YardPricesTable extends YardPrices
    with TableInfo<$YardPricesTable, YardPriceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $YardPricesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yardIdMeta = const VerificationMeta('yardId');
  @override
  late final GeneratedColumn<String> yardId = GeneratedColumn<String>(
    'yard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES yards (id)',
    ),
  );
  static const VerificationMeta _materialMeta = const VerificationMeta(
    'material',
  );
  @override
  late final GeneratedColumn<String> material = GeneratedColumn<String>(
    'material',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
    'price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    yardId,
    material,
    price,
    unit,
    updatedAt,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'yard_prices';
  @override
  VerificationContext validateIntegrity(
    Insertable<YardPriceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('yard_id')) {
      context.handle(
        _yardIdMeta,
        yardId.isAcceptableOrUnknown(data['yard_id']!, _yardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_yardIdMeta);
    }
    if (data.containsKey('material')) {
      context.handle(
        _materialMeta,
        material.isAcceptableOrUnknown(data['material']!, _materialMeta),
      );
    } else if (isInserting) {
      context.missing(_materialMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
        _priceMeta,
        price.isAcceptableOrUnknown(data['price']!, _priceMeta),
      );
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  YardPriceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return YardPriceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      yardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}yard_id'],
      )!,
      material: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}material'],
      )!,
      price: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}price'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $YardPricesTable createAlias(String alias) {
    return $YardPricesTable(attachedDatabase, alias);
  }
}

class YardPriceRow extends DataClass implements Insertable<YardPriceRow> {
  final String id;
  final String yardId;
  final String material;
  final double price;
  final String unit;
  final DateTime updatedAt;
  final String notes;
  const YardPriceRow({
    required this.id,
    required this.yardId,
    required this.material,
    required this.price,
    required this.unit,
    required this.updatedAt,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['yard_id'] = Variable<String>(yardId);
    map['material'] = Variable<String>(material);
    map['price'] = Variable<double>(price);
    map['unit'] = Variable<String>(unit);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  YardPricesCompanion toCompanion(bool nullToAbsent) {
    return YardPricesCompanion(
      id: Value(id),
      yardId: Value(yardId),
      material: Value(material),
      price: Value(price),
      unit: Value(unit),
      updatedAt: Value(updatedAt),
      notes: Value(notes),
    );
  }

  factory YardPriceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return YardPriceRow(
      id: serializer.fromJson<String>(json['id']),
      yardId: serializer.fromJson<String>(json['yardId']),
      material: serializer.fromJson<String>(json['material']),
      price: serializer.fromJson<double>(json['price']),
      unit: serializer.fromJson<String>(json['unit']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'yardId': serializer.toJson<String>(yardId),
      'material': serializer.toJson<String>(material),
      'price': serializer.toJson<double>(price),
      'unit': serializer.toJson<String>(unit),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'notes': serializer.toJson<String>(notes),
    };
  }

  YardPriceRow copyWith({
    String? id,
    String? yardId,
    String? material,
    double? price,
    String? unit,
    DateTime? updatedAt,
    String? notes,
  }) => YardPriceRow(
    id: id ?? this.id,
    yardId: yardId ?? this.yardId,
    material: material ?? this.material,
    price: price ?? this.price,
    unit: unit ?? this.unit,
    updatedAt: updatedAt ?? this.updatedAt,
    notes: notes ?? this.notes,
  );
  YardPriceRow copyWithCompanion(YardPricesCompanion data) {
    return YardPriceRow(
      id: data.id.present ? data.id.value : this.id,
      yardId: data.yardId.present ? data.yardId.value : this.yardId,
      material: data.material.present ? data.material.value : this.material,
      price: data.price.present ? data.price.value : this.price,
      unit: data.unit.present ? data.unit.value : this.unit,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('YardPriceRow(')
          ..write('id: $id, ')
          ..write('yardId: $yardId, ')
          ..write('material: $material, ')
          ..write('price: $price, ')
          ..write('unit: $unit, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, yardId, material, price, unit, updatedAt, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is YardPriceRow &&
          other.id == this.id &&
          other.yardId == this.yardId &&
          other.material == this.material &&
          other.price == this.price &&
          other.unit == this.unit &&
          other.updatedAt == this.updatedAt &&
          other.notes == this.notes);
}

class YardPricesCompanion extends UpdateCompanion<YardPriceRow> {
  final Value<String> id;
  final Value<String> yardId;
  final Value<String> material;
  final Value<double> price;
  final Value<String> unit;
  final Value<DateTime> updatedAt;
  final Value<String> notes;
  final Value<int> rowid;
  const YardPricesCompanion({
    this.id = const Value.absent(),
    this.yardId = const Value.absent(),
    this.material = const Value.absent(),
    this.price = const Value.absent(),
    this.unit = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  YardPricesCompanion.insert({
    required String id,
    required String yardId,
    required String material,
    required double price,
    required String unit,
    required DateTime updatedAt,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       yardId = Value(yardId),
       material = Value(material),
       price = Value(price),
       unit = Value(unit),
       updatedAt = Value(updatedAt),
       notes = Value(notes);
  static Insertable<YardPriceRow> custom({
    Expression<String>? id,
    Expression<String>? yardId,
    Expression<String>? material,
    Expression<double>? price,
    Expression<String>? unit,
    Expression<DateTime>? updatedAt,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (yardId != null) 'yard_id': yardId,
      if (material != null) 'material': material,
      if (price != null) 'price': price,
      if (unit != null) 'unit': unit,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  YardPricesCompanion copyWith({
    Value<String>? id,
    Value<String>? yardId,
    Value<String>? material,
    Value<double>? price,
    Value<String>? unit,
    Value<DateTime>? updatedAt,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return YardPricesCompanion(
      id: id ?? this.id,
      yardId: yardId ?? this.yardId,
      material: material ?? this.material,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      updatedAt: updatedAt ?? this.updatedAt,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (yardId.present) {
      map['yard_id'] = Variable<String>(yardId.value);
    }
    if (material.present) {
      map['material'] = Variable<String>(material.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('YardPricesCompanion(')
          ..write('id: $id, ')
          ..write('yardId: $yardId, ')
          ..write('material: $material, ')
          ..write('price: $price, ')
          ..write('unit: $unit, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchSourcesTable extends SearchSources
    with TableInfo<$SearchSourcesTable, SearchSourceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _defaultRadiusMeta = const VerificationMeta(
    'defaultRadius',
  );
  @override
  late final GeneratedColumn<double> defaultRadius = GeneratedColumn<double>(
    'default_radius',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _supportsDirectLinkMeta =
      const VerificationMeta('supportsDirectLink');
  @override
  late final GeneratedColumn<bool> supportsDirectLink = GeneratedColumn<bool>(
    'supports_direct_link',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_direct_link" IN (0, 1))',
    ),
  );
  static const VerificationMeta _supportsManualEntryMeta =
      const VerificationMeta('supportsManualEntry');
  @override
  late final GeneratedColumn<bool> supportsManualEntry = GeneratedColumn<bool>(
    'supports_manual_entry',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("supports_manual_entry" IN (0, 1))',
    ),
  );
  static const VerificationMeta _supportsNotificationsMeta =
      const VerificationMeta('supportsNotifications');
  @override
  late final GeneratedColumn<bool> supportsNotifications =
      GeneratedColumn<bool>(
        'supports_notifications',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("supports_notifications" IN (0, 1))',
        ),
      );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    type,
    enabled,
    defaultRadius,
    supportsDirectLink,
    supportsManualEntry,
    supportsNotifications,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchSourceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    if (data.containsKey('default_radius')) {
      context.handle(
        _defaultRadiusMeta,
        defaultRadius.isAcceptableOrUnknown(
          data['default_radius']!,
          _defaultRadiusMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultRadiusMeta);
    }
    if (data.containsKey('supports_direct_link')) {
      context.handle(
        _supportsDirectLinkMeta,
        supportsDirectLink.isAcceptableOrUnknown(
          data['supports_direct_link']!,
          _supportsDirectLinkMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supportsDirectLinkMeta);
    }
    if (data.containsKey('supports_manual_entry')) {
      context.handle(
        _supportsManualEntryMeta,
        supportsManualEntry.isAcceptableOrUnknown(
          data['supports_manual_entry']!,
          _supportsManualEntryMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supportsManualEntryMeta);
    }
    if (data.containsKey('supports_notifications')) {
      context.handle(
        _supportsNotificationsMeta,
        supportsNotifications.isAcceptableOrUnknown(
          data['supports_notifications']!,
          _supportsNotificationsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_supportsNotificationsMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchSourceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchSourceRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
      defaultRadius: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}default_radius'],
      )!,
      supportsDirectLink: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_direct_link'],
      )!,
      supportsManualEntry: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_manual_entry'],
      )!,
      supportsNotifications: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}supports_notifications'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $SearchSourcesTable createAlias(String alias) {
    return $SearchSourcesTable(attachedDatabase, alias);
  }
}

class SearchSourceRow extends DataClass implements Insertable<SearchSourceRow> {
  final String id;
  final String name;
  final String type;
  final bool enabled;
  final double defaultRadius;
  final bool supportsDirectLink;
  final bool supportsManualEntry;
  final bool supportsNotifications;
  final String notes;
  const SearchSourceRow({
    required this.id,
    required this.name,
    required this.type,
    required this.enabled,
    required this.defaultRadius,
    required this.supportsDirectLink,
    required this.supportsManualEntry,
    required this.supportsNotifications,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['enabled'] = Variable<bool>(enabled);
    map['default_radius'] = Variable<double>(defaultRadius);
    map['supports_direct_link'] = Variable<bool>(supportsDirectLink);
    map['supports_manual_entry'] = Variable<bool>(supportsManualEntry);
    map['supports_notifications'] = Variable<bool>(supportsNotifications);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  SearchSourcesCompanion toCompanion(bool nullToAbsent) {
    return SearchSourcesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      enabled: Value(enabled),
      defaultRadius: Value(defaultRadius),
      supportsDirectLink: Value(supportsDirectLink),
      supportsManualEntry: Value(supportsManualEntry),
      supportsNotifications: Value(supportsNotifications),
      notes: Value(notes),
    );
  }

  factory SearchSourceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchSourceRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      defaultRadius: serializer.fromJson<double>(json['defaultRadius']),
      supportsDirectLink: serializer.fromJson<bool>(json['supportsDirectLink']),
      supportsManualEntry: serializer.fromJson<bool>(
        json['supportsManualEntry'],
      ),
      supportsNotifications: serializer.fromJson<bool>(
        json['supportsNotifications'],
      ),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'enabled': serializer.toJson<bool>(enabled),
      'defaultRadius': serializer.toJson<double>(defaultRadius),
      'supportsDirectLink': serializer.toJson<bool>(supportsDirectLink),
      'supportsManualEntry': serializer.toJson<bool>(supportsManualEntry),
      'supportsNotifications': serializer.toJson<bool>(supportsNotifications),
      'notes': serializer.toJson<String>(notes),
    };
  }

  SearchSourceRow copyWith({
    String? id,
    String? name,
    String? type,
    bool? enabled,
    double? defaultRadius,
    bool? supportsDirectLink,
    bool? supportsManualEntry,
    bool? supportsNotifications,
    String? notes,
  }) => SearchSourceRow(
    id: id ?? this.id,
    name: name ?? this.name,
    type: type ?? this.type,
    enabled: enabled ?? this.enabled,
    defaultRadius: defaultRadius ?? this.defaultRadius,
    supportsDirectLink: supportsDirectLink ?? this.supportsDirectLink,
    supportsManualEntry: supportsManualEntry ?? this.supportsManualEntry,
    supportsNotifications: supportsNotifications ?? this.supportsNotifications,
    notes: notes ?? this.notes,
  );
  SearchSourceRow copyWithCompanion(SearchSourcesCompanion data) {
    return SearchSourceRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
      defaultRadius: data.defaultRadius.present
          ? data.defaultRadius.value
          : this.defaultRadius,
      supportsDirectLink: data.supportsDirectLink.present
          ? data.supportsDirectLink.value
          : this.supportsDirectLink,
      supportsManualEntry: data.supportsManualEntry.present
          ? data.supportsManualEntry.value
          : this.supportsManualEntry,
      supportsNotifications: data.supportsNotifications.present
          ? data.supportsNotifications.value
          : this.supportsNotifications,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchSourceRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('defaultRadius: $defaultRadius, ')
          ..write('supportsDirectLink: $supportsDirectLink, ')
          ..write('supportsManualEntry: $supportsManualEntry, ')
          ..write('supportsNotifications: $supportsNotifications, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    type,
    enabled,
    defaultRadius,
    supportsDirectLink,
    supportsManualEntry,
    supportsNotifications,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchSourceRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.enabled == this.enabled &&
          other.defaultRadius == this.defaultRadius &&
          other.supportsDirectLink == this.supportsDirectLink &&
          other.supportsManualEntry == this.supportsManualEntry &&
          other.supportsNotifications == this.supportsNotifications &&
          other.notes == this.notes);
}

class SearchSourcesCompanion extends UpdateCompanion<SearchSourceRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> type;
  final Value<bool> enabled;
  final Value<double> defaultRadius;
  final Value<bool> supportsDirectLink;
  final Value<bool> supportsManualEntry;
  final Value<bool> supportsNotifications;
  final Value<String> notes;
  final Value<int> rowid;
  const SearchSourcesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.enabled = const Value.absent(),
    this.defaultRadius = const Value.absent(),
    this.supportsDirectLink = const Value.absent(),
    this.supportsManualEntry = const Value.absent(),
    this.supportsNotifications = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchSourcesCompanion.insert({
    required String id,
    required String name,
    required String type,
    required bool enabled,
    required double defaultRadius,
    required bool supportsDirectLink,
    required bool supportsManualEntry,
    required bool supportsNotifications,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       type = Value(type),
       enabled = Value(enabled),
       defaultRadius = Value(defaultRadius),
       supportsDirectLink = Value(supportsDirectLink),
       supportsManualEntry = Value(supportsManualEntry),
       supportsNotifications = Value(supportsNotifications),
       notes = Value(notes);
  static Insertable<SearchSourceRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<bool>? enabled,
    Expression<double>? defaultRadius,
    Expression<bool>? supportsDirectLink,
    Expression<bool>? supportsManualEntry,
    Expression<bool>? supportsNotifications,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (enabled != null) 'enabled': enabled,
      if (defaultRadius != null) 'default_radius': defaultRadius,
      if (supportsDirectLink != null)
        'supports_direct_link': supportsDirectLink,
      if (supportsManualEntry != null)
        'supports_manual_entry': supportsManualEntry,
      if (supportsNotifications != null)
        'supports_notifications': supportsNotifications,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchSourcesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? type,
    Value<bool>? enabled,
    Value<double>? defaultRadius,
    Value<bool>? supportsDirectLink,
    Value<bool>? supportsManualEntry,
    Value<bool>? supportsNotifications,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return SearchSourcesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      enabled: enabled ?? this.enabled,
      defaultRadius: defaultRadius ?? this.defaultRadius,
      supportsDirectLink: supportsDirectLink ?? this.supportsDirectLink,
      supportsManualEntry: supportsManualEntry ?? this.supportsManualEntry,
      supportsNotifications:
          supportsNotifications ?? this.supportsNotifications,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (defaultRadius.present) {
      map['default_radius'] = Variable<double>(defaultRadius.value);
    }
    if (supportsDirectLink.present) {
      map['supports_direct_link'] = Variable<bool>(supportsDirectLink.value);
    }
    if (supportsManualEntry.present) {
      map['supports_manual_entry'] = Variable<bool>(supportsManualEntry.value);
    }
    if (supportsNotifications.present) {
      map['supports_notifications'] = Variable<bool>(
        supportsNotifications.value,
      );
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchSourcesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('enabled: $enabled, ')
          ..write('defaultRadius: $defaultRadius, ')
          ..write('supportsDirectLink: $supportsDirectLink, ')
          ..write('supportsManualEntry: $supportsManualEntry, ')
          ..write('supportsNotifications: $supportsNotifications, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchRulesTable extends SearchRules
    with TableInfo<$SearchRulesTable, SearchRuleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchRulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _keywordsMeta = const VerificationMeta(
    'keywords',
  );
  @override
  late final GeneratedColumn<String> keywords = GeneratedColumn<String>(
    'keywords',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _excludedWordsMeta = const VerificationMeta(
    'excludedWords',
  );
  @override
  late final GeneratedColumn<String> excludedWords = GeneratedColumn<String>(
    'excluded_words',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _maxRadiusMeta = const VerificationMeta(
    'maxRadius',
  );
  @override
  late final GeneratedColumn<double> maxRadius = GeneratedColumn<double>(
    'max_radius',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notifyMeta = const VerificationMeta('notify');
  @override
  late final GeneratedColumn<bool> notify = GeneratedColumn<bool>(
    'notify',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify" IN (0, 1))',
    ),
  );
  static const VerificationMeta _enabledMeta = const VerificationMeta(
    'enabled',
  );
  @override
  late final GeneratedColumn<bool> enabled = GeneratedColumn<bool>(
    'enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("enabled" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    keywords,
    excludedWords,
    maxRadius,
    notify,
    enabled,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_rules';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchRuleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('keywords')) {
      context.handle(
        _keywordsMeta,
        keywords.isAcceptableOrUnknown(data['keywords']!, _keywordsMeta),
      );
    } else if (isInserting) {
      context.missing(_keywordsMeta);
    }
    if (data.containsKey('excluded_words')) {
      context.handle(
        _excludedWordsMeta,
        excludedWords.isAcceptableOrUnknown(
          data['excluded_words']!,
          _excludedWordsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_excludedWordsMeta);
    }
    if (data.containsKey('max_radius')) {
      context.handle(
        _maxRadiusMeta,
        maxRadius.isAcceptableOrUnknown(data['max_radius']!, _maxRadiusMeta),
      );
    } else if (isInserting) {
      context.missing(_maxRadiusMeta);
    }
    if (data.containsKey('notify')) {
      context.handle(
        _notifyMeta,
        notify.isAcceptableOrUnknown(data['notify']!, _notifyMeta),
      );
    } else if (isInserting) {
      context.missing(_notifyMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(
        _enabledMeta,
        enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta),
      );
    } else if (isInserting) {
      context.missing(_enabledMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SearchRuleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchRuleRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      keywords: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}keywords'],
      )!,
      excludedWords: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}excluded_words'],
      )!,
      maxRadius: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}max_radius'],
      )!,
      notify: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify'],
      )!,
      enabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}enabled'],
      )!,
    );
  }

  @override
  $SearchRulesTable createAlias(String alias) {
    return $SearchRulesTable(attachedDatabase, alias);
  }
}

class SearchRuleRow extends DataClass implements Insertable<SearchRuleRow> {
  final String id;
  final String name;
  final String keywords;
  final String excludedWords;
  final double maxRadius;
  final bool notify;
  final bool enabled;
  const SearchRuleRow({
    required this.id,
    required this.name,
    required this.keywords,
    required this.excludedWords,
    required this.maxRadius,
    required this.notify,
    required this.enabled,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['keywords'] = Variable<String>(keywords);
    map['excluded_words'] = Variable<String>(excludedWords);
    map['max_radius'] = Variable<double>(maxRadius);
    map['notify'] = Variable<bool>(notify);
    map['enabled'] = Variable<bool>(enabled);
    return map;
  }

  SearchRulesCompanion toCompanion(bool nullToAbsent) {
    return SearchRulesCompanion(
      id: Value(id),
      name: Value(name),
      keywords: Value(keywords),
      excludedWords: Value(excludedWords),
      maxRadius: Value(maxRadius),
      notify: Value(notify),
      enabled: Value(enabled),
    );
  }

  factory SearchRuleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchRuleRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      keywords: serializer.fromJson<String>(json['keywords']),
      excludedWords: serializer.fromJson<String>(json['excludedWords']),
      maxRadius: serializer.fromJson<double>(json['maxRadius']),
      notify: serializer.fromJson<bool>(json['notify']),
      enabled: serializer.fromJson<bool>(json['enabled']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'keywords': serializer.toJson<String>(keywords),
      'excludedWords': serializer.toJson<String>(excludedWords),
      'maxRadius': serializer.toJson<double>(maxRadius),
      'notify': serializer.toJson<bool>(notify),
      'enabled': serializer.toJson<bool>(enabled),
    };
  }

  SearchRuleRow copyWith({
    String? id,
    String? name,
    String? keywords,
    String? excludedWords,
    double? maxRadius,
    bool? notify,
    bool? enabled,
  }) => SearchRuleRow(
    id: id ?? this.id,
    name: name ?? this.name,
    keywords: keywords ?? this.keywords,
    excludedWords: excludedWords ?? this.excludedWords,
    maxRadius: maxRadius ?? this.maxRadius,
    notify: notify ?? this.notify,
    enabled: enabled ?? this.enabled,
  );
  SearchRuleRow copyWithCompanion(SearchRulesCompanion data) {
    return SearchRuleRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      keywords: data.keywords.present ? data.keywords.value : this.keywords,
      excludedWords: data.excludedWords.present
          ? data.excludedWords.value
          : this.excludedWords,
      maxRadius: data.maxRadius.present ? data.maxRadius.value : this.maxRadius,
      notify: data.notify.present ? data.notify.value : this.notify,
      enabled: data.enabled.present ? data.enabled.value : this.enabled,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchRuleRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('keywords: $keywords, ')
          ..write('excludedWords: $excludedWords, ')
          ..write('maxRadius: $maxRadius, ')
          ..write('notify: $notify, ')
          ..write('enabled: $enabled')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    keywords,
    excludedWords,
    maxRadius,
    notify,
    enabled,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchRuleRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.keywords == this.keywords &&
          other.excludedWords == this.excludedWords &&
          other.maxRadius == this.maxRadius &&
          other.notify == this.notify &&
          other.enabled == this.enabled);
}

class SearchRulesCompanion extends UpdateCompanion<SearchRuleRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> keywords;
  final Value<String> excludedWords;
  final Value<double> maxRadius;
  final Value<bool> notify;
  final Value<bool> enabled;
  final Value<int> rowid;
  const SearchRulesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.keywords = const Value.absent(),
    this.excludedWords = const Value.absent(),
    this.maxRadius = const Value.absent(),
    this.notify = const Value.absent(),
    this.enabled = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchRulesCompanion.insert({
    required String id,
    required String name,
    required String keywords,
    required String excludedWords,
    required double maxRadius,
    required bool notify,
    required bool enabled,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       keywords = Value(keywords),
       excludedWords = Value(excludedWords),
       maxRadius = Value(maxRadius),
       notify = Value(notify),
       enabled = Value(enabled);
  static Insertable<SearchRuleRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? keywords,
    Expression<String>? excludedWords,
    Expression<double>? maxRadius,
    Expression<bool>? notify,
    Expression<bool>? enabled,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (keywords != null) 'keywords': keywords,
      if (excludedWords != null) 'excluded_words': excludedWords,
      if (maxRadius != null) 'max_radius': maxRadius,
      if (notify != null) 'notify': notify,
      if (enabled != null) 'enabled': enabled,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchRulesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? keywords,
    Value<String>? excludedWords,
    Value<double>? maxRadius,
    Value<bool>? notify,
    Value<bool>? enabled,
    Value<int>? rowid,
  }) {
    return SearchRulesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      keywords: keywords ?? this.keywords,
      excludedWords: excludedWords ?? this.excludedWords,
      maxRadius: maxRadius ?? this.maxRadius,
      notify: notify ?? this.notify,
      enabled: enabled ?? this.enabled,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (keywords.present) {
      map['keywords'] = Variable<String>(keywords.value);
    }
    if (excludedWords.present) {
      map['excluded_words'] = Variable<String>(excludedWords.value);
    }
    if (maxRadius.present) {
      map['max_radius'] = Variable<double>(maxRadius.value);
    }
    if (notify.present) {
      map['notify'] = Variable<bool>(notify.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchRulesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('keywords: $keywords, ')
          ..write('excludedWords: $excludedWords, ')
          ..write('maxRadius: $maxRadius, ')
          ..write('notify: $notify, ')
          ..write('enabled: $enabled, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SearchRuleSourcesTable extends SearchRuleSources
    with TableInfo<$SearchRuleSourcesTable, SearchRuleSourceRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchRuleSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _ruleIdMeta = const VerificationMeta('ruleId');
  @override
  late final GeneratedColumn<String> ruleId = GeneratedColumn<String>(
    'rule_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES search_rules (id)',
    ),
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES search_sources (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [ruleId, sourceId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'search_rule_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<SearchRuleSourceRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('rule_id')) {
      context.handle(
        _ruleIdMeta,
        ruleId.isAcceptableOrUnknown(data['rule_id']!, _ruleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleIdMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ruleId, sourceId};
  @override
  SearchRuleSourceRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SearchRuleSourceRow(
      ruleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_id'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      )!,
    );
  }

  @override
  $SearchRuleSourcesTable createAlias(String alias) {
    return $SearchRuleSourcesTable(attachedDatabase, alias);
  }
}

class SearchRuleSourceRow extends DataClass
    implements Insertable<SearchRuleSourceRow> {
  final String ruleId;
  final String sourceId;
  const SearchRuleSourceRow({required this.ruleId, required this.sourceId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['rule_id'] = Variable<String>(ruleId);
    map['source_id'] = Variable<String>(sourceId);
    return map;
  }

  SearchRuleSourcesCompanion toCompanion(bool nullToAbsent) {
    return SearchRuleSourcesCompanion(
      ruleId: Value(ruleId),
      sourceId: Value(sourceId),
    );
  }

  factory SearchRuleSourceRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SearchRuleSourceRow(
      ruleId: serializer.fromJson<String>(json['ruleId']),
      sourceId: serializer.fromJson<String>(json['sourceId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'ruleId': serializer.toJson<String>(ruleId),
      'sourceId': serializer.toJson<String>(sourceId),
    };
  }

  SearchRuleSourceRow copyWith({String? ruleId, String? sourceId}) =>
      SearchRuleSourceRow(
        ruleId: ruleId ?? this.ruleId,
        sourceId: sourceId ?? this.sourceId,
      );
  SearchRuleSourceRow copyWithCompanion(SearchRuleSourcesCompanion data) {
    return SearchRuleSourceRow(
      ruleId: data.ruleId.present ? data.ruleId.value : this.ruleId,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SearchRuleSourceRow(')
          ..write('ruleId: $ruleId, ')
          ..write('sourceId: $sourceId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(ruleId, sourceId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SearchRuleSourceRow &&
          other.ruleId == this.ruleId &&
          other.sourceId == this.sourceId);
}

class SearchRuleSourcesCompanion extends UpdateCompanion<SearchRuleSourceRow> {
  final Value<String> ruleId;
  final Value<String> sourceId;
  final Value<int> rowid;
  const SearchRuleSourcesCompanion({
    this.ruleId = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SearchRuleSourcesCompanion.insert({
    required String ruleId,
    required String sourceId,
    this.rowid = const Value.absent(),
  }) : ruleId = Value(ruleId),
       sourceId = Value(sourceId);
  static Insertable<SearchRuleSourceRow> custom({
    Expression<String>? ruleId,
    Expression<String>? sourceId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (ruleId != null) 'rule_id': ruleId,
      if (sourceId != null) 'source_id': sourceId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SearchRuleSourcesCompanion copyWith({
    Value<String>? ruleId,
    Value<String>? sourceId,
    Value<int>? rowid,
  }) {
    return SearchRuleSourcesCompanion(
      ruleId: ruleId ?? this.ruleId,
      sourceId: sourceId ?? this.sourceId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (ruleId.present) {
      map['rule_id'] = Variable<String>(ruleId.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchRuleSourcesCompanion(')
          ..write('ruleId: $ruleId, ')
          ..write('sourceId: $sourceId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $NotificationSettingsTableTable extends NotificationSettingsTable
    with TableInfo<$NotificationSettingsTableTable, NotificationSettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NotificationSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _notificationsEnabledMeta =
      const VerificationMeta('notificationsEnabled');
  @override
  late final GeneratedColumn<bool> notificationsEnabled = GeneratedColumn<bool>(
    'notifications_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notifications_enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notifyNewMatchesMeta = const VerificationMeta(
    'notifyNewMatches',
  );
  @override
  late final GeneratedColumn<bool> notifyNewMatches = GeneratedColumn<bool>(
    'notify_new_matches',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_new_matches" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notifyHighValueOnlyMeta =
      const VerificationMeta('notifyHighValueOnly');
  @override
  late final GeneratedColumn<bool> notifyHighValueOnly = GeneratedColumn<bool>(
    'notify_high_value_only',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_high_value_only" IN (0, 1))',
    ),
  );
  static const VerificationMeta _minimumValueThresholdMeta =
      const VerificationMeta('minimumValueThreshold');
  @override
  late final GeneratedColumn<double> minimumValueThreshold =
      GeneratedColumn<double>(
        'minimum_value_threshold',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _quietHoursEnabledMeta = const VerificationMeta(
    'quietHoursEnabled',
  );
  @override
  late final GeneratedColumn<bool> quietHoursEnabled = GeneratedColumn<bool>(
    'quiet_hours_enabled',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("quiet_hours_enabled" IN (0, 1))',
    ),
  );
  static const VerificationMeta _quietStartMeta = const VerificationMeta(
    'quietStart',
  );
  @override
  late final GeneratedColumn<String> quietStart = GeneratedColumn<String>(
    'quiet_start',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _quietEndMeta = const VerificationMeta(
    'quietEnd',
  );
  @override
  late final GeneratedColumn<String> quietEnd = GeneratedColumn<String>(
    'quiet_end',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notifyDuplicatesMeta = const VerificationMeta(
    'notifyDuplicates',
  );
  @override
  late final GeneratedColumn<bool> notifyDuplicates = GeneratedColumn<bool>(
    'notify_duplicates',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("notify_duplicates" IN (0, 1))',
    ),
  );
  static const VerificationMeta _notifyWorthwhileRouteMeta =
      const VerificationMeta('notifyWorthwhileRoute');
  @override
  late final GeneratedColumn<bool> notifyWorthwhileRoute =
      GeneratedColumn<bool>(
        'notify_worthwhile_route',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: true,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("notify_worthwhile_route" IN (0, 1))',
        ),
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    notificationsEnabled,
    notifyNewMatches,
    notifyHighValueOnly,
    minimumValueThreshold,
    quietHoursEnabled,
    quietStart,
    quietEnd,
    notifyDuplicates,
    notifyWorthwhileRoute,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'notification_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NotificationSettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('notifications_enabled')) {
      context.handle(
        _notificationsEnabledMeta,
        notificationsEnabled.isAcceptableOrUnknown(
          data['notifications_enabled']!,
          _notificationsEnabledMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notificationsEnabledMeta);
    }
    if (data.containsKey('notify_new_matches')) {
      context.handle(
        _notifyNewMatchesMeta,
        notifyNewMatches.isAcceptableOrUnknown(
          data['notify_new_matches']!,
          _notifyNewMatchesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notifyNewMatchesMeta);
    }
    if (data.containsKey('notify_high_value_only')) {
      context.handle(
        _notifyHighValueOnlyMeta,
        notifyHighValueOnly.isAcceptableOrUnknown(
          data['notify_high_value_only']!,
          _notifyHighValueOnlyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notifyHighValueOnlyMeta);
    }
    if (data.containsKey('minimum_value_threshold')) {
      context.handle(
        _minimumValueThresholdMeta,
        minimumValueThreshold.isAcceptableOrUnknown(
          data['minimum_value_threshold']!,
          _minimumValueThresholdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_minimumValueThresholdMeta);
    }
    if (data.containsKey('quiet_hours_enabled')) {
      context.handle(
        _quietHoursEnabledMeta,
        quietHoursEnabled.isAcceptableOrUnknown(
          data['quiet_hours_enabled']!,
          _quietHoursEnabledMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_quietHoursEnabledMeta);
    }
    if (data.containsKey('quiet_start')) {
      context.handle(
        _quietStartMeta,
        quietStart.isAcceptableOrUnknown(data['quiet_start']!, _quietStartMeta),
      );
    } else if (isInserting) {
      context.missing(_quietStartMeta);
    }
    if (data.containsKey('quiet_end')) {
      context.handle(
        _quietEndMeta,
        quietEnd.isAcceptableOrUnknown(data['quiet_end']!, _quietEndMeta),
      );
    } else if (isInserting) {
      context.missing(_quietEndMeta);
    }
    if (data.containsKey('notify_duplicates')) {
      context.handle(
        _notifyDuplicatesMeta,
        notifyDuplicates.isAcceptableOrUnknown(
          data['notify_duplicates']!,
          _notifyDuplicatesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notifyDuplicatesMeta);
    }
    if (data.containsKey('notify_worthwhile_route')) {
      context.handle(
        _notifyWorthwhileRouteMeta,
        notifyWorthwhileRoute.isAcceptableOrUnknown(
          data['notify_worthwhile_route']!,
          _notifyWorthwhileRouteMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_notifyWorthwhileRouteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NotificationSettingsRow map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NotificationSettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      notificationsEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notifications_enabled'],
      )!,
      notifyNewMatches: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_new_matches'],
      )!,
      notifyHighValueOnly: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_high_value_only'],
      )!,
      minimumValueThreshold: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}minimum_value_threshold'],
      )!,
      quietHoursEnabled: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}quiet_hours_enabled'],
      )!,
      quietStart: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiet_start'],
      )!,
      quietEnd: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}quiet_end'],
      )!,
      notifyDuplicates: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_duplicates'],
      )!,
      notifyWorthwhileRoute: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}notify_worthwhile_route'],
      )!,
    );
  }

  @override
  $NotificationSettingsTableTable createAlias(String alias) {
    return $NotificationSettingsTableTable(attachedDatabase, alias);
  }
}

class NotificationSettingsRow extends DataClass
    implements Insertable<NotificationSettingsRow> {
  final int id;
  final bool notificationsEnabled;
  final bool notifyNewMatches;
  final bool notifyHighValueOnly;
  final double minimumValueThreshold;
  final bool quietHoursEnabled;
  final String quietStart;
  final String quietEnd;
  final bool notifyDuplicates;
  final bool notifyWorthwhileRoute;
  const NotificationSettingsRow({
    required this.id,
    required this.notificationsEnabled,
    required this.notifyNewMatches,
    required this.notifyHighValueOnly,
    required this.minimumValueThreshold,
    required this.quietHoursEnabled,
    required this.quietStart,
    required this.quietEnd,
    required this.notifyDuplicates,
    required this.notifyWorthwhileRoute,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['notifications_enabled'] = Variable<bool>(notificationsEnabled);
    map['notify_new_matches'] = Variable<bool>(notifyNewMatches);
    map['notify_high_value_only'] = Variable<bool>(notifyHighValueOnly);
    map['minimum_value_threshold'] = Variable<double>(minimumValueThreshold);
    map['quiet_hours_enabled'] = Variable<bool>(quietHoursEnabled);
    map['quiet_start'] = Variable<String>(quietStart);
    map['quiet_end'] = Variable<String>(quietEnd);
    map['notify_duplicates'] = Variable<bool>(notifyDuplicates);
    map['notify_worthwhile_route'] = Variable<bool>(notifyWorthwhileRoute);
    return map;
  }

  NotificationSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return NotificationSettingsTableCompanion(
      id: Value(id),
      notificationsEnabled: Value(notificationsEnabled),
      notifyNewMatches: Value(notifyNewMatches),
      notifyHighValueOnly: Value(notifyHighValueOnly),
      minimumValueThreshold: Value(minimumValueThreshold),
      quietHoursEnabled: Value(quietHoursEnabled),
      quietStart: Value(quietStart),
      quietEnd: Value(quietEnd),
      notifyDuplicates: Value(notifyDuplicates),
      notifyWorthwhileRoute: Value(notifyWorthwhileRoute),
    );
  }

  factory NotificationSettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NotificationSettingsRow(
      id: serializer.fromJson<int>(json['id']),
      notificationsEnabled: serializer.fromJson<bool>(
        json['notificationsEnabled'],
      ),
      notifyNewMatches: serializer.fromJson<bool>(json['notifyNewMatches']),
      notifyHighValueOnly: serializer.fromJson<bool>(
        json['notifyHighValueOnly'],
      ),
      minimumValueThreshold: serializer.fromJson<double>(
        json['minimumValueThreshold'],
      ),
      quietHoursEnabled: serializer.fromJson<bool>(json['quietHoursEnabled']),
      quietStart: serializer.fromJson<String>(json['quietStart']),
      quietEnd: serializer.fromJson<String>(json['quietEnd']),
      notifyDuplicates: serializer.fromJson<bool>(json['notifyDuplicates']),
      notifyWorthwhileRoute: serializer.fromJson<bool>(
        json['notifyWorthwhileRoute'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'notificationsEnabled': serializer.toJson<bool>(notificationsEnabled),
      'notifyNewMatches': serializer.toJson<bool>(notifyNewMatches),
      'notifyHighValueOnly': serializer.toJson<bool>(notifyHighValueOnly),
      'minimumValueThreshold': serializer.toJson<double>(minimumValueThreshold),
      'quietHoursEnabled': serializer.toJson<bool>(quietHoursEnabled),
      'quietStart': serializer.toJson<String>(quietStart),
      'quietEnd': serializer.toJson<String>(quietEnd),
      'notifyDuplicates': serializer.toJson<bool>(notifyDuplicates),
      'notifyWorthwhileRoute': serializer.toJson<bool>(notifyWorthwhileRoute),
    };
  }

  NotificationSettingsRow copyWith({
    int? id,
    bool? notificationsEnabled,
    bool? notifyNewMatches,
    bool? notifyHighValueOnly,
    double? minimumValueThreshold,
    bool? quietHoursEnabled,
    String? quietStart,
    String? quietEnd,
    bool? notifyDuplicates,
    bool? notifyWorthwhileRoute,
  }) => NotificationSettingsRow(
    id: id ?? this.id,
    notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    notifyNewMatches: notifyNewMatches ?? this.notifyNewMatches,
    notifyHighValueOnly: notifyHighValueOnly ?? this.notifyHighValueOnly,
    minimumValueThreshold: minimumValueThreshold ?? this.minimumValueThreshold,
    quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
    quietStart: quietStart ?? this.quietStart,
    quietEnd: quietEnd ?? this.quietEnd,
    notifyDuplicates: notifyDuplicates ?? this.notifyDuplicates,
    notifyWorthwhileRoute: notifyWorthwhileRoute ?? this.notifyWorthwhileRoute,
  );
  NotificationSettingsRow copyWithCompanion(
    NotificationSettingsTableCompanion data,
  ) {
    return NotificationSettingsRow(
      id: data.id.present ? data.id.value : this.id,
      notificationsEnabled: data.notificationsEnabled.present
          ? data.notificationsEnabled.value
          : this.notificationsEnabled,
      notifyNewMatches: data.notifyNewMatches.present
          ? data.notifyNewMatches.value
          : this.notifyNewMatches,
      notifyHighValueOnly: data.notifyHighValueOnly.present
          ? data.notifyHighValueOnly.value
          : this.notifyHighValueOnly,
      minimumValueThreshold: data.minimumValueThreshold.present
          ? data.minimumValueThreshold.value
          : this.minimumValueThreshold,
      quietHoursEnabled: data.quietHoursEnabled.present
          ? data.quietHoursEnabled.value
          : this.quietHoursEnabled,
      quietStart: data.quietStart.present
          ? data.quietStart.value
          : this.quietStart,
      quietEnd: data.quietEnd.present ? data.quietEnd.value : this.quietEnd,
      notifyDuplicates: data.notifyDuplicates.present
          ? data.notifyDuplicates.value
          : this.notifyDuplicates,
      notifyWorthwhileRoute: data.notifyWorthwhileRoute.present
          ? data.notifyWorthwhileRoute.value
          : this.notifyWorthwhileRoute,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsRow(')
          ..write('id: $id, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('notifyNewMatches: $notifyNewMatches, ')
          ..write('notifyHighValueOnly: $notifyHighValueOnly, ')
          ..write('minimumValueThreshold: $minimumValueThreshold, ')
          ..write('quietHoursEnabled: $quietHoursEnabled, ')
          ..write('quietStart: $quietStart, ')
          ..write('quietEnd: $quietEnd, ')
          ..write('notifyDuplicates: $notifyDuplicates, ')
          ..write('notifyWorthwhileRoute: $notifyWorthwhileRoute')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    notificationsEnabled,
    notifyNewMatches,
    notifyHighValueOnly,
    minimumValueThreshold,
    quietHoursEnabled,
    quietStart,
    quietEnd,
    notifyDuplicates,
    notifyWorthwhileRoute,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NotificationSettingsRow &&
          other.id == this.id &&
          other.notificationsEnabled == this.notificationsEnabled &&
          other.notifyNewMatches == this.notifyNewMatches &&
          other.notifyHighValueOnly == this.notifyHighValueOnly &&
          other.minimumValueThreshold == this.minimumValueThreshold &&
          other.quietHoursEnabled == this.quietHoursEnabled &&
          other.quietStart == this.quietStart &&
          other.quietEnd == this.quietEnd &&
          other.notifyDuplicates == this.notifyDuplicates &&
          other.notifyWorthwhileRoute == this.notifyWorthwhileRoute);
}

class NotificationSettingsTableCompanion
    extends UpdateCompanion<NotificationSettingsRow> {
  final Value<int> id;
  final Value<bool> notificationsEnabled;
  final Value<bool> notifyNewMatches;
  final Value<bool> notifyHighValueOnly;
  final Value<double> minimumValueThreshold;
  final Value<bool> quietHoursEnabled;
  final Value<String> quietStart;
  final Value<String> quietEnd;
  final Value<bool> notifyDuplicates;
  final Value<bool> notifyWorthwhileRoute;
  const NotificationSettingsTableCompanion({
    this.id = const Value.absent(),
    this.notificationsEnabled = const Value.absent(),
    this.notifyNewMatches = const Value.absent(),
    this.notifyHighValueOnly = const Value.absent(),
    this.minimumValueThreshold = const Value.absent(),
    this.quietHoursEnabled = const Value.absent(),
    this.quietStart = const Value.absent(),
    this.quietEnd = const Value.absent(),
    this.notifyDuplicates = const Value.absent(),
    this.notifyWorthwhileRoute = const Value.absent(),
  });
  NotificationSettingsTableCompanion.insert({
    this.id = const Value.absent(),
    required bool notificationsEnabled,
    required bool notifyNewMatches,
    required bool notifyHighValueOnly,
    required double minimumValueThreshold,
    required bool quietHoursEnabled,
    required String quietStart,
    required String quietEnd,
    required bool notifyDuplicates,
    required bool notifyWorthwhileRoute,
  }) : notificationsEnabled = Value(notificationsEnabled),
       notifyNewMatches = Value(notifyNewMatches),
       notifyHighValueOnly = Value(notifyHighValueOnly),
       minimumValueThreshold = Value(minimumValueThreshold),
       quietHoursEnabled = Value(quietHoursEnabled),
       quietStart = Value(quietStart),
       quietEnd = Value(quietEnd),
       notifyDuplicates = Value(notifyDuplicates),
       notifyWorthwhileRoute = Value(notifyWorthwhileRoute);
  static Insertable<NotificationSettingsRow> custom({
    Expression<int>? id,
    Expression<bool>? notificationsEnabled,
    Expression<bool>? notifyNewMatches,
    Expression<bool>? notifyHighValueOnly,
    Expression<double>? minimumValueThreshold,
    Expression<bool>? quietHoursEnabled,
    Expression<String>? quietStart,
    Expression<String>? quietEnd,
    Expression<bool>? notifyDuplicates,
    Expression<bool>? notifyWorthwhileRoute,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (notificationsEnabled != null)
        'notifications_enabled': notificationsEnabled,
      if (notifyNewMatches != null) 'notify_new_matches': notifyNewMatches,
      if (notifyHighValueOnly != null)
        'notify_high_value_only': notifyHighValueOnly,
      if (minimumValueThreshold != null)
        'minimum_value_threshold': minimumValueThreshold,
      if (quietHoursEnabled != null) 'quiet_hours_enabled': quietHoursEnabled,
      if (quietStart != null) 'quiet_start': quietStart,
      if (quietEnd != null) 'quiet_end': quietEnd,
      if (notifyDuplicates != null) 'notify_duplicates': notifyDuplicates,
      if (notifyWorthwhileRoute != null)
        'notify_worthwhile_route': notifyWorthwhileRoute,
    });
  }

  NotificationSettingsTableCompanion copyWith({
    Value<int>? id,
    Value<bool>? notificationsEnabled,
    Value<bool>? notifyNewMatches,
    Value<bool>? notifyHighValueOnly,
    Value<double>? minimumValueThreshold,
    Value<bool>? quietHoursEnabled,
    Value<String>? quietStart,
    Value<String>? quietEnd,
    Value<bool>? notifyDuplicates,
    Value<bool>? notifyWorthwhileRoute,
  }) {
    return NotificationSettingsTableCompanion(
      id: id ?? this.id,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      notifyNewMatches: notifyNewMatches ?? this.notifyNewMatches,
      notifyHighValueOnly: notifyHighValueOnly ?? this.notifyHighValueOnly,
      minimumValueThreshold:
          minimumValueThreshold ?? this.minimumValueThreshold,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
      quietStart: quietStart ?? this.quietStart,
      quietEnd: quietEnd ?? this.quietEnd,
      notifyDuplicates: notifyDuplicates ?? this.notifyDuplicates,
      notifyWorthwhileRoute:
          notifyWorthwhileRoute ?? this.notifyWorthwhileRoute,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (notificationsEnabled.present) {
      map['notifications_enabled'] = Variable<bool>(notificationsEnabled.value);
    }
    if (notifyNewMatches.present) {
      map['notify_new_matches'] = Variable<bool>(notifyNewMatches.value);
    }
    if (notifyHighValueOnly.present) {
      map['notify_high_value_only'] = Variable<bool>(notifyHighValueOnly.value);
    }
    if (minimumValueThreshold.present) {
      map['minimum_value_threshold'] = Variable<double>(
        minimumValueThreshold.value,
      );
    }
    if (quietHoursEnabled.present) {
      map['quiet_hours_enabled'] = Variable<bool>(quietHoursEnabled.value);
    }
    if (quietStart.present) {
      map['quiet_start'] = Variable<String>(quietStart.value);
    }
    if (quietEnd.present) {
      map['quiet_end'] = Variable<String>(quietEnd.value);
    }
    if (notifyDuplicates.present) {
      map['notify_duplicates'] = Variable<bool>(notifyDuplicates.value);
    }
    if (notifyWorthwhileRoute.present) {
      map['notify_worthwhile_route'] = Variable<bool>(
        notifyWorthwhileRoute.value,
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NotificationSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('notificationsEnabled: $notificationsEnabled, ')
          ..write('notifyNewMatches: $notifyNewMatches, ')
          ..write('notifyHighValueOnly: $notifyHighValueOnly, ')
          ..write('minimumValueThreshold: $minimumValueThreshold, ')
          ..write('quietHoursEnabled: $quietHoursEnabled, ')
          ..write('quietStart: $quietStart, ')
          ..write('quietEnd: $quietEnd, ')
          ..write('notifyDuplicates: $notifyDuplicates, ')
          ..write('notifyWorthwhileRoute: $notifyWorthwhileRoute')
          ..write(')'))
        .toString();
  }
}

class $ObjectTemplatesTable extends ObjectTemplates
    with TableInfo<$ObjectTemplatesTable, ObjectTemplateRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ObjectTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _aliasesMeta = const VerificationMeta(
    'aliases',
  );
  @override
  late final GeneratedColumn<String> aliases = GeneratedColumn<String>(
    'aliases',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cargoDemandMeta = const VerificationMeta(
    'cargoDemand',
  );
  @override
  late final GeneratedColumn<String> cargoDemand = GeneratedColumn<String>(
    'cargo_demand',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destinationMeta = const VerificationMeta(
    'destination',
  );
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
    'destination',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lowValueMeta = const VerificationMeta(
    'lowValue',
  );
  @override
  late final GeneratedColumn<double> lowValue = GeneratedColumn<double>(
    'low_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likelyValueMeta = const VerificationMeta(
    'likelyValue',
  );
  @override
  late final GeneratedColumn<double> likelyValue = GeneratedColumn<double>(
    'likely_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _highValueMeta = const VerificationMeta(
    'highValue',
  );
  @override
  late final GeneratedColumn<double> highValue = GeneratedColumn<double>(
    'high_value',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stripMinutesMeta = const VerificationMeta(
    'stripMinutes',
  );
  @override
  late final GeneratedColumn<int> stripMinutes = GeneratedColumn<int>(
    'strip_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stripDifficultyMeta = const VerificationMeta(
    'stripDifficulty',
  );
  @override
  late final GeneratedColumn<int> stripDifficulty = GeneratedColumn<int>(
    'strip_difficulty',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _safetyNotesMeta = const VerificationMeta(
    'safetyNotes',
  );
  @override
  late final GeneratedColumn<String> safetyNotes = GeneratedColumn<String>(
    'safety_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _toolsNeededMeta = const VerificationMeta(
    'toolsNeeded',
  );
  @override
  late final GeneratedColumn<String> toolsNeeded = GeneratedColumn<String>(
    'tools_needed',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recoverableMaterialsMeta =
      const VerificationMeta('recoverableMaterials');
  @override
  late final GeneratedColumn<String> recoverableMaterials =
      GeneratedColumn<String>(
        'recoverable_materials',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _partOutNotesMeta = const VerificationMeta(
    'partOutNotes',
  );
  @override
  late final GeneratedColumn<String> partOutNotes = GeneratedColumn<String>(
    'part_out_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    aliases,
    category,
    cargoDemand,
    destination,
    lowValue,
    likelyValue,
    highValue,
    stripMinutes,
    stripDifficulty,
    safetyNotes,
    toolsNeeded,
    recoverableMaterials,
    partOutNotes,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'object_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<ObjectTemplateRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('aliases')) {
      context.handle(
        _aliasesMeta,
        aliases.isAcceptableOrUnknown(data['aliases']!, _aliasesMeta),
      );
    } else if (isInserting) {
      context.missing(_aliasesMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('cargo_demand')) {
      context.handle(
        _cargoDemandMeta,
        cargoDemand.isAcceptableOrUnknown(
          data['cargo_demand']!,
          _cargoDemandMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cargoDemandMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
        _destinationMeta,
        destination.isAcceptableOrUnknown(
          data['destination']!,
          _destinationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('low_value')) {
      context.handle(
        _lowValueMeta,
        lowValue.isAcceptableOrUnknown(data['low_value']!, _lowValueMeta),
      );
    } else if (isInserting) {
      context.missing(_lowValueMeta);
    }
    if (data.containsKey('likely_value')) {
      context.handle(
        _likelyValueMeta,
        likelyValue.isAcceptableOrUnknown(
          data['likely_value']!,
          _likelyValueMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_likelyValueMeta);
    }
    if (data.containsKey('high_value')) {
      context.handle(
        _highValueMeta,
        highValue.isAcceptableOrUnknown(data['high_value']!, _highValueMeta),
      );
    } else if (isInserting) {
      context.missing(_highValueMeta);
    }
    if (data.containsKey('strip_minutes')) {
      context.handle(
        _stripMinutesMeta,
        stripMinutes.isAcceptableOrUnknown(
          data['strip_minutes']!,
          _stripMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stripMinutesMeta);
    }
    if (data.containsKey('strip_difficulty')) {
      context.handle(
        _stripDifficultyMeta,
        stripDifficulty.isAcceptableOrUnknown(
          data['strip_difficulty']!,
          _stripDifficultyMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_stripDifficultyMeta);
    }
    if (data.containsKey('safety_notes')) {
      context.handle(
        _safetyNotesMeta,
        safetyNotes.isAcceptableOrUnknown(
          data['safety_notes']!,
          _safetyNotesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_safetyNotesMeta);
    }
    if (data.containsKey('tools_needed')) {
      context.handle(
        _toolsNeededMeta,
        toolsNeeded.isAcceptableOrUnknown(
          data['tools_needed']!,
          _toolsNeededMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_toolsNeededMeta);
    }
    if (data.containsKey('recoverable_materials')) {
      context.handle(
        _recoverableMaterialsMeta,
        recoverableMaterials.isAcceptableOrUnknown(
          data['recoverable_materials']!,
          _recoverableMaterialsMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recoverableMaterialsMeta);
    }
    if (data.containsKey('part_out_notes')) {
      context.handle(
        _partOutNotesMeta,
        partOutNotes.isAcceptableOrUnknown(
          data['part_out_notes']!,
          _partOutNotesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_partOutNotesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ObjectTemplateRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ObjectTemplateRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      aliases: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}aliases'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      cargoDemand: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cargo_demand'],
      )!,
      destination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination'],
      )!,
      lowValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}low_value'],
      )!,
      likelyValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}likely_value'],
      )!,
      highValue: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}high_value'],
      )!,
      stripMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strip_minutes'],
      )!,
      stripDifficulty: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}strip_difficulty'],
      )!,
      safetyNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}safety_notes'],
      )!,
      toolsNeeded: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tools_needed'],
      )!,
      recoverableMaterials: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recoverable_materials'],
      )!,
      partOutNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}part_out_notes'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $ObjectTemplatesTable createAlias(String alias) {
    return $ObjectTemplatesTable(attachedDatabase, alias);
  }
}

class ObjectTemplateRow extends DataClass
    implements Insertable<ObjectTemplateRow> {
  final String id;
  final String name;
  final String aliases;
  final String category;
  final String cargoDemand;
  final String destination;
  final double lowValue;
  final double likelyValue;
  final double highValue;
  final int stripMinutes;
  final int stripDifficulty;
  final String safetyNotes;
  final String toolsNeeded;
  final String recoverableMaterials;
  final String partOutNotes;
  final String notes;
  const ObjectTemplateRow({
    required this.id,
    required this.name,
    required this.aliases,
    required this.category,
    required this.cargoDemand,
    required this.destination,
    required this.lowValue,
    required this.likelyValue,
    required this.highValue,
    required this.stripMinutes,
    required this.stripDifficulty,
    required this.safetyNotes,
    required this.toolsNeeded,
    required this.recoverableMaterials,
    required this.partOutNotes,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['aliases'] = Variable<String>(aliases);
    map['category'] = Variable<String>(category);
    map['cargo_demand'] = Variable<String>(cargoDemand);
    map['destination'] = Variable<String>(destination);
    map['low_value'] = Variable<double>(lowValue);
    map['likely_value'] = Variable<double>(likelyValue);
    map['high_value'] = Variable<double>(highValue);
    map['strip_minutes'] = Variable<int>(stripMinutes);
    map['strip_difficulty'] = Variable<int>(stripDifficulty);
    map['safety_notes'] = Variable<String>(safetyNotes);
    map['tools_needed'] = Variable<String>(toolsNeeded);
    map['recoverable_materials'] = Variable<String>(recoverableMaterials);
    map['part_out_notes'] = Variable<String>(partOutNotes);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  ObjectTemplatesCompanion toCompanion(bool nullToAbsent) {
    return ObjectTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      aliases: Value(aliases),
      category: Value(category),
      cargoDemand: Value(cargoDemand),
      destination: Value(destination),
      lowValue: Value(lowValue),
      likelyValue: Value(likelyValue),
      highValue: Value(highValue),
      stripMinutes: Value(stripMinutes),
      stripDifficulty: Value(stripDifficulty),
      safetyNotes: Value(safetyNotes),
      toolsNeeded: Value(toolsNeeded),
      recoverableMaterials: Value(recoverableMaterials),
      partOutNotes: Value(partOutNotes),
      notes: Value(notes),
    );
  }

  factory ObjectTemplateRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ObjectTemplateRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      aliases: serializer.fromJson<String>(json['aliases']),
      category: serializer.fromJson<String>(json['category']),
      cargoDemand: serializer.fromJson<String>(json['cargoDemand']),
      destination: serializer.fromJson<String>(json['destination']),
      lowValue: serializer.fromJson<double>(json['lowValue']),
      likelyValue: serializer.fromJson<double>(json['likelyValue']),
      highValue: serializer.fromJson<double>(json['highValue']),
      stripMinutes: serializer.fromJson<int>(json['stripMinutes']),
      stripDifficulty: serializer.fromJson<int>(json['stripDifficulty']),
      safetyNotes: serializer.fromJson<String>(json['safetyNotes']),
      toolsNeeded: serializer.fromJson<String>(json['toolsNeeded']),
      recoverableMaterials: serializer.fromJson<String>(
        json['recoverableMaterials'],
      ),
      partOutNotes: serializer.fromJson<String>(json['partOutNotes']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'aliases': serializer.toJson<String>(aliases),
      'category': serializer.toJson<String>(category),
      'cargoDemand': serializer.toJson<String>(cargoDemand),
      'destination': serializer.toJson<String>(destination),
      'lowValue': serializer.toJson<double>(lowValue),
      'likelyValue': serializer.toJson<double>(likelyValue),
      'highValue': serializer.toJson<double>(highValue),
      'stripMinutes': serializer.toJson<int>(stripMinutes),
      'stripDifficulty': serializer.toJson<int>(stripDifficulty),
      'safetyNotes': serializer.toJson<String>(safetyNotes),
      'toolsNeeded': serializer.toJson<String>(toolsNeeded),
      'recoverableMaterials': serializer.toJson<String>(recoverableMaterials),
      'partOutNotes': serializer.toJson<String>(partOutNotes),
      'notes': serializer.toJson<String>(notes),
    };
  }

  ObjectTemplateRow copyWith({
    String? id,
    String? name,
    String? aliases,
    String? category,
    String? cargoDemand,
    String? destination,
    double? lowValue,
    double? likelyValue,
    double? highValue,
    int? stripMinutes,
    int? stripDifficulty,
    String? safetyNotes,
    String? toolsNeeded,
    String? recoverableMaterials,
    String? partOutNotes,
    String? notes,
  }) => ObjectTemplateRow(
    id: id ?? this.id,
    name: name ?? this.name,
    aliases: aliases ?? this.aliases,
    category: category ?? this.category,
    cargoDemand: cargoDemand ?? this.cargoDemand,
    destination: destination ?? this.destination,
    lowValue: lowValue ?? this.lowValue,
    likelyValue: likelyValue ?? this.likelyValue,
    highValue: highValue ?? this.highValue,
    stripMinutes: stripMinutes ?? this.stripMinutes,
    stripDifficulty: stripDifficulty ?? this.stripDifficulty,
    safetyNotes: safetyNotes ?? this.safetyNotes,
    toolsNeeded: toolsNeeded ?? this.toolsNeeded,
    recoverableMaterials: recoverableMaterials ?? this.recoverableMaterials,
    partOutNotes: partOutNotes ?? this.partOutNotes,
    notes: notes ?? this.notes,
  );
  ObjectTemplateRow copyWithCompanion(ObjectTemplatesCompanion data) {
    return ObjectTemplateRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      aliases: data.aliases.present ? data.aliases.value : this.aliases,
      category: data.category.present ? data.category.value : this.category,
      cargoDemand: data.cargoDemand.present
          ? data.cargoDemand.value
          : this.cargoDemand,
      destination: data.destination.present
          ? data.destination.value
          : this.destination,
      lowValue: data.lowValue.present ? data.lowValue.value : this.lowValue,
      likelyValue: data.likelyValue.present
          ? data.likelyValue.value
          : this.likelyValue,
      highValue: data.highValue.present ? data.highValue.value : this.highValue,
      stripMinutes: data.stripMinutes.present
          ? data.stripMinutes.value
          : this.stripMinutes,
      stripDifficulty: data.stripDifficulty.present
          ? data.stripDifficulty.value
          : this.stripDifficulty,
      safetyNotes: data.safetyNotes.present
          ? data.safetyNotes.value
          : this.safetyNotes,
      toolsNeeded: data.toolsNeeded.present
          ? data.toolsNeeded.value
          : this.toolsNeeded,
      recoverableMaterials: data.recoverableMaterials.present
          ? data.recoverableMaterials.value
          : this.recoverableMaterials,
      partOutNotes: data.partOutNotes.present
          ? data.partOutNotes.value
          : this.partOutNotes,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ObjectTemplateRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('aliases: $aliases, ')
          ..write('category: $category, ')
          ..write('cargoDemand: $cargoDemand, ')
          ..write('destination: $destination, ')
          ..write('lowValue: $lowValue, ')
          ..write('likelyValue: $likelyValue, ')
          ..write('highValue: $highValue, ')
          ..write('stripMinutes: $stripMinutes, ')
          ..write('stripDifficulty: $stripDifficulty, ')
          ..write('safetyNotes: $safetyNotes, ')
          ..write('toolsNeeded: $toolsNeeded, ')
          ..write('recoverableMaterials: $recoverableMaterials, ')
          ..write('partOutNotes: $partOutNotes, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    aliases,
    category,
    cargoDemand,
    destination,
    lowValue,
    likelyValue,
    highValue,
    stripMinutes,
    stripDifficulty,
    safetyNotes,
    toolsNeeded,
    recoverableMaterials,
    partOutNotes,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ObjectTemplateRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.aliases == this.aliases &&
          other.category == this.category &&
          other.cargoDemand == this.cargoDemand &&
          other.destination == this.destination &&
          other.lowValue == this.lowValue &&
          other.likelyValue == this.likelyValue &&
          other.highValue == this.highValue &&
          other.stripMinutes == this.stripMinutes &&
          other.stripDifficulty == this.stripDifficulty &&
          other.safetyNotes == this.safetyNotes &&
          other.toolsNeeded == this.toolsNeeded &&
          other.recoverableMaterials == this.recoverableMaterials &&
          other.partOutNotes == this.partOutNotes &&
          other.notes == this.notes);
}

class ObjectTemplatesCompanion extends UpdateCompanion<ObjectTemplateRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> aliases;
  final Value<String> category;
  final Value<String> cargoDemand;
  final Value<String> destination;
  final Value<double> lowValue;
  final Value<double> likelyValue;
  final Value<double> highValue;
  final Value<int> stripMinutes;
  final Value<int> stripDifficulty;
  final Value<String> safetyNotes;
  final Value<String> toolsNeeded;
  final Value<String> recoverableMaterials;
  final Value<String> partOutNotes;
  final Value<String> notes;
  final Value<int> rowid;
  const ObjectTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.aliases = const Value.absent(),
    this.category = const Value.absent(),
    this.cargoDemand = const Value.absent(),
    this.destination = const Value.absent(),
    this.lowValue = const Value.absent(),
    this.likelyValue = const Value.absent(),
    this.highValue = const Value.absent(),
    this.stripMinutes = const Value.absent(),
    this.stripDifficulty = const Value.absent(),
    this.safetyNotes = const Value.absent(),
    this.toolsNeeded = const Value.absent(),
    this.recoverableMaterials = const Value.absent(),
    this.partOutNotes = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ObjectTemplatesCompanion.insert({
    required String id,
    required String name,
    required String aliases,
    required String category,
    required String cargoDemand,
    required String destination,
    required double lowValue,
    required double likelyValue,
    required double highValue,
    required int stripMinutes,
    required int stripDifficulty,
    required String safetyNotes,
    required String toolsNeeded,
    required String recoverableMaterials,
    required String partOutNotes,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       aliases = Value(aliases),
       category = Value(category),
       cargoDemand = Value(cargoDemand),
       destination = Value(destination),
       lowValue = Value(lowValue),
       likelyValue = Value(likelyValue),
       highValue = Value(highValue),
       stripMinutes = Value(stripMinutes),
       stripDifficulty = Value(stripDifficulty),
       safetyNotes = Value(safetyNotes),
       toolsNeeded = Value(toolsNeeded),
       recoverableMaterials = Value(recoverableMaterials),
       partOutNotes = Value(partOutNotes),
       notes = Value(notes);
  static Insertable<ObjectTemplateRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? aliases,
    Expression<String>? category,
    Expression<String>? cargoDemand,
    Expression<String>? destination,
    Expression<double>? lowValue,
    Expression<double>? likelyValue,
    Expression<double>? highValue,
    Expression<int>? stripMinutes,
    Expression<int>? stripDifficulty,
    Expression<String>? safetyNotes,
    Expression<String>? toolsNeeded,
    Expression<String>? recoverableMaterials,
    Expression<String>? partOutNotes,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (aliases != null) 'aliases': aliases,
      if (category != null) 'category': category,
      if (cargoDemand != null) 'cargo_demand': cargoDemand,
      if (destination != null) 'destination': destination,
      if (lowValue != null) 'low_value': lowValue,
      if (likelyValue != null) 'likely_value': likelyValue,
      if (highValue != null) 'high_value': highValue,
      if (stripMinutes != null) 'strip_minutes': stripMinutes,
      if (stripDifficulty != null) 'strip_difficulty': stripDifficulty,
      if (safetyNotes != null) 'safety_notes': safetyNotes,
      if (toolsNeeded != null) 'tools_needed': toolsNeeded,
      if (recoverableMaterials != null)
        'recoverable_materials': recoverableMaterials,
      if (partOutNotes != null) 'part_out_notes': partOutNotes,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ObjectTemplatesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? aliases,
    Value<String>? category,
    Value<String>? cargoDemand,
    Value<String>? destination,
    Value<double>? lowValue,
    Value<double>? likelyValue,
    Value<double>? highValue,
    Value<int>? stripMinutes,
    Value<int>? stripDifficulty,
    Value<String>? safetyNotes,
    Value<String>? toolsNeeded,
    Value<String>? recoverableMaterials,
    Value<String>? partOutNotes,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return ObjectTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      aliases: aliases ?? this.aliases,
      category: category ?? this.category,
      cargoDemand: cargoDemand ?? this.cargoDemand,
      destination: destination ?? this.destination,
      lowValue: lowValue ?? this.lowValue,
      likelyValue: likelyValue ?? this.likelyValue,
      highValue: highValue ?? this.highValue,
      stripMinutes: stripMinutes ?? this.stripMinutes,
      stripDifficulty: stripDifficulty ?? this.stripDifficulty,
      safetyNotes: safetyNotes ?? this.safetyNotes,
      toolsNeeded: toolsNeeded ?? this.toolsNeeded,
      recoverableMaterials: recoverableMaterials ?? this.recoverableMaterials,
      partOutNotes: partOutNotes ?? this.partOutNotes,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (aliases.present) {
      map['aliases'] = Variable<String>(aliases.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (cargoDemand.present) {
      map['cargo_demand'] = Variable<String>(cargoDemand.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (lowValue.present) {
      map['low_value'] = Variable<double>(lowValue.value);
    }
    if (likelyValue.present) {
      map['likely_value'] = Variable<double>(likelyValue.value);
    }
    if (highValue.present) {
      map['high_value'] = Variable<double>(highValue.value);
    }
    if (stripMinutes.present) {
      map['strip_minutes'] = Variable<int>(stripMinutes.value);
    }
    if (stripDifficulty.present) {
      map['strip_difficulty'] = Variable<int>(stripDifficulty.value);
    }
    if (safetyNotes.present) {
      map['safety_notes'] = Variable<String>(safetyNotes.value);
    }
    if (toolsNeeded.present) {
      map['tools_needed'] = Variable<String>(toolsNeeded.value);
    }
    if (recoverableMaterials.present) {
      map['recoverable_materials'] = Variable<String>(
        recoverableMaterials.value,
      );
    }
    if (partOutNotes.present) {
      map['part_out_notes'] = Variable<String>(partOutNotes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ObjectTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('aliases: $aliases, ')
          ..write('category: $category, ')
          ..write('cargoDemand: $cargoDemand, ')
          ..write('destination: $destination, ')
          ..write('lowValue: $lowValue, ')
          ..write('likelyValue: $likelyValue, ')
          ..write('highValue: $highValue, ')
          ..write('stripMinutes: $stripMinutes, ')
          ..write('stripDifficulty: $stripDifficulty, ')
          ..write('safetyNotes: $safetyNotes, ')
          ..write('toolsNeeded: $toolsNeeded, ')
          ..write('recoverableMaterials: $recoverableMaterials, ')
          ..write('partOutNotes: $partOutNotes, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ScrapItemsTable extends ScrapItems
    with TableInfo<$ScrapItemsTable, ScrapItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScrapItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateIdMeta = const VerificationMeta(
    'templateId',
  );
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
    'template_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES object_templates (id)',
    ),
  );
  static const VerificationMeta _pickupAddressMeta = const VerificationMeta(
    'pickupAddress',
  );
  @override
  late final GeneratedColumn<String> pickupAddress = GeneratedColumn<String>(
    'pickup_address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _locationNameMeta = const VerificationMeta(
    'locationName',
  );
  @override
  late final GeneratedColumn<String> locationName = GeneratedColumn<String>(
    'location_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _milesMeta = const VerificationMeta('miles');
  @override
  late final GeneratedColumn<double> miles = GeneratedColumn<double>(
    'miles',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _timeWindowMeta = const VerificationMeta(
    'timeWindow',
  );
  @override
  late final GeneratedColumn<String> timeWindow = GeneratedColumn<String>(
    'time_window',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _destinationMeta = const VerificationMeta(
    'destination',
  );
  @override
  late final GeneratedColumn<String> destination = GeneratedColumn<String>(
    'destination',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<String> sourceId = GeneratedColumn<String>(
    'source_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceUrlMeta = const VerificationMeta(
    'sourceUrl',
  );
  @override
  late final GeneratedColumn<String> sourceUrl = GeneratedColumn<String>(
    'source_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ruleMatchMeta = const VerificationMeta(
    'ruleMatch',
  );
  @override
  late final GeneratedColumn<String> ruleMatch = GeneratedColumn<String>(
    'rule_match',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _duplicateWarningMeta = const VerificationMeta(
    'duplicateWarning',
  );
  @override
  late final GeneratedColumn<bool> duplicateWarning = GeneratedColumn<bool>(
    'duplicate_warning',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("duplicate_warning" IN (0, 1))',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    templateId,
    pickupAddress,
    locationName,
    miles,
    timeWindow,
    destination,
    status,
    notes,
    source,
    sourceId,
    sourceUrl,
    ruleMatch,
    duplicateWarning,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'scrap_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<ScrapItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
        _templateIdMeta,
        templateId.isAcceptableOrUnknown(data['template_id']!, _templateIdMeta),
      );
    } else if (isInserting) {
      context.missing(_templateIdMeta);
    }
    if (data.containsKey('pickup_address')) {
      context.handle(
        _pickupAddressMeta,
        pickupAddress.isAcceptableOrUnknown(
          data['pickup_address']!,
          _pickupAddressMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_pickupAddressMeta);
    }
    if (data.containsKey('location_name')) {
      context.handle(
        _locationNameMeta,
        locationName.isAcceptableOrUnknown(
          data['location_name']!,
          _locationNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_locationNameMeta);
    }
    if (data.containsKey('miles')) {
      context.handle(
        _milesMeta,
        miles.isAcceptableOrUnknown(data['miles']!, _milesMeta),
      );
    } else if (isInserting) {
      context.missing(_milesMeta);
    }
    if (data.containsKey('time_window')) {
      context.handle(
        _timeWindowMeta,
        timeWindow.isAcceptableOrUnknown(data['time_window']!, _timeWindowMeta),
      );
    } else if (isInserting) {
      context.missing(_timeWindowMeta);
    }
    if (data.containsKey('destination')) {
      context.handle(
        _destinationMeta,
        destination.isAcceptableOrUnknown(
          data['destination']!,
          _destinationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_destinationMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('source_url')) {
      context.handle(
        _sourceUrlMeta,
        sourceUrl.isAcceptableOrUnknown(data['source_url']!, _sourceUrlMeta),
      );
    }
    if (data.containsKey('rule_match')) {
      context.handle(
        _ruleMatchMeta,
        ruleMatch.isAcceptableOrUnknown(data['rule_match']!, _ruleMatchMeta),
      );
    } else if (isInserting) {
      context.missing(_ruleMatchMeta);
    }
    if (data.containsKey('duplicate_warning')) {
      context.handle(
        _duplicateWarningMeta,
        duplicateWarning.isAcceptableOrUnknown(
          data['duplicate_warning']!,
          _duplicateWarningMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_duplicateWarningMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScrapItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ScrapItemRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      templateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_id'],
      )!,
      pickupAddress: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pickup_address'],
      )!,
      locationName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location_name'],
      )!,
      miles: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}miles'],
      )!,
      timeWindow: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}time_window'],
      )!,
      destination: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}destination'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_id'],
      ),
      sourceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_url'],
      ),
      ruleMatch: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}rule_match'],
      )!,
      duplicateWarning: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}duplicate_warning'],
      )!,
    );
  }

  @override
  $ScrapItemsTable createAlias(String alias) {
    return $ScrapItemsTable(attachedDatabase, alias);
  }
}

class ScrapItemRow extends DataClass implements Insertable<ScrapItemRow> {
  final String id;
  final String title;
  final String templateId;
  final String pickupAddress;
  final String locationName;
  final double miles;
  final String timeWindow;
  final String destination;
  final String status;
  final String notes;
  final String source;
  final String? sourceId;
  final String? sourceUrl;
  final String ruleMatch;
  final bool duplicateWarning;
  const ScrapItemRow({
    required this.id,
    required this.title,
    required this.templateId,
    required this.pickupAddress,
    required this.locationName,
    required this.miles,
    required this.timeWindow,
    required this.destination,
    required this.status,
    required this.notes,
    required this.source,
    this.sourceId,
    this.sourceUrl,
    required this.ruleMatch,
    required this.duplicateWarning,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['template_id'] = Variable<String>(templateId);
    map['pickup_address'] = Variable<String>(pickupAddress);
    map['location_name'] = Variable<String>(locationName);
    map['miles'] = Variable<double>(miles);
    map['time_window'] = Variable<String>(timeWindow);
    map['destination'] = Variable<String>(destination);
    map['status'] = Variable<String>(status);
    map['notes'] = Variable<String>(notes);
    map['source'] = Variable<String>(source);
    if (!nullToAbsent || sourceId != null) {
      map['source_id'] = Variable<String>(sourceId);
    }
    if (!nullToAbsent || sourceUrl != null) {
      map['source_url'] = Variable<String>(sourceUrl);
    }
    map['rule_match'] = Variable<String>(ruleMatch);
    map['duplicate_warning'] = Variable<bool>(duplicateWarning);
    return map;
  }

  ScrapItemsCompanion toCompanion(bool nullToAbsent) {
    return ScrapItemsCompanion(
      id: Value(id),
      title: Value(title),
      templateId: Value(templateId),
      pickupAddress: Value(pickupAddress),
      locationName: Value(locationName),
      miles: Value(miles),
      timeWindow: Value(timeWindow),
      destination: Value(destination),
      status: Value(status),
      notes: Value(notes),
      source: Value(source),
      sourceId: sourceId == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceId),
      sourceUrl: sourceUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(sourceUrl),
      ruleMatch: Value(ruleMatch),
      duplicateWarning: Value(duplicateWarning),
    );
  }

  factory ScrapItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScrapItemRow(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      templateId: serializer.fromJson<String>(json['templateId']),
      pickupAddress: serializer.fromJson<String>(json['pickupAddress']),
      locationName: serializer.fromJson<String>(json['locationName']),
      miles: serializer.fromJson<double>(json['miles']),
      timeWindow: serializer.fromJson<String>(json['timeWindow']),
      destination: serializer.fromJson<String>(json['destination']),
      status: serializer.fromJson<String>(json['status']),
      notes: serializer.fromJson<String>(json['notes']),
      source: serializer.fromJson<String>(json['source']),
      sourceId: serializer.fromJson<String?>(json['sourceId']),
      sourceUrl: serializer.fromJson<String?>(json['sourceUrl']),
      ruleMatch: serializer.fromJson<String>(json['ruleMatch']),
      duplicateWarning: serializer.fromJson<bool>(json['duplicateWarning']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'templateId': serializer.toJson<String>(templateId),
      'pickupAddress': serializer.toJson<String>(pickupAddress),
      'locationName': serializer.toJson<String>(locationName),
      'miles': serializer.toJson<double>(miles),
      'timeWindow': serializer.toJson<String>(timeWindow),
      'destination': serializer.toJson<String>(destination),
      'status': serializer.toJson<String>(status),
      'notes': serializer.toJson<String>(notes),
      'source': serializer.toJson<String>(source),
      'sourceId': serializer.toJson<String?>(sourceId),
      'sourceUrl': serializer.toJson<String?>(sourceUrl),
      'ruleMatch': serializer.toJson<String>(ruleMatch),
      'duplicateWarning': serializer.toJson<bool>(duplicateWarning),
    };
  }

  ScrapItemRow copyWith({
    String? id,
    String? title,
    String? templateId,
    String? pickupAddress,
    String? locationName,
    double? miles,
    String? timeWindow,
    String? destination,
    String? status,
    String? notes,
    String? source,
    Value<String?> sourceId = const Value.absent(),
    Value<String?> sourceUrl = const Value.absent(),
    String? ruleMatch,
    bool? duplicateWarning,
  }) => ScrapItemRow(
    id: id ?? this.id,
    title: title ?? this.title,
    templateId: templateId ?? this.templateId,
    pickupAddress: pickupAddress ?? this.pickupAddress,
    locationName: locationName ?? this.locationName,
    miles: miles ?? this.miles,
    timeWindow: timeWindow ?? this.timeWindow,
    destination: destination ?? this.destination,
    status: status ?? this.status,
    notes: notes ?? this.notes,
    source: source ?? this.source,
    sourceId: sourceId.present ? sourceId.value : this.sourceId,
    sourceUrl: sourceUrl.present ? sourceUrl.value : this.sourceUrl,
    ruleMatch: ruleMatch ?? this.ruleMatch,
    duplicateWarning: duplicateWarning ?? this.duplicateWarning,
  );
  ScrapItemRow copyWithCompanion(ScrapItemsCompanion data) {
    return ScrapItemRow(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      templateId: data.templateId.present
          ? data.templateId.value
          : this.templateId,
      pickupAddress: data.pickupAddress.present
          ? data.pickupAddress.value
          : this.pickupAddress,
      locationName: data.locationName.present
          ? data.locationName.value
          : this.locationName,
      miles: data.miles.present ? data.miles.value : this.miles,
      timeWindow: data.timeWindow.present
          ? data.timeWindow.value
          : this.timeWindow,
      destination: data.destination.present
          ? data.destination.value
          : this.destination,
      status: data.status.present ? data.status.value : this.status,
      notes: data.notes.present ? data.notes.value : this.notes,
      source: data.source.present ? data.source.value : this.source,
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceUrl: data.sourceUrl.present ? data.sourceUrl.value : this.sourceUrl,
      ruleMatch: data.ruleMatch.present ? data.ruleMatch.value : this.ruleMatch,
      duplicateWarning: data.duplicateWarning.present
          ? data.duplicateWarning.value
          : this.duplicateWarning,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ScrapItemRow(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('templateId: $templateId, ')
          ..write('pickupAddress: $pickupAddress, ')
          ..write('locationName: $locationName, ')
          ..write('miles: $miles, ')
          ..write('timeWindow: $timeWindow, ')
          ..write('destination: $destination, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('ruleMatch: $ruleMatch, ')
          ..write('duplicateWarning: $duplicateWarning')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    templateId,
    pickupAddress,
    locationName,
    miles,
    timeWindow,
    destination,
    status,
    notes,
    source,
    sourceId,
    sourceUrl,
    ruleMatch,
    duplicateWarning,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScrapItemRow &&
          other.id == this.id &&
          other.title == this.title &&
          other.templateId == this.templateId &&
          other.pickupAddress == this.pickupAddress &&
          other.locationName == this.locationName &&
          other.miles == this.miles &&
          other.timeWindow == this.timeWindow &&
          other.destination == this.destination &&
          other.status == this.status &&
          other.notes == this.notes &&
          other.source == this.source &&
          other.sourceId == this.sourceId &&
          other.sourceUrl == this.sourceUrl &&
          other.ruleMatch == this.ruleMatch &&
          other.duplicateWarning == this.duplicateWarning);
}

class ScrapItemsCompanion extends UpdateCompanion<ScrapItemRow> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> templateId;
  final Value<String> pickupAddress;
  final Value<String> locationName;
  final Value<double> miles;
  final Value<String> timeWindow;
  final Value<String> destination;
  final Value<String> status;
  final Value<String> notes;
  final Value<String> source;
  final Value<String?> sourceId;
  final Value<String?> sourceUrl;
  final Value<String> ruleMatch;
  final Value<bool> duplicateWarning;
  final Value<int> rowid;
  const ScrapItemsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.templateId = const Value.absent(),
    this.pickupAddress = const Value.absent(),
    this.locationName = const Value.absent(),
    this.miles = const Value.absent(),
    this.timeWindow = const Value.absent(),
    this.destination = const Value.absent(),
    this.status = const Value.absent(),
    this.notes = const Value.absent(),
    this.source = const Value.absent(),
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    this.ruleMatch = const Value.absent(),
    this.duplicateWarning = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ScrapItemsCompanion.insert({
    required String id,
    required String title,
    required String templateId,
    required String pickupAddress,
    required String locationName,
    required double miles,
    required String timeWindow,
    required String destination,
    required String status,
    required String notes,
    required String source,
    this.sourceId = const Value.absent(),
    this.sourceUrl = const Value.absent(),
    required String ruleMatch,
    required bool duplicateWarning,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       templateId = Value(templateId),
       pickupAddress = Value(pickupAddress),
       locationName = Value(locationName),
       miles = Value(miles),
       timeWindow = Value(timeWindow),
       destination = Value(destination),
       status = Value(status),
       notes = Value(notes),
       source = Value(source),
       ruleMatch = Value(ruleMatch),
       duplicateWarning = Value(duplicateWarning);
  static Insertable<ScrapItemRow> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? templateId,
    Expression<String>? pickupAddress,
    Expression<String>? locationName,
    Expression<double>? miles,
    Expression<String>? timeWindow,
    Expression<String>? destination,
    Expression<String>? status,
    Expression<String>? notes,
    Expression<String>? source,
    Expression<String>? sourceId,
    Expression<String>? sourceUrl,
    Expression<String>? ruleMatch,
    Expression<bool>? duplicateWarning,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (templateId != null) 'template_id': templateId,
      if (pickupAddress != null) 'pickup_address': pickupAddress,
      if (locationName != null) 'location_name': locationName,
      if (miles != null) 'miles': miles,
      if (timeWindow != null) 'time_window': timeWindow,
      if (destination != null) 'destination': destination,
      if (status != null) 'status': status,
      if (notes != null) 'notes': notes,
      if (source != null) 'source': source,
      if (sourceId != null) 'source_id': sourceId,
      if (sourceUrl != null) 'source_url': sourceUrl,
      if (ruleMatch != null) 'rule_match': ruleMatch,
      if (duplicateWarning != null) 'duplicate_warning': duplicateWarning,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ScrapItemsCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? templateId,
    Value<String>? pickupAddress,
    Value<String>? locationName,
    Value<double>? miles,
    Value<String>? timeWindow,
    Value<String>? destination,
    Value<String>? status,
    Value<String>? notes,
    Value<String>? source,
    Value<String?>? sourceId,
    Value<String?>? sourceUrl,
    Value<String>? ruleMatch,
    Value<bool>? duplicateWarning,
    Value<int>? rowid,
  }) {
    return ScrapItemsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      templateId: templateId ?? this.templateId,
      pickupAddress: pickupAddress ?? this.pickupAddress,
      locationName: locationName ?? this.locationName,
      miles: miles ?? this.miles,
      timeWindow: timeWindow ?? this.timeWindow,
      destination: destination ?? this.destination,
      status: status ?? this.status,
      notes: notes ?? this.notes,
      source: source ?? this.source,
      sourceId: sourceId ?? this.sourceId,
      sourceUrl: sourceUrl ?? this.sourceUrl,
      ruleMatch: ruleMatch ?? this.ruleMatch,
      duplicateWarning: duplicateWarning ?? this.duplicateWarning,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (pickupAddress.present) {
      map['pickup_address'] = Variable<String>(pickupAddress.value);
    }
    if (locationName.present) {
      map['location_name'] = Variable<String>(locationName.value);
    }
    if (miles.present) {
      map['miles'] = Variable<double>(miles.value);
    }
    if (timeWindow.present) {
      map['time_window'] = Variable<String>(timeWindow.value);
    }
    if (destination.present) {
      map['destination'] = Variable<String>(destination.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (sourceId.present) {
      map['source_id'] = Variable<String>(sourceId.value);
    }
    if (sourceUrl.present) {
      map['source_url'] = Variable<String>(sourceUrl.value);
    }
    if (ruleMatch.present) {
      map['rule_match'] = Variable<String>(ruleMatch.value);
    }
    if (duplicateWarning.present) {
      map['duplicate_warning'] = Variable<bool>(duplicateWarning.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScrapItemsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('templateId: $templateId, ')
          ..write('pickupAddress: $pickupAddress, ')
          ..write('locationName: $locationName, ')
          ..write('miles: $miles, ')
          ..write('timeWindow: $timeWindow, ')
          ..write('destination: $destination, ')
          ..write('status: $status, ')
          ..write('notes: $notes, ')
          ..write('source: $source, ')
          ..write('sourceId: $sourceId, ')
          ..write('sourceUrl: $sourceUrl, ')
          ..write('ruleMatch: $ruleMatch, ')
          ..write('duplicateWarning: $duplicateWarning, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RunPlansTable extends RunPlans
    with TableInfo<$RunPlansTable, RunPlanRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RunPlansTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles (id)',
    ),
  );
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
    'active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("active" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, vehicleId, active];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'run_plans';
  @override
  VerificationContext validateIntegrity(
    Insertable<RunPlanRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('active')) {
      context.handle(
        _activeMeta,
        active.isAcceptableOrUnknown(data['active']!, _activeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RunPlanRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RunPlanRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      active: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}active'],
      )!,
    );
  }

  @override
  $RunPlansTable createAlias(String alias) {
    return $RunPlansTable(attachedDatabase, alias);
  }
}

class RunPlanRow extends DataClass implements Insertable<RunPlanRow> {
  final String id;
  final String name;
  final String vehicleId;
  final bool active;
  const RunPlanRow({
    required this.id,
    required this.name,
    required this.vehicleId,
    required this.active,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['active'] = Variable<bool>(active);
    return map;
  }

  RunPlansCompanion toCompanion(bool nullToAbsent) {
    return RunPlansCompanion(
      id: Value(id),
      name: Value(name),
      vehicleId: Value(vehicleId),
      active: Value(active),
    );
  }

  factory RunPlanRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RunPlanRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      active: serializer.fromJson<bool>(json['active']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'active': serializer.toJson<bool>(active),
    };
  }

  RunPlanRow copyWith({
    String? id,
    String? name,
    String? vehicleId,
    bool? active,
  }) => RunPlanRow(
    id: id ?? this.id,
    name: name ?? this.name,
    vehicleId: vehicleId ?? this.vehicleId,
    active: active ?? this.active,
  );
  RunPlanRow copyWithCompanion(RunPlansCompanion data) {
    return RunPlanRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      active: data.active.present ? data.active.value : this.active,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RunPlanRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('active: $active')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, vehicleId, active);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RunPlanRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.vehicleId == this.vehicleId &&
          other.active == this.active);
}

class RunPlansCompanion extends UpdateCompanion<RunPlanRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> vehicleId;
  final Value<bool> active;
  final Value<int> rowid;
  const RunPlansCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RunPlansCompanion.insert({
    required String id,
    required String name,
    required String vehicleId,
    this.active = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       vehicleId = Value(vehicleId);
  static Insertable<RunPlanRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? vehicleId,
    Expression<bool>? active,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (active != null) 'active': active,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RunPlansCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? vehicleId,
    Value<bool>? active,
    Value<int>? rowid,
  }) {
    return RunPlansCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      vehicleId: vehicleId ?? this.vehicleId,
      active: active ?? this.active,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RunPlansCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('active: $active, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RunPlanItemsTable extends RunPlanItems
    with TableInfo<$RunPlanItemsTable, RunPlanItemRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RunPlanItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _runPlanIdMeta = const VerificationMeta(
    'runPlanId',
  );
  @override
  late final GeneratedColumn<String> runPlanId = GeneratedColumn<String>(
    'run_plan_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES run_plans (id)',
    ),
  );
  static const VerificationMeta _itemIdMeta = const VerificationMeta('itemId');
  @override
  late final GeneratedColumn<String> itemId = GeneratedColumn<String>(
    'item_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES scrap_items (id)',
    ),
  );
  static const VerificationMeta _stopOrderMeta = const VerificationMeta(
    'stopOrder',
  );
  @override
  late final GeneratedColumn<int> stopOrder = GeneratedColumn<int>(
    'stop_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [runPlanId, itemId, stopOrder];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'run_plan_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RunPlanItemRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('run_plan_id')) {
      context.handle(
        _runPlanIdMeta,
        runPlanId.isAcceptableOrUnknown(data['run_plan_id']!, _runPlanIdMeta),
      );
    } else if (isInserting) {
      context.missing(_runPlanIdMeta);
    }
    if (data.containsKey('item_id')) {
      context.handle(
        _itemIdMeta,
        itemId.isAcceptableOrUnknown(data['item_id']!, _itemIdMeta),
      );
    } else if (isInserting) {
      context.missing(_itemIdMeta);
    }
    if (data.containsKey('stop_order')) {
      context.handle(
        _stopOrderMeta,
        stopOrder.isAcceptableOrUnknown(data['stop_order']!, _stopOrderMeta),
      );
    } else if (isInserting) {
      context.missing(_stopOrderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {runPlanId, itemId};
  @override
  RunPlanItemRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RunPlanItemRow(
      runPlanId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}run_plan_id'],
      )!,
      itemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}item_id'],
      )!,
      stopOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stop_order'],
      )!,
    );
  }

  @override
  $RunPlanItemsTable createAlias(String alias) {
    return $RunPlanItemsTable(attachedDatabase, alias);
  }
}

class RunPlanItemRow extends DataClass implements Insertable<RunPlanItemRow> {
  final String runPlanId;
  final String itemId;
  final int stopOrder;
  const RunPlanItemRow({
    required this.runPlanId,
    required this.itemId,
    required this.stopOrder,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['run_plan_id'] = Variable<String>(runPlanId);
    map['item_id'] = Variable<String>(itemId);
    map['stop_order'] = Variable<int>(stopOrder);
    return map;
  }

  RunPlanItemsCompanion toCompanion(bool nullToAbsent) {
    return RunPlanItemsCompanion(
      runPlanId: Value(runPlanId),
      itemId: Value(itemId),
      stopOrder: Value(stopOrder),
    );
  }

  factory RunPlanItemRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RunPlanItemRow(
      runPlanId: serializer.fromJson<String>(json['runPlanId']),
      itemId: serializer.fromJson<String>(json['itemId']),
      stopOrder: serializer.fromJson<int>(json['stopOrder']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'runPlanId': serializer.toJson<String>(runPlanId),
      'itemId': serializer.toJson<String>(itemId),
      'stopOrder': serializer.toJson<int>(stopOrder),
    };
  }

  RunPlanItemRow copyWith({
    String? runPlanId,
    String? itemId,
    int? stopOrder,
  }) => RunPlanItemRow(
    runPlanId: runPlanId ?? this.runPlanId,
    itemId: itemId ?? this.itemId,
    stopOrder: stopOrder ?? this.stopOrder,
  );
  RunPlanItemRow copyWithCompanion(RunPlanItemsCompanion data) {
    return RunPlanItemRow(
      runPlanId: data.runPlanId.present ? data.runPlanId.value : this.runPlanId,
      itemId: data.itemId.present ? data.itemId.value : this.itemId,
      stopOrder: data.stopOrder.present ? data.stopOrder.value : this.stopOrder,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RunPlanItemRow(')
          ..write('runPlanId: $runPlanId, ')
          ..write('itemId: $itemId, ')
          ..write('stopOrder: $stopOrder')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(runPlanId, itemId, stopOrder);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RunPlanItemRow &&
          other.runPlanId == this.runPlanId &&
          other.itemId == this.itemId &&
          other.stopOrder == this.stopOrder);
}

class RunPlanItemsCompanion extends UpdateCompanion<RunPlanItemRow> {
  final Value<String> runPlanId;
  final Value<String> itemId;
  final Value<int> stopOrder;
  final Value<int> rowid;
  const RunPlanItemsCompanion({
    this.runPlanId = const Value.absent(),
    this.itemId = const Value.absent(),
    this.stopOrder = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RunPlanItemsCompanion.insert({
    required String runPlanId,
    required String itemId,
    required int stopOrder,
    this.rowid = const Value.absent(),
  }) : runPlanId = Value(runPlanId),
       itemId = Value(itemId),
       stopOrder = Value(stopOrder);
  static Insertable<RunPlanItemRow> custom({
    Expression<String>? runPlanId,
    Expression<String>? itemId,
    Expression<int>? stopOrder,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (runPlanId != null) 'run_plan_id': runPlanId,
      if (itemId != null) 'item_id': itemId,
      if (stopOrder != null) 'stop_order': stopOrder,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RunPlanItemsCompanion copyWith({
    Value<String>? runPlanId,
    Value<String>? itemId,
    Value<int>? stopOrder,
    Value<int>? rowid,
  }) {
    return RunPlanItemsCompanion(
      runPlanId: runPlanId ?? this.runPlanId,
      itemId: itemId ?? this.itemId,
      stopOrder: stopOrder ?? this.stopOrder,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (runPlanId.present) {
      map['run_plan_id'] = Variable<String>(runPlanId.value);
    }
    if (itemId.present) {
      map['item_id'] = Variable<String>(itemId.value);
    }
    if (stopOrder.present) {
      map['stop_order'] = Variable<int>(stopOrder.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RunPlanItemsCompanion(')
          ..write('runPlanId: $runPlanId, ')
          ..write('itemId: $itemId, ')
          ..write('stopOrder: $stopOrder, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ReceiptsTable extends Receipts
    with TableInfo<$ReceiptsTable, ReceiptRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ReceiptsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yardIdMeta = const VerificationMeta('yardId');
  @override
  late final GeneratedColumn<String> yardId = GeneratedColumn<String>(
    'yard_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES yards (id)',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, yardId, amount, date, notes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'receipts';
  @override
  VerificationContext validateIntegrity(
    Insertable<ReceiptRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('yard_id')) {
      context.handle(
        _yardIdMeta,
        yardId.isAcceptableOrUnknown(data['yard_id']!, _yardIdMeta),
      );
    } else if (isInserting) {
      context.missing(_yardIdMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ReceiptRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReceiptRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      yardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}yard_id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $ReceiptsTable createAlias(String alias) {
    return $ReceiptsTable(attachedDatabase, alias);
  }
}

class ReceiptRow extends DataClass implements Insertable<ReceiptRow> {
  final String id;
  final String yardId;
  final double amount;
  final DateTime date;
  final String notes;
  const ReceiptRow({
    required this.id,
    required this.yardId,
    required this.amount,
    required this.date,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['yard_id'] = Variable<String>(yardId);
    map['amount'] = Variable<double>(amount);
    map['date'] = Variable<DateTime>(date);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  ReceiptsCompanion toCompanion(bool nullToAbsent) {
    return ReceiptsCompanion(
      id: Value(id),
      yardId: Value(yardId),
      amount: Value(amount),
      date: Value(date),
      notes: Value(notes),
    );
  }

  factory ReceiptRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReceiptRow(
      id: serializer.fromJson<String>(json['id']),
      yardId: serializer.fromJson<String>(json['yardId']),
      amount: serializer.fromJson<double>(json['amount']),
      date: serializer.fromJson<DateTime>(json['date']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'yardId': serializer.toJson<String>(yardId),
      'amount': serializer.toJson<double>(amount),
      'date': serializer.toJson<DateTime>(date),
      'notes': serializer.toJson<String>(notes),
    };
  }

  ReceiptRow copyWith({
    String? id,
    String? yardId,
    double? amount,
    DateTime? date,
    String? notes,
  }) => ReceiptRow(
    id: id ?? this.id,
    yardId: yardId ?? this.yardId,
    amount: amount ?? this.amount,
    date: date ?? this.date,
    notes: notes ?? this.notes,
  );
  ReceiptRow copyWithCompanion(ReceiptsCompanion data) {
    return ReceiptRow(
      id: data.id.present ? data.id.value : this.id,
      yardId: data.yardId.present ? data.yardId.value : this.yardId,
      amount: data.amount.present ? data.amount.value : this.amount,
      date: data.date.present ? data.date.value : this.date,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptRow(')
          ..write('id: $id, ')
          ..write('yardId: $yardId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, yardId, amount, date, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReceiptRow &&
          other.id == this.id &&
          other.yardId == this.yardId &&
          other.amount == this.amount &&
          other.date == this.date &&
          other.notes == this.notes);
}

class ReceiptsCompanion extends UpdateCompanion<ReceiptRow> {
  final Value<String> id;
  final Value<String> yardId;
  final Value<double> amount;
  final Value<DateTime> date;
  final Value<String> notes;
  final Value<int> rowid;
  const ReceiptsCompanion({
    this.id = const Value.absent(),
    this.yardId = const Value.absent(),
    this.amount = const Value.absent(),
    this.date = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReceiptsCompanion.insert({
    required String id,
    required String yardId,
    required double amount,
    required DateTime date,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       yardId = Value(yardId),
       amount = Value(amount),
       date = Value(date),
       notes = Value(notes);
  static Insertable<ReceiptRow> custom({
    Expression<String>? id,
    Expression<String>? yardId,
    Expression<double>? amount,
    Expression<DateTime>? date,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (yardId != null) 'yard_id': yardId,
      if (amount != null) 'amount': amount,
      if (date != null) 'date': date,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReceiptsCompanion copyWith({
    Value<String>? id,
    Value<String>? yardId,
    Value<double>? amount,
    Value<DateTime>? date,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return ReceiptsCompanion(
      id: id ?? this.id,
      yardId: yardId ?? this.yardId,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (yardId.present) {
      map['yard_id'] = Variable<String>(yardId.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReceiptsCompanion(')
          ..write('id: $id, ')
          ..write('yardId: $yardId, ')
          ..write('amount: $amount, ')
          ..write('date: $date, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PhotoAttachmentsTable extends PhotoAttachments
    with TableInfo<$PhotoAttachmentsTable, PhotoAttachmentRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PhotoAttachmentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerIdMeta = const VerificationMeta(
    'ownerId',
  );
  @override
  late final GeneratedColumn<String> ownerId = GeneratedColumn<String>(
    'owner_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ownerTypeMeta = const VerificationMeta(
    'ownerType',
  );
  @override
  late final GeneratedColumn<String> ownerType = GeneratedColumn<String>(
    'owner_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _captionMeta = const VerificationMeta(
    'caption',
  );
  @override
  late final GeneratedColumn<String> caption = GeneratedColumn<String>(
    'caption',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _hashMeta = const VerificationMeta('hash');
  @override
  late final GeneratedColumn<String> hash = GeneratedColumn<String>(
    'hash',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ocrTextMeta = const VerificationMeta(
    'ocrText',
  );
  @override
  late final GeneratedColumn<String> ocrText = GeneratedColumn<String>(
    'ocr_text',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    ownerId,
    ownerType,
    localPath,
    caption,
    createdAt,
    hash,
    ocrText,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'photo_attachments';
  @override
  VerificationContext validateIntegrity(
    Insertable<PhotoAttachmentRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('owner_id')) {
      context.handle(
        _ownerIdMeta,
        ownerId.isAcceptableOrUnknown(data['owner_id']!, _ownerIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerIdMeta);
    }
    if (data.containsKey('owner_type')) {
      context.handle(
        _ownerTypeMeta,
        ownerType.isAcceptableOrUnknown(data['owner_type']!, _ownerTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_ownerTypeMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('caption')) {
      context.handle(
        _captionMeta,
        caption.isAcceptableOrUnknown(data['caption']!, _captionMeta),
      );
    } else if (isInserting) {
      context.missing(_captionMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('hash')) {
      context.handle(
        _hashMeta,
        hash.isAcceptableOrUnknown(data['hash']!, _hashMeta),
      );
    }
    if (data.containsKey('ocr_text')) {
      context.handle(
        _ocrTextMeta,
        ocrText.isAcceptableOrUnknown(data['ocr_text']!, _ocrTextMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PhotoAttachmentRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PhotoAttachmentRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ownerId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_id'],
      )!,
      ownerType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}owner_type'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      ),
      caption: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}caption'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      hash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}hash'],
      ),
      ocrText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ocr_text'],
      ),
    );
  }

  @override
  $PhotoAttachmentsTable createAlias(String alias) {
    return $PhotoAttachmentsTable(attachedDatabase, alias);
  }
}

class PhotoAttachmentRow extends DataClass
    implements Insertable<PhotoAttachmentRow> {
  final String id;
  final String ownerId;
  final String ownerType;
  final String? localPath;
  final String caption;
  final DateTime createdAt;
  final String? hash;
  final String? ocrText;
  const PhotoAttachmentRow({
    required this.id,
    required this.ownerId,
    required this.ownerType,
    this.localPath,
    required this.caption,
    required this.createdAt,
    this.hash,
    this.ocrText,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['owner_id'] = Variable<String>(ownerId);
    map['owner_type'] = Variable<String>(ownerType);
    if (!nullToAbsent || localPath != null) {
      map['local_path'] = Variable<String>(localPath);
    }
    map['caption'] = Variable<String>(caption);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || hash != null) {
      map['hash'] = Variable<String>(hash);
    }
    if (!nullToAbsent || ocrText != null) {
      map['ocr_text'] = Variable<String>(ocrText);
    }
    return map;
  }

  PhotoAttachmentsCompanion toCompanion(bool nullToAbsent) {
    return PhotoAttachmentsCompanion(
      id: Value(id),
      ownerId: Value(ownerId),
      ownerType: Value(ownerType),
      localPath: localPath == null && nullToAbsent
          ? const Value.absent()
          : Value(localPath),
      caption: Value(caption),
      createdAt: Value(createdAt),
      hash: hash == null && nullToAbsent ? const Value.absent() : Value(hash),
      ocrText: ocrText == null && nullToAbsent
          ? const Value.absent()
          : Value(ocrText),
    );
  }

  factory PhotoAttachmentRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PhotoAttachmentRow(
      id: serializer.fromJson<String>(json['id']),
      ownerId: serializer.fromJson<String>(json['ownerId']),
      ownerType: serializer.fromJson<String>(json['ownerType']),
      localPath: serializer.fromJson<String?>(json['localPath']),
      caption: serializer.fromJson<String>(json['caption']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      hash: serializer.fromJson<String?>(json['hash']),
      ocrText: serializer.fromJson<String?>(json['ocrText']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ownerId': serializer.toJson<String>(ownerId),
      'ownerType': serializer.toJson<String>(ownerType),
      'localPath': serializer.toJson<String?>(localPath),
      'caption': serializer.toJson<String>(caption),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'hash': serializer.toJson<String?>(hash),
      'ocrText': serializer.toJson<String?>(ocrText),
    };
  }

  PhotoAttachmentRow copyWith({
    String? id,
    String? ownerId,
    String? ownerType,
    Value<String?> localPath = const Value.absent(),
    String? caption,
    DateTime? createdAt,
    Value<String?> hash = const Value.absent(),
    Value<String?> ocrText = const Value.absent(),
  }) => PhotoAttachmentRow(
    id: id ?? this.id,
    ownerId: ownerId ?? this.ownerId,
    ownerType: ownerType ?? this.ownerType,
    localPath: localPath.present ? localPath.value : this.localPath,
    caption: caption ?? this.caption,
    createdAt: createdAt ?? this.createdAt,
    hash: hash.present ? hash.value : this.hash,
    ocrText: ocrText.present ? ocrText.value : this.ocrText,
  );
  PhotoAttachmentRow copyWithCompanion(PhotoAttachmentsCompanion data) {
    return PhotoAttachmentRow(
      id: data.id.present ? data.id.value : this.id,
      ownerId: data.ownerId.present ? data.ownerId.value : this.ownerId,
      ownerType: data.ownerType.present ? data.ownerType.value : this.ownerType,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      caption: data.caption.present ? data.caption.value : this.caption,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      hash: data.hash.present ? data.hash.value : this.hash,
      ocrText: data.ocrText.present ? data.ocrText.value : this.ocrText,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAttachmentRow(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerType: $ownerType, ')
          ..write('localPath: $localPath, ')
          ..write('caption: $caption, ')
          ..write('createdAt: $createdAt, ')
          ..write('hash: $hash, ')
          ..write('ocrText: $ocrText')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    ownerId,
    ownerType,
    localPath,
    caption,
    createdAt,
    hash,
    ocrText,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PhotoAttachmentRow &&
          other.id == this.id &&
          other.ownerId == this.ownerId &&
          other.ownerType == this.ownerType &&
          other.localPath == this.localPath &&
          other.caption == this.caption &&
          other.createdAt == this.createdAt &&
          other.hash == this.hash &&
          other.ocrText == this.ocrText);
}

class PhotoAttachmentsCompanion extends UpdateCompanion<PhotoAttachmentRow> {
  final Value<String> id;
  final Value<String> ownerId;
  final Value<String> ownerType;
  final Value<String?> localPath;
  final Value<String> caption;
  final Value<DateTime> createdAt;
  final Value<String?> hash;
  final Value<String?> ocrText;
  final Value<int> rowid;
  const PhotoAttachmentsCompanion({
    this.id = const Value.absent(),
    this.ownerId = const Value.absent(),
    this.ownerType = const Value.absent(),
    this.localPath = const Value.absent(),
    this.caption = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.hash = const Value.absent(),
    this.ocrText = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PhotoAttachmentsCompanion.insert({
    required String id,
    required String ownerId,
    required String ownerType,
    this.localPath = const Value.absent(),
    required String caption,
    required DateTime createdAt,
    this.hash = const Value.absent(),
    this.ocrText = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ownerId = Value(ownerId),
       ownerType = Value(ownerType),
       caption = Value(caption),
       createdAt = Value(createdAt);
  static Insertable<PhotoAttachmentRow> custom({
    Expression<String>? id,
    Expression<String>? ownerId,
    Expression<String>? ownerType,
    Expression<String>? localPath,
    Expression<String>? caption,
    Expression<DateTime>? createdAt,
    Expression<String>? hash,
    Expression<String>? ocrText,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ownerId != null) 'owner_id': ownerId,
      if (ownerType != null) 'owner_type': ownerType,
      if (localPath != null) 'local_path': localPath,
      if (caption != null) 'caption': caption,
      if (createdAt != null) 'created_at': createdAt,
      if (hash != null) 'hash': hash,
      if (ocrText != null) 'ocr_text': ocrText,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PhotoAttachmentsCompanion copyWith({
    Value<String>? id,
    Value<String>? ownerId,
    Value<String>? ownerType,
    Value<String?>? localPath,
    Value<String>? caption,
    Value<DateTime>? createdAt,
    Value<String?>? hash,
    Value<String?>? ocrText,
    Value<int>? rowid,
  }) {
    return PhotoAttachmentsCompanion(
      id: id ?? this.id,
      ownerId: ownerId ?? this.ownerId,
      ownerType: ownerType ?? this.ownerType,
      localPath: localPath ?? this.localPath,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
      hash: hash ?? this.hash,
      ocrText: ocrText ?? this.ocrText,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ownerId.present) {
      map['owner_id'] = Variable<String>(ownerId.value);
    }
    if (ownerType.present) {
      map['owner_type'] = Variable<String>(ownerType.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (caption.present) {
      map['caption'] = Variable<String>(caption.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (hash.present) {
      map['hash'] = Variable<String>(hash.value);
    }
    if (ocrText.present) {
      map['ocr_text'] = Variable<String>(ocrText.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PhotoAttachmentsCompanion(')
          ..write('id: $id, ')
          ..write('ownerId: $ownerId, ')
          ..write('ownerType: $ownerType, ')
          ..write('localPath: $localPath, ')
          ..write('caption: $caption, ')
          ..write('createdAt: $createdAt, ')
          ..write('hash: $hash, ')
          ..write('ocrText: $ocrText, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssistantContextsTable extends AssistantContexts
    with TableInfo<$AssistantContextsTable, AssistantContextRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssistantContextsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _currentScreenMeta = const VerificationMeta(
    'currentScreen',
  );
  @override
  late final GeneratedColumn<String> currentScreen = GeneratedColumn<String>(
    'current_screen',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _selectedItemIdMeta = const VerificationMeta(
    'selectedItemId',
  );
  @override
  late final GeneratedColumn<String> selectedItemId = GeneratedColumn<String>(
    'selected_item_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectedTemplateIdMeta =
      const VerificationMeta('selectedTemplateId');
  @override
  late final GeneratedColumn<String> selectedTemplateId =
      GeneratedColumn<String>(
        'selected_template_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _selectedRunIdMeta = const VerificationMeta(
    'selectedRunId',
  );
  @override
  late final GeneratedColumn<String> selectedRunId = GeneratedColumn<String>(
    'selected_run_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectedYardIdMeta = const VerificationMeta(
    'selectedYardId',
  );
  @override
  late final GeneratedColumn<String> selectedYardId = GeneratedColumn<String>(
    'selected_yard_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _selectedReceiptIdMeta = const VerificationMeta(
    'selectedReceiptId',
  );
  @override
  late final GeneratedColumn<String> selectedReceiptId =
      GeneratedColumn<String>(
        'selected_receipt_id',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    currentScreen,
    selectedItemId,
    selectedTemplateId,
    selectedRunId,
    selectedYardId,
    selectedReceiptId,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assistant_contexts';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssistantContextRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_screen')) {
      context.handle(
        _currentScreenMeta,
        currentScreen.isAcceptableOrUnknown(
          data['current_screen']!,
          _currentScreenMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentScreenMeta);
    }
    if (data.containsKey('selected_item_id')) {
      context.handle(
        _selectedItemIdMeta,
        selectedItemId.isAcceptableOrUnknown(
          data['selected_item_id']!,
          _selectedItemIdMeta,
        ),
      );
    }
    if (data.containsKey('selected_template_id')) {
      context.handle(
        _selectedTemplateIdMeta,
        selectedTemplateId.isAcceptableOrUnknown(
          data['selected_template_id']!,
          _selectedTemplateIdMeta,
        ),
      );
    }
    if (data.containsKey('selected_run_id')) {
      context.handle(
        _selectedRunIdMeta,
        selectedRunId.isAcceptableOrUnknown(
          data['selected_run_id']!,
          _selectedRunIdMeta,
        ),
      );
    }
    if (data.containsKey('selected_yard_id')) {
      context.handle(
        _selectedYardIdMeta,
        selectedYardId.isAcceptableOrUnknown(
          data['selected_yard_id']!,
          _selectedYardIdMeta,
        ),
      );
    }
    if (data.containsKey('selected_receipt_id')) {
      context.handle(
        _selectedReceiptIdMeta,
        selectedReceiptId.isAcceptableOrUnknown(
          data['selected_receipt_id']!,
          _selectedReceiptIdMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssistantContextRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssistantContextRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      currentScreen: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}current_screen'],
      )!,
      selectedItemId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_item_id'],
      ),
      selectedTemplateId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_template_id'],
      ),
      selectedRunId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_run_id'],
      ),
      selectedYardId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_yard_id'],
      ),
      selectedReceiptId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}selected_receipt_id'],
      ),
    );
  }

  @override
  $AssistantContextsTable createAlias(String alias) {
    return $AssistantContextsTable(attachedDatabase, alias);
  }
}

class AssistantContextRow extends DataClass
    implements Insertable<AssistantContextRow> {
  final int id;
  final String currentScreen;
  final String? selectedItemId;
  final String? selectedTemplateId;
  final String? selectedRunId;
  final String? selectedYardId;
  final String? selectedReceiptId;
  const AssistantContextRow({
    required this.id,
    required this.currentScreen,
    this.selectedItemId,
    this.selectedTemplateId,
    this.selectedRunId,
    this.selectedYardId,
    this.selectedReceiptId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_screen'] = Variable<String>(currentScreen);
    if (!nullToAbsent || selectedItemId != null) {
      map['selected_item_id'] = Variable<String>(selectedItemId);
    }
    if (!nullToAbsent || selectedTemplateId != null) {
      map['selected_template_id'] = Variable<String>(selectedTemplateId);
    }
    if (!nullToAbsent || selectedRunId != null) {
      map['selected_run_id'] = Variable<String>(selectedRunId);
    }
    if (!nullToAbsent || selectedYardId != null) {
      map['selected_yard_id'] = Variable<String>(selectedYardId);
    }
    if (!nullToAbsent || selectedReceiptId != null) {
      map['selected_receipt_id'] = Variable<String>(selectedReceiptId);
    }
    return map;
  }

  AssistantContextsCompanion toCompanion(bool nullToAbsent) {
    return AssistantContextsCompanion(
      id: Value(id),
      currentScreen: Value(currentScreen),
      selectedItemId: selectedItemId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedItemId),
      selectedTemplateId: selectedTemplateId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedTemplateId),
      selectedRunId: selectedRunId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedRunId),
      selectedYardId: selectedYardId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedYardId),
      selectedReceiptId: selectedReceiptId == null && nullToAbsent
          ? const Value.absent()
          : Value(selectedReceiptId),
    );
  }

  factory AssistantContextRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssistantContextRow(
      id: serializer.fromJson<int>(json['id']),
      currentScreen: serializer.fromJson<String>(json['currentScreen']),
      selectedItemId: serializer.fromJson<String?>(json['selectedItemId']),
      selectedTemplateId: serializer.fromJson<String?>(
        json['selectedTemplateId'],
      ),
      selectedRunId: serializer.fromJson<String?>(json['selectedRunId']),
      selectedYardId: serializer.fromJson<String?>(json['selectedYardId']),
      selectedReceiptId: serializer.fromJson<String?>(
        json['selectedReceiptId'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentScreen': serializer.toJson<String>(currentScreen),
      'selectedItemId': serializer.toJson<String?>(selectedItemId),
      'selectedTemplateId': serializer.toJson<String?>(selectedTemplateId),
      'selectedRunId': serializer.toJson<String?>(selectedRunId),
      'selectedYardId': serializer.toJson<String?>(selectedYardId),
      'selectedReceiptId': serializer.toJson<String?>(selectedReceiptId),
    };
  }

  AssistantContextRow copyWith({
    int? id,
    String? currentScreen,
    Value<String?> selectedItemId = const Value.absent(),
    Value<String?> selectedTemplateId = const Value.absent(),
    Value<String?> selectedRunId = const Value.absent(),
    Value<String?> selectedYardId = const Value.absent(),
    Value<String?> selectedReceiptId = const Value.absent(),
  }) => AssistantContextRow(
    id: id ?? this.id,
    currentScreen: currentScreen ?? this.currentScreen,
    selectedItemId: selectedItemId.present
        ? selectedItemId.value
        : this.selectedItemId,
    selectedTemplateId: selectedTemplateId.present
        ? selectedTemplateId.value
        : this.selectedTemplateId,
    selectedRunId: selectedRunId.present
        ? selectedRunId.value
        : this.selectedRunId,
    selectedYardId: selectedYardId.present
        ? selectedYardId.value
        : this.selectedYardId,
    selectedReceiptId: selectedReceiptId.present
        ? selectedReceiptId.value
        : this.selectedReceiptId,
  );
  AssistantContextRow copyWithCompanion(AssistantContextsCompanion data) {
    return AssistantContextRow(
      id: data.id.present ? data.id.value : this.id,
      currentScreen: data.currentScreen.present
          ? data.currentScreen.value
          : this.currentScreen,
      selectedItemId: data.selectedItemId.present
          ? data.selectedItemId.value
          : this.selectedItemId,
      selectedTemplateId: data.selectedTemplateId.present
          ? data.selectedTemplateId.value
          : this.selectedTemplateId,
      selectedRunId: data.selectedRunId.present
          ? data.selectedRunId.value
          : this.selectedRunId,
      selectedYardId: data.selectedYardId.present
          ? data.selectedYardId.value
          : this.selectedYardId,
      selectedReceiptId: data.selectedReceiptId.present
          ? data.selectedReceiptId.value
          : this.selectedReceiptId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssistantContextRow(')
          ..write('id: $id, ')
          ..write('currentScreen: $currentScreen, ')
          ..write('selectedItemId: $selectedItemId, ')
          ..write('selectedTemplateId: $selectedTemplateId, ')
          ..write('selectedRunId: $selectedRunId, ')
          ..write('selectedYardId: $selectedYardId, ')
          ..write('selectedReceiptId: $selectedReceiptId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    currentScreen,
    selectedItemId,
    selectedTemplateId,
    selectedRunId,
    selectedYardId,
    selectedReceiptId,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssistantContextRow &&
          other.id == this.id &&
          other.currentScreen == this.currentScreen &&
          other.selectedItemId == this.selectedItemId &&
          other.selectedTemplateId == this.selectedTemplateId &&
          other.selectedRunId == this.selectedRunId &&
          other.selectedYardId == this.selectedYardId &&
          other.selectedReceiptId == this.selectedReceiptId);
}

class AssistantContextsCompanion extends UpdateCompanion<AssistantContextRow> {
  final Value<int> id;
  final Value<String> currentScreen;
  final Value<String?> selectedItemId;
  final Value<String?> selectedTemplateId;
  final Value<String?> selectedRunId;
  final Value<String?> selectedYardId;
  final Value<String?> selectedReceiptId;
  const AssistantContextsCompanion({
    this.id = const Value.absent(),
    this.currentScreen = const Value.absent(),
    this.selectedItemId = const Value.absent(),
    this.selectedTemplateId = const Value.absent(),
    this.selectedRunId = const Value.absent(),
    this.selectedYardId = const Value.absent(),
    this.selectedReceiptId = const Value.absent(),
  });
  AssistantContextsCompanion.insert({
    this.id = const Value.absent(),
    required String currentScreen,
    this.selectedItemId = const Value.absent(),
    this.selectedTemplateId = const Value.absent(),
    this.selectedRunId = const Value.absent(),
    this.selectedYardId = const Value.absent(),
    this.selectedReceiptId = const Value.absent(),
  }) : currentScreen = Value(currentScreen);
  static Insertable<AssistantContextRow> custom({
    Expression<int>? id,
    Expression<String>? currentScreen,
    Expression<String>? selectedItemId,
    Expression<String>? selectedTemplateId,
    Expression<String>? selectedRunId,
    Expression<String>? selectedYardId,
    Expression<String>? selectedReceiptId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentScreen != null) 'current_screen': currentScreen,
      if (selectedItemId != null) 'selected_item_id': selectedItemId,
      if (selectedTemplateId != null)
        'selected_template_id': selectedTemplateId,
      if (selectedRunId != null) 'selected_run_id': selectedRunId,
      if (selectedYardId != null) 'selected_yard_id': selectedYardId,
      if (selectedReceiptId != null) 'selected_receipt_id': selectedReceiptId,
    });
  }

  AssistantContextsCompanion copyWith({
    Value<int>? id,
    Value<String>? currentScreen,
    Value<String?>? selectedItemId,
    Value<String?>? selectedTemplateId,
    Value<String?>? selectedRunId,
    Value<String?>? selectedYardId,
    Value<String?>? selectedReceiptId,
  }) {
    return AssistantContextsCompanion(
      id: id ?? this.id,
      currentScreen: currentScreen ?? this.currentScreen,
      selectedItemId: selectedItemId ?? this.selectedItemId,
      selectedTemplateId: selectedTemplateId ?? this.selectedTemplateId,
      selectedRunId: selectedRunId ?? this.selectedRunId,
      selectedYardId: selectedYardId ?? this.selectedYardId,
      selectedReceiptId: selectedReceiptId ?? this.selectedReceiptId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentScreen.present) {
      map['current_screen'] = Variable<String>(currentScreen.value);
    }
    if (selectedItemId.present) {
      map['selected_item_id'] = Variable<String>(selectedItemId.value);
    }
    if (selectedTemplateId.present) {
      map['selected_template_id'] = Variable<String>(selectedTemplateId.value);
    }
    if (selectedRunId.present) {
      map['selected_run_id'] = Variable<String>(selectedRunId.value);
    }
    if (selectedYardId.present) {
      map['selected_yard_id'] = Variable<String>(selectedYardId.value);
    }
    if (selectedReceiptId.present) {
      map['selected_receipt_id'] = Variable<String>(selectedReceiptId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssistantContextsCompanion(')
          ..write('id: $id, ')
          ..write('currentScreen: $currentScreen, ')
          ..write('selectedItemId: $selectedItemId, ')
          ..write('selectedTemplateId: $selectedTemplateId, ')
          ..write('selectedRunId: $selectedRunId, ')
          ..write('selectedYardId: $selectedYardId, ')
          ..write('selectedReceiptId: $selectedReceiptId')
          ..write(')'))
        .toString();
  }
}

class $AssistantMessagesTable extends AssistantMessages
    with TableInfo<$AssistantMessagesTable, AssistantMessageRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssistantMessagesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _contextIdMeta = const VerificationMeta(
    'contextId',
  );
  @override
  late final GeneratedColumn<int> contextId = GeneratedColumn<int>(
    'context_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES assistant_contexts (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _messageMeta = const VerificationMeta(
    'message',
  );
  @override
  late final GeneratedColumn<String> message = GeneratedColumn<String>(
    'message',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    contextId,
    role,
    message,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assistant_messages';
  @override
  VerificationContext validateIntegrity(
    Insertable<AssistantMessageRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('context_id')) {
      context.handle(
        _contextIdMeta,
        contextId.isAcceptableOrUnknown(data['context_id']!, _contextIdMeta),
      );
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('message')) {
      context.handle(
        _messageMeta,
        message.isAcceptableOrUnknown(data['message']!, _messageMeta),
      );
    } else if (isInserting) {
      context.missing(_messageMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssistantMessageRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssistantMessageRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      contextId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}context_id'],
      ),
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      message: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}message'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $AssistantMessagesTable createAlias(String alias) {
    return $AssistantMessagesTable(attachedDatabase, alias);
  }
}

class AssistantMessageRow extends DataClass
    implements Insertable<AssistantMessageRow> {
  final int id;
  final int? contextId;
  final String role;
  final String message;
  final DateTime createdAt;
  const AssistantMessageRow({
    required this.id,
    this.contextId,
    required this.role,
    required this.message,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || contextId != null) {
      map['context_id'] = Variable<int>(contextId);
    }
    map['role'] = Variable<String>(role);
    map['message'] = Variable<String>(message);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AssistantMessagesCompanion toCompanion(bool nullToAbsent) {
    return AssistantMessagesCompanion(
      id: Value(id),
      contextId: contextId == null && nullToAbsent
          ? const Value.absent()
          : Value(contextId),
      role: Value(role),
      message: Value(message),
      createdAt: Value(createdAt),
    );
  }

  factory AssistantMessageRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssistantMessageRow(
      id: serializer.fromJson<int>(json['id']),
      contextId: serializer.fromJson<int?>(json['contextId']),
      role: serializer.fromJson<String>(json['role']),
      message: serializer.fromJson<String>(json['message']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'contextId': serializer.toJson<int?>(contextId),
      'role': serializer.toJson<String>(role),
      'message': serializer.toJson<String>(message),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AssistantMessageRow copyWith({
    int? id,
    Value<int?> contextId = const Value.absent(),
    String? role,
    String? message,
    DateTime? createdAt,
  }) => AssistantMessageRow(
    id: id ?? this.id,
    contextId: contextId.present ? contextId.value : this.contextId,
    role: role ?? this.role,
    message: message ?? this.message,
    createdAt: createdAt ?? this.createdAt,
  );
  AssistantMessageRow copyWithCompanion(AssistantMessagesCompanion data) {
    return AssistantMessageRow(
      id: data.id.present ? data.id.value : this.id,
      contextId: data.contextId.present ? data.contextId.value : this.contextId,
      role: data.role.present ? data.role.value : this.role,
      message: data.message.present ? data.message.value : this.message,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssistantMessageRow(')
          ..write('id: $id, ')
          ..write('contextId: $contextId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, contextId, role, message, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssistantMessageRow &&
          other.id == this.id &&
          other.contextId == this.contextId &&
          other.role == this.role &&
          other.message == this.message &&
          other.createdAt == this.createdAt);
}

class AssistantMessagesCompanion extends UpdateCompanion<AssistantMessageRow> {
  final Value<int> id;
  final Value<int?> contextId;
  final Value<String> role;
  final Value<String> message;
  final Value<DateTime> createdAt;
  const AssistantMessagesCompanion({
    this.id = const Value.absent(),
    this.contextId = const Value.absent(),
    this.role = const Value.absent(),
    this.message = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  AssistantMessagesCompanion.insert({
    this.id = const Value.absent(),
    this.contextId = const Value.absent(),
    required String role,
    required String message,
    required DateTime createdAt,
  }) : role = Value(role),
       message = Value(message),
       createdAt = Value(createdAt);
  static Insertable<AssistantMessageRow> custom({
    Expression<int>? id,
    Expression<int>? contextId,
    Expression<String>? role,
    Expression<String>? message,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (contextId != null) 'context_id': contextId,
      if (role != null) 'role': role,
      if (message != null) 'message': message,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  AssistantMessagesCompanion copyWith({
    Value<int>? id,
    Value<int?>? contextId,
    Value<String>? role,
    Value<String>? message,
    Value<DateTime>? createdAt,
  }) {
    return AssistantMessagesCompanion(
      id: id ?? this.id,
      contextId: contextId ?? this.contextId,
      role: role ?? this.role,
      message: message ?? this.message,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (contextId.present) {
      map['context_id'] = Variable<int>(contextId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (message.present) {
      map['message'] = Variable<String>(message.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssistantMessagesCompanion(')
          ..write('id: $id, ')
          ..write('contextId: $contextId, ')
          ..write('role: $role, ')
          ..write('message: $message, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HomeBaseSettingsTableTable extends HomeBaseSettingsTable
    with TableInfo<$HomeBaseSettingsTableTable, HomeBaseSettingsRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HomeBaseSettingsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
    'label',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cityStateZipMeta = const VerificationMeta(
    'cityStateZip',
  );
  @override
  late final GeneratedColumn<String> cityStateZip = GeneratedColumn<String>(
    'city_state_zip',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _defaultFuelPriceMeta = const VerificationMeta(
    'defaultFuelPrice',
  );
  @override
  late final GeneratedColumn<double> defaultFuelPrice = GeneratedColumn<double>(
    'default_fuel_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    label,
    address,
    cityStateZip,
    defaultFuelPrice,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'home_base_settings_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<HomeBaseSettingsRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
        _labelMeta,
        label.isAcceptableOrUnknown(data['label']!, _labelMeta),
      );
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    } else if (isInserting) {
      context.missing(_addressMeta);
    }
    if (data.containsKey('city_state_zip')) {
      context.handle(
        _cityStateZipMeta,
        cityStateZip.isAcceptableOrUnknown(
          data['city_state_zip']!,
          _cityStateZipMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_cityStateZipMeta);
    }
    if (data.containsKey('default_fuel_price')) {
      context.handle(
        _defaultFuelPriceMeta,
        defaultFuelPrice.isAcceptableOrUnknown(
          data['default_fuel_price']!,
          _defaultFuelPriceMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_defaultFuelPriceMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    } else if (isInserting) {
      context.missing(_notesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HomeBaseSettingsRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HomeBaseSettingsRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      label: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}label'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      cityStateZip: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}city_state_zip'],
      )!,
      defaultFuelPrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}default_fuel_price'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $HomeBaseSettingsTableTable createAlias(String alias) {
    return $HomeBaseSettingsTableTable(attachedDatabase, alias);
  }
}

class HomeBaseSettingsRow extends DataClass
    implements Insertable<HomeBaseSettingsRow> {
  final String id;
  final String label;
  final String address;
  final String cityStateZip;
  final double defaultFuelPrice;
  final String notes;
  const HomeBaseSettingsRow({
    required this.id,
    required this.label,
    required this.address,
    required this.cityStateZip,
    required this.defaultFuelPrice,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['label'] = Variable<String>(label);
    map['address'] = Variable<String>(address);
    map['city_state_zip'] = Variable<String>(cityStateZip);
    map['default_fuel_price'] = Variable<double>(defaultFuelPrice);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  HomeBaseSettingsTableCompanion toCompanion(bool nullToAbsent) {
    return HomeBaseSettingsTableCompanion(
      id: Value(id),
      label: Value(label),
      address: Value(address),
      cityStateZip: Value(cityStateZip),
      defaultFuelPrice: Value(defaultFuelPrice),
      notes: Value(notes),
    );
  }

  factory HomeBaseSettingsRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return HomeBaseSettingsRow(
      id: serializer.fromJson<String>(json['id']),
      label: serializer.fromJson<String>(json['label']),
      address: serializer.fromJson<String>(json['address']),
      cityStateZip: serializer.fromJson<String>(json['cityStateZip']),
      defaultFuelPrice: serializer.fromJson<double>(json['defaultFuelPrice']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'label': serializer.toJson<String>(label),
      'address': serializer.toJson<String>(address),
      'cityStateZip': serializer.toJson<String>(cityStateZip),
      'defaultFuelPrice': serializer.toJson<double>(defaultFuelPrice),
      'notes': serializer.toJson<String>(notes),
    };
  }

  HomeBaseSettingsRow copyWith({
    String? id,
    String? label,
    String? address,
    String? cityStateZip,
    double? defaultFuelPrice,
    String? notes,
  }) => HomeBaseSettingsRow(
    id: id ?? this.id,
    label: label ?? this.label,
    address: address ?? this.address,
    cityStateZip: cityStateZip ?? this.cityStateZip,
    defaultFuelPrice: defaultFuelPrice ?? this.defaultFuelPrice,
    notes: notes ?? this.notes,
  );
  HomeBaseSettingsRow copyWithCompanion(HomeBaseSettingsTableCompanion data) {
    return HomeBaseSettingsRow(
      id: data.id.present ? data.id.value : this.id,
      label: data.label.present ? data.label.value : this.label,
      address: data.address.present ? data.address.value : this.address,
      cityStateZip: data.cityStateZip.present
          ? data.cityStateZip.value
          : this.cityStateZip,
      defaultFuelPrice: data.defaultFuelPrice.present
          ? data.defaultFuelPrice.value
          : this.defaultFuelPrice,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('HomeBaseSettingsRow(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('address: $address, ')
          ..write('cityStateZip: $cityStateZip, ')
          ..write('defaultFuelPrice: $defaultFuelPrice, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, label, address, cityStateZip, defaultFuelPrice, notes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is HomeBaseSettingsRow &&
          other.id == this.id &&
          other.label == this.label &&
          other.address == this.address &&
          other.cityStateZip == this.cityStateZip &&
          other.defaultFuelPrice == this.defaultFuelPrice &&
          other.notes == this.notes);
}

class HomeBaseSettingsTableCompanion
    extends UpdateCompanion<HomeBaseSettingsRow> {
  final Value<String> id;
  final Value<String> label;
  final Value<String> address;
  final Value<String> cityStateZip;
  final Value<double> defaultFuelPrice;
  final Value<String> notes;
  final Value<int> rowid;
  const HomeBaseSettingsTableCompanion({
    this.id = const Value.absent(),
    this.label = const Value.absent(),
    this.address = const Value.absent(),
    this.cityStateZip = const Value.absent(),
    this.defaultFuelPrice = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  HomeBaseSettingsTableCompanion.insert({
    required String id,
    required String label,
    required String address,
    required String cityStateZip,
    required double defaultFuelPrice,
    required String notes,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       label = Value(label),
       address = Value(address),
       cityStateZip = Value(cityStateZip),
       defaultFuelPrice = Value(defaultFuelPrice),
       notes = Value(notes);
  static Insertable<HomeBaseSettingsRow> custom({
    Expression<String>? id,
    Expression<String>? label,
    Expression<String>? address,
    Expression<String>? cityStateZip,
    Expression<double>? defaultFuelPrice,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (label != null) 'label': label,
      if (address != null) 'address': address,
      if (cityStateZip != null) 'city_state_zip': cityStateZip,
      if (defaultFuelPrice != null) 'default_fuel_price': defaultFuelPrice,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  HomeBaseSettingsTableCompanion copyWith({
    Value<String>? id,
    Value<String>? label,
    Value<String>? address,
    Value<String>? cityStateZip,
    Value<double>? defaultFuelPrice,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return HomeBaseSettingsTableCompanion(
      id: id ?? this.id,
      label: label ?? this.label,
      address: address ?? this.address,
      cityStateZip: cityStateZip ?? this.cityStateZip,
      defaultFuelPrice: defaultFuelPrice ?? this.defaultFuelPrice,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (cityStateZip.present) {
      map['city_state_zip'] = Variable<String>(cityStateZip.value);
    }
    if (defaultFuelPrice.present) {
      map['default_fuel_price'] = Variable<double>(defaultFuelPrice.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HomeBaseSettingsTableCompanion(')
          ..write('id: $id, ')
          ..write('label: $label, ')
          ..write('address: $address, ')
          ..write('cityStateZip: $cityStateZip, ')
          ..write('defaultFuelPrice: $defaultFuelPrice, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $YardsTable yards = $YardsTable(this);
  late final $YardPricesTable yardPrices = $YardPricesTable(this);
  late final $SearchSourcesTable searchSources = $SearchSourcesTable(this);
  late final $SearchRulesTable searchRules = $SearchRulesTable(this);
  late final $SearchRuleSourcesTable searchRuleSources =
      $SearchRuleSourcesTable(this);
  late final $NotificationSettingsTableTable notificationSettingsTable =
      $NotificationSettingsTableTable(this);
  late final $ObjectTemplatesTable objectTemplates = $ObjectTemplatesTable(
    this,
  );
  late final $ScrapItemsTable scrapItems = $ScrapItemsTable(this);
  late final $RunPlansTable runPlans = $RunPlansTable(this);
  late final $RunPlanItemsTable runPlanItems = $RunPlanItemsTable(this);
  late final $ReceiptsTable receipts = $ReceiptsTable(this);
  late final $PhotoAttachmentsTable photoAttachments = $PhotoAttachmentsTable(
    this,
  );
  late final $AssistantContextsTable assistantContexts =
      $AssistantContextsTable(this);
  late final $AssistantMessagesTable assistantMessages =
      $AssistantMessagesTable(this);
  late final $HomeBaseSettingsTableTable homeBaseSettingsTable =
      $HomeBaseSettingsTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehicles,
    yards,
    yardPrices,
    searchSources,
    searchRules,
    searchRuleSources,
    notificationSettingsTable,
    objectTemplates,
    scrapItems,
    runPlans,
    runPlanItems,
    receipts,
    photoAttachments,
    assistantContexts,
    assistantMessages,
    homeBaseSettingsTable,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'assistant_contexts',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('assistant_messages', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$VehiclesTableCreateCompanionBuilder =
    VehiclesCompanion Function({
      required String id,
      required String name,
      required String type,
      required double mpg,
      required double cargoLength,
      required double cargoWidth,
      required double cargoHeight,
      required double payloadLimit,
      required int fullCargo,
      required int largeUpright,
      required int medium,
      required String notes,
      Value<int> rowid,
    });
typedef $$VehiclesTableUpdateCompanionBuilder =
    VehiclesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<double> mpg,
      Value<double> cargoLength,
      Value<double> cargoWidth,
      Value<double> cargoHeight,
      Value<double> payloadLimit,
      Value<int> fullCargo,
      Value<int> largeUpright,
      Value<int> medium,
      Value<String> notes,
      Value<int> rowid,
    });

final class $$VehiclesTableReferences
    extends BaseReferences<_$AppDatabase, $VehiclesTable, VehicleRow> {
  $$VehiclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RunPlansTable, List<RunPlanRow>>
  _runPlansRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.runPlans,
    aliasName: 'vehicles__id__run_plans__vehicle_id',
  );

  $$RunPlansTableProcessedTableManager get runPlansRefs {
    final manager = $$RunPlansTableTableManager(
      $_db,
      $_db.runPlans,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_runPlansRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehiclesTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get mpg => $composableBuilder(
    column: $table.mpg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cargoLength => $composableBuilder(
    column: $table.cargoLength,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cargoWidth => $composableBuilder(
    column: $table.cargoWidth,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cargoHeight => $composableBuilder(
    column: $table.cargoHeight,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get payloadLimit => $composableBuilder(
    column: $table.payloadLimit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fullCargo => $composableBuilder(
    column: $table.fullCargo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get largeUpright => $composableBuilder(
    column: $table.largeUpright,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get medium => $composableBuilder(
    column: $table.medium,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> runPlansRefs(
    Expression<bool> Function($$RunPlansTableFilterComposer f) f,
  ) {
    final $$RunPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlans,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlansTableFilterComposer(
            $db: $db,
            $table: $db.runPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get mpg => $composableBuilder(
    column: $table.mpg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cargoLength => $composableBuilder(
    column: $table.cargoLength,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cargoWidth => $composableBuilder(
    column: $table.cargoWidth,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cargoHeight => $composableBuilder(
    column: $table.cargoHeight,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get payloadLimit => $composableBuilder(
    column: $table.payloadLimit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fullCargo => $composableBuilder(
    column: $table.fullCargo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get largeUpright => $composableBuilder(
    column: $table.largeUpright,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get medium => $composableBuilder(
    column: $table.medium,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<double> get mpg =>
      $composableBuilder(column: $table.mpg, builder: (column) => column);

  GeneratedColumn<double> get cargoLength => $composableBuilder(
    column: $table.cargoLength,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cargoWidth => $composableBuilder(
    column: $table.cargoWidth,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cargoHeight => $composableBuilder(
    column: $table.cargoHeight,
    builder: (column) => column,
  );

  GeneratedColumn<double> get payloadLimit => $composableBuilder(
    column: $table.payloadLimit,
    builder: (column) => column,
  );

  GeneratedColumn<int> get fullCargo =>
      $composableBuilder(column: $table.fullCargo, builder: (column) => column);

  GeneratedColumn<int> get largeUpright => $composableBuilder(
    column: $table.largeUpright,
    builder: (column) => column,
  );

  GeneratedColumn<int> get medium =>
      $composableBuilder(column: $table.medium, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> runPlansRefs<T extends Object>(
    Expression<T> Function($$RunPlansTableAnnotationComposer a) f,
  ) {
    final $$RunPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlans,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.runPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehiclesTable,
          VehicleRow,
          $$VehiclesTableFilterComposer,
          $$VehiclesTableOrderingComposer,
          $$VehiclesTableAnnotationComposer,
          $$VehiclesTableCreateCompanionBuilder,
          $$VehiclesTableUpdateCompanionBuilder,
          (VehicleRow, $$VehiclesTableReferences),
          VehicleRow,
          PrefetchHooks Function({bool runPlansRefs})
        > {
  $$VehiclesTableTableManager(_$AppDatabase db, $VehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<double> mpg = const Value.absent(),
                Value<double> cargoLength = const Value.absent(),
                Value<double> cargoWidth = const Value.absent(),
                Value<double> cargoHeight = const Value.absent(),
                Value<double> payloadLimit = const Value.absent(),
                Value<int> fullCargo = const Value.absent(),
                Value<int> largeUpright = const Value.absent(),
                Value<int> medium = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VehiclesCompanion(
                id: id,
                name: name,
                type: type,
                mpg: mpg,
                cargoLength: cargoLength,
                cargoWidth: cargoWidth,
                cargoHeight: cargoHeight,
                payloadLimit: payloadLimit,
                fullCargo: fullCargo,
                largeUpright: largeUpright,
                medium: medium,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String type,
                required double mpg,
                required double cargoLength,
                required double cargoWidth,
                required double cargoHeight,
                required double payloadLimit,
                required int fullCargo,
                required int largeUpright,
                required int medium,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => VehiclesCompanion.insert(
                id: id,
                name: name,
                type: type,
                mpg: mpg,
                cargoLength: cargoLength,
                cargoWidth: cargoWidth,
                cargoHeight: cargoHeight,
                payloadLimit: payloadLimit,
                fullCargo: fullCargo,
                largeUpright: largeUpright,
                medium: medium,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehiclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({runPlansRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (runPlansRefs) db.runPlans],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (runPlansRefs)
                    await $_getPrefetchedData<
                      VehicleRow,
                      $VehiclesTable,
                      RunPlanRow
                    >(
                      currentTable: table,
                      referencedTable: $$VehiclesTableReferences
                          ._runPlansRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$VehiclesTableReferences(db, table, p0).runPlansRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.vehicleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$VehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehiclesTable,
      VehicleRow,
      $$VehiclesTableFilterComposer,
      $$VehiclesTableOrderingComposer,
      $$VehiclesTableAnnotationComposer,
      $$VehiclesTableCreateCompanionBuilder,
      $$VehiclesTableUpdateCompanionBuilder,
      (VehicleRow, $$VehiclesTableReferences),
      VehicleRow,
      PrefetchHooks Function({bool runPlansRefs})
    >;
typedef $$YardsTableCreateCompanionBuilder =
    YardsCompanion Function({
      required String id,
      required String name,
      required String address,
      required String cityStateZip,
      required String phone,
      required String hours,
      required String notes,
      required bool preferred,
      Value<int> rowid,
    });
typedef $$YardsTableUpdateCompanionBuilder =
    YardsCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> address,
      Value<String> cityStateZip,
      Value<String> phone,
      Value<String> hours,
      Value<String> notes,
      Value<bool> preferred,
      Value<int> rowid,
    });

final class $$YardsTableReferences
    extends BaseReferences<_$AppDatabase, $YardsTable, YardRow> {
  $$YardsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$YardPricesTable, List<YardPriceRow>>
  _yardPricesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.yardPrices,
    aliasName: 'yards__id__yard_prices__yard_id',
  );

  $$YardPricesTableProcessedTableManager get yardPricesRefs {
    final manager = $$YardPricesTableTableManager(
      $_db,
      $_db.yardPrices,
    ).filter((f) => f.yardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_yardPricesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ReceiptsTable, List<ReceiptRow>>
  _receiptsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.receipts,
    aliasName: 'yards__id__receipts__yard_id',
  );

  $$ReceiptsTableProcessedTableManager get receiptsRefs {
    final manager = $$ReceiptsTableTableManager(
      $_db,
      $_db.receipts,
    ).filter((f) => f.yardId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_receiptsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$YardsTableFilterComposer extends Composer<_$AppDatabase, $YardsTable> {
  $$YardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hours => $composableBuilder(
    column: $table.hours,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get preferred => $composableBuilder(
    column: $table.preferred,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> yardPricesRefs(
    Expression<bool> Function($$YardPricesTableFilterComposer f) f,
  ) {
    final $$YardPricesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.yardPrices,
      getReferencedColumn: (t) => t.yardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardPricesTableFilterComposer(
            $db: $db,
            $table: $db.yardPrices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> receiptsRefs(
    Expression<bool> Function($$ReceiptsTableFilterComposer f) f,
  ) {
    final $$ReceiptsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.yardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableFilterComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$YardsTableOrderingComposer
    extends Composer<_$AppDatabase, $YardsTable> {
  $$YardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get phone => $composableBuilder(
    column: $table.phone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hours => $composableBuilder(
    column: $table.hours,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get preferred => $composableBuilder(
    column: $table.preferred,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$YardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $YardsTable> {
  $$YardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => column,
  );

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get hours =>
      $composableBuilder(column: $table.hours, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get preferred =>
      $composableBuilder(column: $table.preferred, builder: (column) => column);

  Expression<T> yardPricesRefs<T extends Object>(
    Expression<T> Function($$YardPricesTableAnnotationComposer a) f,
  ) {
    final $$YardPricesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.yardPrices,
      getReferencedColumn: (t) => t.yardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardPricesTableAnnotationComposer(
            $db: $db,
            $table: $db.yardPrices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> receiptsRefs<T extends Object>(
    Expression<T> Function($$ReceiptsTableAnnotationComposer a) f,
  ) {
    final $$ReceiptsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.receipts,
      getReferencedColumn: (t) => t.yardId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ReceiptsTableAnnotationComposer(
            $db: $db,
            $table: $db.receipts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$YardsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $YardsTable,
          YardRow,
          $$YardsTableFilterComposer,
          $$YardsTableOrderingComposer,
          $$YardsTableAnnotationComposer,
          $$YardsTableCreateCompanionBuilder,
          $$YardsTableUpdateCompanionBuilder,
          (YardRow, $$YardsTableReferences),
          YardRow,
          PrefetchHooks Function({bool yardPricesRefs, bool receiptsRefs})
        > {
  $$YardsTableTableManager(_$AppDatabase db, $YardsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$YardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$YardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$YardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> cityStateZip = const Value.absent(),
                Value<String> phone = const Value.absent(),
                Value<String> hours = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> preferred = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => YardsCompanion(
                id: id,
                name: name,
                address: address,
                cityStateZip: cityStateZip,
                phone: phone,
                hours: hours,
                notes: notes,
                preferred: preferred,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String address,
                required String cityStateZip,
                required String phone,
                required String hours,
                required String notes,
                required bool preferred,
                Value<int> rowid = const Value.absent(),
              }) => YardsCompanion.insert(
                id: id,
                name: name,
                address: address,
                cityStateZip: cityStateZip,
                phone: phone,
                hours: hours,
                notes: notes,
                preferred: preferred,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$YardsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({yardPricesRefs = false, receiptsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (yardPricesRefs) db.yardPrices,
                    if (receiptsRefs) db.receipts,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (yardPricesRefs)
                        await $_getPrefetchedData<
                          YardRow,
                          $YardsTable,
                          YardPriceRow
                        >(
                          currentTable: table,
                          referencedTable: $$YardsTableReferences
                              ._yardPricesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$YardsTableReferences(
                                db,
                                table,
                                p0,
                              ).yardPricesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.yardId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (receiptsRefs)
                        await $_getPrefetchedData<
                          YardRow,
                          $YardsTable,
                          ReceiptRow
                        >(
                          currentTable: table,
                          referencedTable: $$YardsTableReferences
                              ._receiptsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$YardsTableReferences(
                                db,
                                table,
                                p0,
                              ).receiptsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.yardId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$YardsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $YardsTable,
      YardRow,
      $$YardsTableFilterComposer,
      $$YardsTableOrderingComposer,
      $$YardsTableAnnotationComposer,
      $$YardsTableCreateCompanionBuilder,
      $$YardsTableUpdateCompanionBuilder,
      (YardRow, $$YardsTableReferences),
      YardRow,
      PrefetchHooks Function({bool yardPricesRefs, bool receiptsRefs})
    >;
typedef $$YardPricesTableCreateCompanionBuilder =
    YardPricesCompanion Function({
      required String id,
      required String yardId,
      required String material,
      required double price,
      required String unit,
      required DateTime updatedAt,
      required String notes,
      Value<int> rowid,
    });
typedef $$YardPricesTableUpdateCompanionBuilder =
    YardPricesCompanion Function({
      Value<String> id,
      Value<String> yardId,
      Value<String> material,
      Value<double> price,
      Value<String> unit,
      Value<DateTime> updatedAt,
      Value<String> notes,
      Value<int> rowid,
    });

final class $$YardPricesTableReferences
    extends BaseReferences<_$AppDatabase, $YardPricesTable, YardPriceRow> {
  $$YardPricesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $YardsTable _yardIdTable(_$AppDatabase db) =>
      db.yards.createAlias('yard_prices__yard_id__yards__id');

  $$YardsTableProcessedTableManager get yardId {
    final $_column = $_itemColumn<String>('yard_id')!;

    final manager = $$YardsTableTableManager(
      $_db,
      $_db.yards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_yardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$YardPricesTableFilterComposer
    extends Composer<_$AppDatabase, $YardPricesTable> {
  $$YardPricesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$YardsTableFilterComposer get yardId {
    final $$YardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableFilterComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$YardPricesTableOrderingComposer
    extends Composer<_$AppDatabase, $YardPricesTable> {
  $$YardPricesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get material => $composableBuilder(
    column: $table.material,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get price => $composableBuilder(
    column: $table.price,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$YardsTableOrderingComposer get yardId {
    final $$YardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableOrderingComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$YardPricesTableAnnotationComposer
    extends Composer<_$AppDatabase, $YardPricesTable> {
  $$YardPricesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get material =>
      $composableBuilder(column: $table.material, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$YardsTableAnnotationComposer get yardId {
    final $$YardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableAnnotationComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$YardPricesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $YardPricesTable,
          YardPriceRow,
          $$YardPricesTableFilterComposer,
          $$YardPricesTableOrderingComposer,
          $$YardPricesTableAnnotationComposer,
          $$YardPricesTableCreateCompanionBuilder,
          $$YardPricesTableUpdateCompanionBuilder,
          (YardPriceRow, $$YardPricesTableReferences),
          YardPriceRow,
          PrefetchHooks Function({bool yardId})
        > {
  $$YardPricesTableTableManager(_$AppDatabase db, $YardPricesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$YardPricesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$YardPricesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$YardPricesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> yardId = const Value.absent(),
                Value<String> material = const Value.absent(),
                Value<double> price = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => YardPricesCompanion(
                id: id,
                yardId: yardId,
                material: material,
                price: price,
                unit: unit,
                updatedAt: updatedAt,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String yardId,
                required String material,
                required double price,
                required String unit,
                required DateTime updatedAt,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => YardPricesCompanion.insert(
                id: id,
                yardId: yardId,
                material: material,
                price: price,
                unit: unit,
                updatedAt: updatedAt,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$YardPricesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({yardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (yardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.yardId,
                                referencedTable: $$YardPricesTableReferences
                                    ._yardIdTable(db),
                                referencedColumn: $$YardPricesTableReferences
                                    ._yardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$YardPricesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $YardPricesTable,
      YardPriceRow,
      $$YardPricesTableFilterComposer,
      $$YardPricesTableOrderingComposer,
      $$YardPricesTableAnnotationComposer,
      $$YardPricesTableCreateCompanionBuilder,
      $$YardPricesTableUpdateCompanionBuilder,
      (YardPriceRow, $$YardPricesTableReferences),
      YardPriceRow,
      PrefetchHooks Function({bool yardId})
    >;
typedef $$SearchSourcesTableCreateCompanionBuilder =
    SearchSourcesCompanion Function({
      required String id,
      required String name,
      required String type,
      required bool enabled,
      required double defaultRadius,
      required bool supportsDirectLink,
      required bool supportsManualEntry,
      required bool supportsNotifications,
      required String notes,
      Value<int> rowid,
    });
typedef $$SearchSourcesTableUpdateCompanionBuilder =
    SearchSourcesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> type,
      Value<bool> enabled,
      Value<double> defaultRadius,
      Value<bool> supportsDirectLink,
      Value<bool> supportsManualEntry,
      Value<bool> supportsNotifications,
      Value<String> notes,
      Value<int> rowid,
    });

final class $$SearchSourcesTableReferences
    extends
        BaseReferences<_$AppDatabase, $SearchSourcesTable, SearchSourceRow> {
  $$SearchSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$SearchRuleSourcesTable, List<SearchRuleSourceRow>>
  _searchRuleSourcesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.searchRuleSources,
        aliasName: 'search_sources__id__search_rule_sources__source_id',
      );

  $$SearchRuleSourcesTableProcessedTableManager get searchRuleSourcesRefs {
    final manager = $$SearchRuleSourcesTableTableManager(
      $_db,
      $_db.searchRuleSources,
    ).filter((f) => f.sourceId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _searchRuleSourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SearchSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchSourcesTable> {
  $$SearchSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get defaultRadius => $composableBuilder(
    column: $table.defaultRadius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsDirectLink => $composableBuilder(
    column: $table.supportsDirectLink,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsManualEntry => $composableBuilder(
    column: $table.supportsManualEntry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get supportsNotifications => $composableBuilder(
    column: $table.supportsNotifications,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> searchRuleSourcesRefs(
    Expression<bool> Function($$SearchRuleSourcesTableFilterComposer f) f,
  ) {
    final $$SearchRuleSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchRuleSources,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchRuleSourcesTableFilterComposer(
            $db: $db,
            $table: $db.searchRuleSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SearchSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchSourcesTable> {
  $$SearchSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get defaultRadius => $composableBuilder(
    column: $table.defaultRadius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsDirectLink => $composableBuilder(
    column: $table.supportsDirectLink,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsManualEntry => $composableBuilder(
    column: $table.supportsManualEntry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get supportsNotifications => $composableBuilder(
    column: $table.supportsNotifications,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchSourcesTable> {
  $$SearchSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  GeneratedColumn<double> get defaultRadius => $composableBuilder(
    column: $table.defaultRadius,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsDirectLink => $composableBuilder(
    column: $table.supportsDirectLink,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsManualEntry => $composableBuilder(
    column: $table.supportsManualEntry,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get supportsNotifications => $composableBuilder(
    column: $table.supportsNotifications,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> searchRuleSourcesRefs<T extends Object>(
    Expression<T> Function($$SearchRuleSourcesTableAnnotationComposer a) f,
  ) {
    final $$SearchRuleSourcesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.searchRuleSources,
          getReferencedColumn: (t) => t.sourceId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SearchRuleSourcesTableAnnotationComposer(
                $db: $db,
                $table: $db.searchRuleSources,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SearchSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchSourcesTable,
          SearchSourceRow,
          $$SearchSourcesTableFilterComposer,
          $$SearchSourcesTableOrderingComposer,
          $$SearchSourcesTableAnnotationComposer,
          $$SearchSourcesTableCreateCompanionBuilder,
          $$SearchSourcesTableUpdateCompanionBuilder,
          (SearchSourceRow, $$SearchSourcesTableReferences),
          SearchSourceRow,
          PrefetchHooks Function({bool searchRuleSourcesRefs})
        > {
  $$SearchSourcesTableTableManager(_$AppDatabase db, $SearchSourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<double> defaultRadius = const Value.absent(),
                Value<bool> supportsDirectLink = const Value.absent(),
                Value<bool> supportsManualEntry = const Value.absent(),
                Value<bool> supportsNotifications = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchSourcesCompanion(
                id: id,
                name: name,
                type: type,
                enabled: enabled,
                defaultRadius: defaultRadius,
                supportsDirectLink: supportsDirectLink,
                supportsManualEntry: supportsManualEntry,
                supportsNotifications: supportsNotifications,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String type,
                required bool enabled,
                required double defaultRadius,
                required bool supportsDirectLink,
                required bool supportsManualEntry,
                required bool supportsNotifications,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => SearchSourcesCompanion.insert(
                id: id,
                name: name,
                type: type,
                enabled: enabled,
                defaultRadius: defaultRadius,
                supportsDirectLink: supportsDirectLink,
                supportsManualEntry: supportsManualEntry,
                supportsNotifications: supportsNotifications,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SearchSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({searchRuleSourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (searchRuleSourcesRefs) db.searchRuleSources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (searchRuleSourcesRefs)
                    await $_getPrefetchedData<
                      SearchSourceRow,
                      $SearchSourcesTable,
                      SearchRuleSourceRow
                    >(
                      currentTable: table,
                      referencedTable: $$SearchSourcesTableReferences
                          ._searchRuleSourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SearchSourcesTableReferences(
                            db,
                            table,
                            p0,
                          ).searchRuleSourcesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.sourceId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SearchSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchSourcesTable,
      SearchSourceRow,
      $$SearchSourcesTableFilterComposer,
      $$SearchSourcesTableOrderingComposer,
      $$SearchSourcesTableAnnotationComposer,
      $$SearchSourcesTableCreateCompanionBuilder,
      $$SearchSourcesTableUpdateCompanionBuilder,
      (SearchSourceRow, $$SearchSourcesTableReferences),
      SearchSourceRow,
      PrefetchHooks Function({bool searchRuleSourcesRefs})
    >;
typedef $$SearchRulesTableCreateCompanionBuilder =
    SearchRulesCompanion Function({
      required String id,
      required String name,
      required String keywords,
      required String excludedWords,
      required double maxRadius,
      required bool notify,
      required bool enabled,
      Value<int> rowid,
    });
typedef $$SearchRulesTableUpdateCompanionBuilder =
    SearchRulesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> keywords,
      Value<String> excludedWords,
      Value<double> maxRadius,
      Value<bool> notify,
      Value<bool> enabled,
      Value<int> rowid,
    });

final class $$SearchRulesTableReferences
    extends BaseReferences<_$AppDatabase, $SearchRulesTable, SearchRuleRow> {
  $$SearchRulesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$SearchRuleSourcesTable, List<SearchRuleSourceRow>>
  _searchRuleSourcesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.searchRuleSources,
        aliasName: 'search_rules__id__search_rule_sources__rule_id',
      );

  $$SearchRuleSourcesTableProcessedTableManager get searchRuleSourcesRefs {
    final manager = $$SearchRuleSourcesTableTableManager(
      $_db,
      $_db.searchRuleSources,
    ).filter((f) => f.ruleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _searchRuleSourcesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$SearchRulesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchRulesTable> {
  $$SearchRulesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keywords => $composableBuilder(
    column: $table.keywords,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get excludedWords => $composableBuilder(
    column: $table.excludedWords,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get maxRadius => $composableBuilder(
    column: $table.maxRadius,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notify => $composableBuilder(
    column: $table.notify,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> searchRuleSourcesRefs(
    Expression<bool> Function($$SearchRuleSourcesTableFilterComposer f) f,
  ) {
    final $$SearchRuleSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.searchRuleSources,
      getReferencedColumn: (t) => t.ruleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchRuleSourcesTableFilterComposer(
            $db: $db,
            $table: $db.searchRuleSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$SearchRulesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchRulesTable> {
  $$SearchRulesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keywords => $composableBuilder(
    column: $table.keywords,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get excludedWords => $composableBuilder(
    column: $table.excludedWords,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get maxRadius => $composableBuilder(
    column: $table.maxRadius,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notify => $composableBuilder(
    column: $table.notify,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get enabled => $composableBuilder(
    column: $table.enabled,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SearchRulesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchRulesTable> {
  $$SearchRulesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get keywords =>
      $composableBuilder(column: $table.keywords, builder: (column) => column);

  GeneratedColumn<String> get excludedWords => $composableBuilder(
    column: $table.excludedWords,
    builder: (column) => column,
  );

  GeneratedColumn<double> get maxRadius =>
      $composableBuilder(column: $table.maxRadius, builder: (column) => column);

  GeneratedColumn<bool> get notify =>
      $composableBuilder(column: $table.notify, builder: (column) => column);

  GeneratedColumn<bool> get enabled =>
      $composableBuilder(column: $table.enabled, builder: (column) => column);

  Expression<T> searchRuleSourcesRefs<T extends Object>(
    Expression<T> Function($$SearchRuleSourcesTableAnnotationComposer a) f,
  ) {
    final $$SearchRuleSourcesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.searchRuleSources,
          getReferencedColumn: (t) => t.ruleId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$SearchRuleSourcesTableAnnotationComposer(
                $db: $db,
                $table: $db.searchRuleSources,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$SearchRulesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchRulesTable,
          SearchRuleRow,
          $$SearchRulesTableFilterComposer,
          $$SearchRulesTableOrderingComposer,
          $$SearchRulesTableAnnotationComposer,
          $$SearchRulesTableCreateCompanionBuilder,
          $$SearchRulesTableUpdateCompanionBuilder,
          (SearchRuleRow, $$SearchRulesTableReferences),
          SearchRuleRow,
          PrefetchHooks Function({bool searchRuleSourcesRefs})
        > {
  $$SearchRulesTableTableManager(_$AppDatabase db, $SearchRulesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchRulesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchRulesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchRulesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> keywords = const Value.absent(),
                Value<String> excludedWords = const Value.absent(),
                Value<double> maxRadius = const Value.absent(),
                Value<bool> notify = const Value.absent(),
                Value<bool> enabled = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchRulesCompanion(
                id: id,
                name: name,
                keywords: keywords,
                excludedWords: excludedWords,
                maxRadius: maxRadius,
                notify: notify,
                enabled: enabled,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String keywords,
                required String excludedWords,
                required double maxRadius,
                required bool notify,
                required bool enabled,
                Value<int> rowid = const Value.absent(),
              }) => SearchRulesCompanion.insert(
                id: id,
                name: name,
                keywords: keywords,
                excludedWords: excludedWords,
                maxRadius: maxRadius,
                notify: notify,
                enabled: enabled,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SearchRulesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({searchRuleSourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (searchRuleSourcesRefs) db.searchRuleSources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (searchRuleSourcesRefs)
                    await $_getPrefetchedData<
                      SearchRuleRow,
                      $SearchRulesTable,
                      SearchRuleSourceRow
                    >(
                      currentTable: table,
                      referencedTable: $$SearchRulesTableReferences
                          ._searchRuleSourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$SearchRulesTableReferences(
                            db,
                            table,
                            p0,
                          ).searchRuleSourcesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.ruleId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$SearchRulesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchRulesTable,
      SearchRuleRow,
      $$SearchRulesTableFilterComposer,
      $$SearchRulesTableOrderingComposer,
      $$SearchRulesTableAnnotationComposer,
      $$SearchRulesTableCreateCompanionBuilder,
      $$SearchRulesTableUpdateCompanionBuilder,
      (SearchRuleRow, $$SearchRulesTableReferences),
      SearchRuleRow,
      PrefetchHooks Function({bool searchRuleSourcesRefs})
    >;
typedef $$SearchRuleSourcesTableCreateCompanionBuilder =
    SearchRuleSourcesCompanion Function({
      required String ruleId,
      required String sourceId,
      Value<int> rowid,
    });
typedef $$SearchRuleSourcesTableUpdateCompanionBuilder =
    SearchRuleSourcesCompanion Function({
      Value<String> ruleId,
      Value<String> sourceId,
      Value<int> rowid,
    });

final class $$SearchRuleSourcesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $SearchRuleSourcesTable,
          SearchRuleSourceRow
        > {
  $$SearchRuleSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $SearchRulesTable _ruleIdTable(_$AppDatabase db) => db.searchRules
      .createAlias('search_rule_sources__rule_id__search_rules__id');

  $$SearchRulesTableProcessedTableManager get ruleId {
    final $_column = $_itemColumn<String>('rule_id')!;

    final manager = $$SearchRulesTableTableManager(
      $_db,
      $_db.searchRules,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ruleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $SearchSourcesTable _sourceIdTable(_$AppDatabase db) => db
      .searchSources
      .createAlias('search_rule_sources__source_id__search_sources__id');

  $$SearchSourcesTableProcessedTableManager get sourceId {
    final $_column = $_itemColumn<String>('source_id')!;

    final manager = $$SearchSourcesTableTableManager(
      $_db,
      $_db.searchSources,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$SearchRuleSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $SearchRuleSourcesTable> {
  $$SearchRuleSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchRulesTableFilterComposer get ruleId {
    final $$SearchRulesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ruleId,
      referencedTable: $db.searchRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchRulesTableFilterComposer(
            $db: $db,
            $table: $db.searchRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SearchSourcesTableFilterComposer get sourceId {
    final $$SearchSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.searchSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchSourcesTableFilterComposer(
            $db: $db,
            $table: $db.searchSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchRuleSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $SearchRuleSourcesTable> {
  $$SearchRuleSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchRulesTableOrderingComposer get ruleId {
    final $$SearchRulesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ruleId,
      referencedTable: $db.searchRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchRulesTableOrderingComposer(
            $db: $db,
            $table: $db.searchRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SearchSourcesTableOrderingComposer get sourceId {
    final $$SearchSourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.searchSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchSourcesTableOrderingComposer(
            $db: $db,
            $table: $db.searchSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchRuleSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SearchRuleSourcesTable> {
  $$SearchRuleSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$SearchRulesTableAnnotationComposer get ruleId {
    final $$SearchRulesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ruleId,
      referencedTable: $db.searchRules,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchRulesTableAnnotationComposer(
            $db: $db,
            $table: $db.searchRules,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$SearchSourcesTableAnnotationComposer get sourceId {
    final $$SearchSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.searchSources,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$SearchSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.searchSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$SearchRuleSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SearchRuleSourcesTable,
          SearchRuleSourceRow,
          $$SearchRuleSourcesTableFilterComposer,
          $$SearchRuleSourcesTableOrderingComposer,
          $$SearchRuleSourcesTableAnnotationComposer,
          $$SearchRuleSourcesTableCreateCompanionBuilder,
          $$SearchRuleSourcesTableUpdateCompanionBuilder,
          (SearchRuleSourceRow, $$SearchRuleSourcesTableReferences),
          SearchRuleSourceRow,
          PrefetchHooks Function({bool ruleId, bool sourceId})
        > {
  $$SearchRuleSourcesTableTableManager(
    _$AppDatabase db,
    $SearchRuleSourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SearchRuleSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SearchRuleSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SearchRuleSourcesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> ruleId = const Value.absent(),
                Value<String> sourceId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SearchRuleSourcesCompanion(
                ruleId: ruleId,
                sourceId: sourceId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String ruleId,
                required String sourceId,
                Value<int> rowid = const Value.absent(),
              }) => SearchRuleSourcesCompanion.insert(
                ruleId: ruleId,
                sourceId: sourceId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$SearchRuleSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ruleId = false, sourceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (ruleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ruleId,
                                referencedTable:
                                    $$SearchRuleSourcesTableReferences
                                        ._ruleIdTable(db),
                                referencedColumn:
                                    $$SearchRuleSourcesTableReferences
                                        ._ruleIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (sourceId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.sourceId,
                                referencedTable:
                                    $$SearchRuleSourcesTableReferences
                                        ._sourceIdTable(db),
                                referencedColumn:
                                    $$SearchRuleSourcesTableReferences
                                        ._sourceIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$SearchRuleSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SearchRuleSourcesTable,
      SearchRuleSourceRow,
      $$SearchRuleSourcesTableFilterComposer,
      $$SearchRuleSourcesTableOrderingComposer,
      $$SearchRuleSourcesTableAnnotationComposer,
      $$SearchRuleSourcesTableCreateCompanionBuilder,
      $$SearchRuleSourcesTableUpdateCompanionBuilder,
      (SearchRuleSourceRow, $$SearchRuleSourcesTableReferences),
      SearchRuleSourceRow,
      PrefetchHooks Function({bool ruleId, bool sourceId})
    >;
typedef $$NotificationSettingsTableTableCreateCompanionBuilder =
    NotificationSettingsTableCompanion Function({
      Value<int> id,
      required bool notificationsEnabled,
      required bool notifyNewMatches,
      required bool notifyHighValueOnly,
      required double minimumValueThreshold,
      required bool quietHoursEnabled,
      required String quietStart,
      required String quietEnd,
      required bool notifyDuplicates,
      required bool notifyWorthwhileRoute,
    });
typedef $$NotificationSettingsTableTableUpdateCompanionBuilder =
    NotificationSettingsTableCompanion Function({
      Value<int> id,
      Value<bool> notificationsEnabled,
      Value<bool> notifyNewMatches,
      Value<bool> notifyHighValueOnly,
      Value<double> minimumValueThreshold,
      Value<bool> quietHoursEnabled,
      Value<String> quietStart,
      Value<String> quietEnd,
      Value<bool> notifyDuplicates,
      Value<bool> notifyWorthwhileRoute,
    });

class $$NotificationSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyNewMatches => $composableBuilder(
    column: $table.notifyNewMatches,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyHighValueOnly => $composableBuilder(
    column: $table.notifyHighValueOnly,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get minimumValueThreshold => $composableBuilder(
    column: $table.minimumValueThreshold,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get quietEnd => $composableBuilder(
    column: $table.quietEnd,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyDuplicates => $composableBuilder(
    column: $table.notifyDuplicates,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get notifyWorthwhileRoute => $composableBuilder(
    column: $table.notifyWorthwhileRoute,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NotificationSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyNewMatches => $composableBuilder(
    column: $table.notifyNewMatches,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyHighValueOnly => $composableBuilder(
    column: $table.notifyHighValueOnly,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get minimumValueThreshold => $composableBuilder(
    column: $table.minimumValueThreshold,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get quietEnd => $composableBuilder(
    column: $table.quietEnd,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyDuplicates => $composableBuilder(
    column: $table.notifyDuplicates,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get notifyWorthwhileRoute => $composableBuilder(
    column: $table.notifyWorthwhileRoute,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NotificationSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $NotificationSettingsTableTable> {
  $$NotificationSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get notificationsEnabled => $composableBuilder(
    column: $table.notificationsEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyNewMatches => $composableBuilder(
    column: $table.notifyNewMatches,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyHighValueOnly => $composableBuilder(
    column: $table.notifyHighValueOnly,
    builder: (column) => column,
  );

  GeneratedColumn<double> get minimumValueThreshold => $composableBuilder(
    column: $table.minimumValueThreshold,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get quietHoursEnabled => $composableBuilder(
    column: $table.quietHoursEnabled,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quietStart => $composableBuilder(
    column: $table.quietStart,
    builder: (column) => column,
  );

  GeneratedColumn<String> get quietEnd =>
      $composableBuilder(column: $table.quietEnd, builder: (column) => column);

  GeneratedColumn<bool> get notifyDuplicates => $composableBuilder(
    column: $table.notifyDuplicates,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get notifyWorthwhileRoute => $composableBuilder(
    column: $table.notifyWorthwhileRoute,
    builder: (column) => column,
  );
}

class $$NotificationSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $NotificationSettingsTableTable,
          NotificationSettingsRow,
          $$NotificationSettingsTableTableFilterComposer,
          $$NotificationSettingsTableTableOrderingComposer,
          $$NotificationSettingsTableTableAnnotationComposer,
          $$NotificationSettingsTableTableCreateCompanionBuilder,
          $$NotificationSettingsTableTableUpdateCompanionBuilder,
          (
            NotificationSettingsRow,
            BaseReferences<
              _$AppDatabase,
              $NotificationSettingsTableTable,
              NotificationSettingsRow
            >,
          ),
          NotificationSettingsRow,
          PrefetchHooks Function()
        > {
  $$NotificationSettingsTableTableTableManager(
    _$AppDatabase db,
    $NotificationSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NotificationSettingsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$NotificationSettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$NotificationSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<bool> notificationsEnabled = const Value.absent(),
                Value<bool> notifyNewMatches = const Value.absent(),
                Value<bool> notifyHighValueOnly = const Value.absent(),
                Value<double> minimumValueThreshold = const Value.absent(),
                Value<bool> quietHoursEnabled = const Value.absent(),
                Value<String> quietStart = const Value.absent(),
                Value<String> quietEnd = const Value.absent(),
                Value<bool> notifyDuplicates = const Value.absent(),
                Value<bool> notifyWorthwhileRoute = const Value.absent(),
              }) => NotificationSettingsTableCompanion(
                id: id,
                notificationsEnabled: notificationsEnabled,
                notifyNewMatches: notifyNewMatches,
                notifyHighValueOnly: notifyHighValueOnly,
                minimumValueThreshold: minimumValueThreshold,
                quietHoursEnabled: quietHoursEnabled,
                quietStart: quietStart,
                quietEnd: quietEnd,
                notifyDuplicates: notifyDuplicates,
                notifyWorthwhileRoute: notifyWorthwhileRoute,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required bool notificationsEnabled,
                required bool notifyNewMatches,
                required bool notifyHighValueOnly,
                required double minimumValueThreshold,
                required bool quietHoursEnabled,
                required String quietStart,
                required String quietEnd,
                required bool notifyDuplicates,
                required bool notifyWorthwhileRoute,
              }) => NotificationSettingsTableCompanion.insert(
                id: id,
                notificationsEnabled: notificationsEnabled,
                notifyNewMatches: notifyNewMatches,
                notifyHighValueOnly: notifyHighValueOnly,
                minimumValueThreshold: minimumValueThreshold,
                quietHoursEnabled: quietHoursEnabled,
                quietStart: quietStart,
                quietEnd: quietEnd,
                notifyDuplicates: notifyDuplicates,
                notifyWorthwhileRoute: notifyWorthwhileRoute,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NotificationSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $NotificationSettingsTableTable,
      NotificationSettingsRow,
      $$NotificationSettingsTableTableFilterComposer,
      $$NotificationSettingsTableTableOrderingComposer,
      $$NotificationSettingsTableTableAnnotationComposer,
      $$NotificationSettingsTableTableCreateCompanionBuilder,
      $$NotificationSettingsTableTableUpdateCompanionBuilder,
      (
        NotificationSettingsRow,
        BaseReferences<
          _$AppDatabase,
          $NotificationSettingsTableTable,
          NotificationSettingsRow
        >,
      ),
      NotificationSettingsRow,
      PrefetchHooks Function()
    >;
typedef $$ObjectTemplatesTableCreateCompanionBuilder =
    ObjectTemplatesCompanion Function({
      required String id,
      required String name,
      required String aliases,
      required String category,
      required String cargoDemand,
      required String destination,
      required double lowValue,
      required double likelyValue,
      required double highValue,
      required int stripMinutes,
      required int stripDifficulty,
      required String safetyNotes,
      required String toolsNeeded,
      required String recoverableMaterials,
      required String partOutNotes,
      required String notes,
      Value<int> rowid,
    });
typedef $$ObjectTemplatesTableUpdateCompanionBuilder =
    ObjectTemplatesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> aliases,
      Value<String> category,
      Value<String> cargoDemand,
      Value<String> destination,
      Value<double> lowValue,
      Value<double> likelyValue,
      Value<double> highValue,
      Value<int> stripMinutes,
      Value<int> stripDifficulty,
      Value<String> safetyNotes,
      Value<String> toolsNeeded,
      Value<String> recoverableMaterials,
      Value<String> partOutNotes,
      Value<String> notes,
      Value<int> rowid,
    });

final class $$ObjectTemplatesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ObjectTemplatesTable,
          ObjectTemplateRow
        > {
  $$ObjectTemplatesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$ScrapItemsTable, List<ScrapItemRow>>
  _scrapItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.scrapItems,
    aliasName: 'object_templates__id__scrap_items__template_id',
  );

  $$ScrapItemsTableProcessedTableManager get scrapItemsRefs {
    final manager = $$ScrapItemsTableTableManager(
      $_db,
      $_db.scrapItems,
    ).filter((f) => f.templateId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_scrapItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ObjectTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $ObjectTemplatesTable> {
  $$ObjectTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cargoDemand => $composableBuilder(
    column: $table.cargoDemand,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get lowValue => $composableBuilder(
    column: $table.lowValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get likelyValue => $composableBuilder(
    column: $table.likelyValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get highValue => $composableBuilder(
    column: $table.highValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stripMinutes => $composableBuilder(
    column: $table.stripMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stripDifficulty => $composableBuilder(
    column: $table.stripDifficulty,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get safetyNotes => $composableBuilder(
    column: $table.safetyNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get toolsNeeded => $composableBuilder(
    column: $table.toolsNeeded,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoverableMaterials => $composableBuilder(
    column: $table.recoverableMaterials,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get partOutNotes => $composableBuilder(
    column: $table.partOutNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> scrapItemsRefs(
    Expression<bool> Function($$ScrapItemsTableFilterComposer f) f,
  ) {
    final $$ScrapItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scrapItems,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScrapItemsTableFilterComposer(
            $db: $db,
            $table: $db.scrapItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObjectTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $ObjectTemplatesTable> {
  $$ObjectTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get aliases => $composableBuilder(
    column: $table.aliases,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cargoDemand => $composableBuilder(
    column: $table.cargoDemand,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get lowValue => $composableBuilder(
    column: $table.lowValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get likelyValue => $composableBuilder(
    column: $table.likelyValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get highValue => $composableBuilder(
    column: $table.highValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stripMinutes => $composableBuilder(
    column: $table.stripMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stripDifficulty => $composableBuilder(
    column: $table.stripDifficulty,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get safetyNotes => $composableBuilder(
    column: $table.safetyNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get toolsNeeded => $composableBuilder(
    column: $table.toolsNeeded,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoverableMaterials => $composableBuilder(
    column: $table.recoverableMaterials,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get partOutNotes => $composableBuilder(
    column: $table.partOutNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ObjectTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ObjectTemplatesTable> {
  $$ObjectTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get aliases =>
      $composableBuilder(column: $table.aliases, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get cargoDemand => $composableBuilder(
    column: $table.cargoDemand,
    builder: (column) => column,
  );

  GeneratedColumn<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => column,
  );

  GeneratedColumn<double> get lowValue =>
      $composableBuilder(column: $table.lowValue, builder: (column) => column);

  GeneratedColumn<double> get likelyValue => $composableBuilder(
    column: $table.likelyValue,
    builder: (column) => column,
  );

  GeneratedColumn<double> get highValue =>
      $composableBuilder(column: $table.highValue, builder: (column) => column);

  GeneratedColumn<int> get stripMinutes => $composableBuilder(
    column: $table.stripMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get stripDifficulty => $composableBuilder(
    column: $table.stripDifficulty,
    builder: (column) => column,
  );

  GeneratedColumn<String> get safetyNotes => $composableBuilder(
    column: $table.safetyNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get toolsNeeded => $composableBuilder(
    column: $table.toolsNeeded,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoverableMaterials => $composableBuilder(
    column: $table.recoverableMaterials,
    builder: (column) => column,
  );

  GeneratedColumn<String> get partOutNotes => $composableBuilder(
    column: $table.partOutNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  Expression<T> scrapItemsRefs<T extends Object>(
    Expression<T> Function($$ScrapItemsTableAnnotationComposer a) f,
  ) {
    final $$ScrapItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.scrapItems,
      getReferencedColumn: (t) => t.templateId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScrapItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.scrapItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ObjectTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ObjectTemplatesTable,
          ObjectTemplateRow,
          $$ObjectTemplatesTableFilterComposer,
          $$ObjectTemplatesTableOrderingComposer,
          $$ObjectTemplatesTableAnnotationComposer,
          $$ObjectTemplatesTableCreateCompanionBuilder,
          $$ObjectTemplatesTableUpdateCompanionBuilder,
          (ObjectTemplateRow, $$ObjectTemplatesTableReferences),
          ObjectTemplateRow,
          PrefetchHooks Function({bool scrapItemsRefs})
        > {
  $$ObjectTemplatesTableTableManager(
    _$AppDatabase db,
    $ObjectTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ObjectTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ObjectTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ObjectTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> aliases = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> cargoDemand = const Value.absent(),
                Value<String> destination = const Value.absent(),
                Value<double> lowValue = const Value.absent(),
                Value<double> likelyValue = const Value.absent(),
                Value<double> highValue = const Value.absent(),
                Value<int> stripMinutes = const Value.absent(),
                Value<int> stripDifficulty = const Value.absent(),
                Value<String> safetyNotes = const Value.absent(),
                Value<String> toolsNeeded = const Value.absent(),
                Value<String> recoverableMaterials = const Value.absent(),
                Value<String> partOutNotes = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ObjectTemplatesCompanion(
                id: id,
                name: name,
                aliases: aliases,
                category: category,
                cargoDemand: cargoDemand,
                destination: destination,
                lowValue: lowValue,
                likelyValue: likelyValue,
                highValue: highValue,
                stripMinutes: stripMinutes,
                stripDifficulty: stripDifficulty,
                safetyNotes: safetyNotes,
                toolsNeeded: toolsNeeded,
                recoverableMaterials: recoverableMaterials,
                partOutNotes: partOutNotes,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String aliases,
                required String category,
                required String cargoDemand,
                required String destination,
                required double lowValue,
                required double likelyValue,
                required double highValue,
                required int stripMinutes,
                required int stripDifficulty,
                required String safetyNotes,
                required String toolsNeeded,
                required String recoverableMaterials,
                required String partOutNotes,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => ObjectTemplatesCompanion.insert(
                id: id,
                name: name,
                aliases: aliases,
                category: category,
                cargoDemand: cargoDemand,
                destination: destination,
                lowValue: lowValue,
                likelyValue: likelyValue,
                highValue: highValue,
                stripMinutes: stripMinutes,
                stripDifficulty: stripDifficulty,
                safetyNotes: safetyNotes,
                toolsNeeded: toolsNeeded,
                recoverableMaterials: recoverableMaterials,
                partOutNotes: partOutNotes,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ObjectTemplatesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({scrapItemsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (scrapItemsRefs) db.scrapItems],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (scrapItemsRefs)
                    await $_getPrefetchedData<
                      ObjectTemplateRow,
                      $ObjectTemplatesTable,
                      ScrapItemRow
                    >(
                      currentTable: table,
                      referencedTable: $$ObjectTemplatesTableReferences
                          ._scrapItemsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ObjectTemplatesTableReferences(
                            db,
                            table,
                            p0,
                          ).scrapItemsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.templateId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ObjectTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ObjectTemplatesTable,
      ObjectTemplateRow,
      $$ObjectTemplatesTableFilterComposer,
      $$ObjectTemplatesTableOrderingComposer,
      $$ObjectTemplatesTableAnnotationComposer,
      $$ObjectTemplatesTableCreateCompanionBuilder,
      $$ObjectTemplatesTableUpdateCompanionBuilder,
      (ObjectTemplateRow, $$ObjectTemplatesTableReferences),
      ObjectTemplateRow,
      PrefetchHooks Function({bool scrapItemsRefs})
    >;
typedef $$ScrapItemsTableCreateCompanionBuilder =
    ScrapItemsCompanion Function({
      required String id,
      required String title,
      required String templateId,
      required String pickupAddress,
      required String locationName,
      required double miles,
      required String timeWindow,
      required String destination,
      required String status,
      required String notes,
      required String source,
      Value<String?> sourceId,
      Value<String?> sourceUrl,
      required String ruleMatch,
      required bool duplicateWarning,
      Value<int> rowid,
    });
typedef $$ScrapItemsTableUpdateCompanionBuilder =
    ScrapItemsCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> templateId,
      Value<String> pickupAddress,
      Value<String> locationName,
      Value<double> miles,
      Value<String> timeWindow,
      Value<String> destination,
      Value<String> status,
      Value<String> notes,
      Value<String> source,
      Value<String?> sourceId,
      Value<String?> sourceUrl,
      Value<String> ruleMatch,
      Value<bool> duplicateWarning,
      Value<int> rowid,
    });

final class $$ScrapItemsTableReferences
    extends BaseReferences<_$AppDatabase, $ScrapItemsTable, ScrapItemRow> {
  $$ScrapItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ObjectTemplatesTable _templateIdTable(_$AppDatabase db) => db
      .objectTemplates
      .createAlias('scrap_items__template_id__object_templates__id');

  $$ObjectTemplatesTableProcessedTableManager get templateId {
    final $_column = $_itemColumn<String>('template_id')!;

    final manager = $$ObjectTemplatesTableTableManager(
      $_db,
      $_db.objectTemplates,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_templateIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RunPlanItemsTable, List<RunPlanItemRow>>
  _runPlanItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.runPlanItems,
    aliasName: 'scrap_items__id__run_plan_items__item_id',
  );

  $$RunPlanItemsTableProcessedTableManager get runPlanItemsRefs {
    final manager = $$RunPlanItemsTableTableManager(
      $_db,
      $_db.runPlanItems,
    ).filter((f) => f.itemId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_runPlanItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ScrapItemsTableFilterComposer
    extends Composer<_$AppDatabase, $ScrapItemsTable> {
  $$ScrapItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get miles => $composableBuilder(
    column: $table.miles,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get timeWindow => $composableBuilder(
    column: $table.timeWindow,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ruleMatch => $composableBuilder(
    column: $table.ruleMatch,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get duplicateWarning => $composableBuilder(
    column: $table.duplicateWarning,
    builder: (column) => ColumnFilters(column),
  );

  $$ObjectTemplatesTableFilterComposer get templateId {
    final $$ObjectTemplatesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.objectTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectTemplatesTableFilterComposer(
            $db: $db,
            $table: $db.objectTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> runPlanItemsRefs(
    Expression<bool> Function($$RunPlanItemsTableFilterComposer f) f,
  ) {
    final $$RunPlanItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlanItems,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlanItemsTableFilterComposer(
            $db: $db,
            $table: $db.runPlanItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScrapItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $ScrapItemsTable> {
  $$ScrapItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get miles => $composableBuilder(
    column: $table.miles,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get timeWindow => $composableBuilder(
    column: $table.timeWindow,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceUrl => $composableBuilder(
    column: $table.sourceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ruleMatch => $composableBuilder(
    column: $table.ruleMatch,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get duplicateWarning => $composableBuilder(
    column: $table.duplicateWarning,
    builder: (column) => ColumnOrderings(column),
  );

  $$ObjectTemplatesTableOrderingComposer get templateId {
    final $$ObjectTemplatesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.objectTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectTemplatesTableOrderingComposer(
            $db: $db,
            $table: $db.objectTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ScrapItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ScrapItemsTable> {
  $$ScrapItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get pickupAddress => $composableBuilder(
    column: $table.pickupAddress,
    builder: (column) => column,
  );

  GeneratedColumn<String> get locationName => $composableBuilder(
    column: $table.locationName,
    builder: (column) => column,
  );

  GeneratedColumn<double> get miles =>
      $composableBuilder(column: $table.miles, builder: (column) => column);

  GeneratedColumn<String> get timeWindow => $composableBuilder(
    column: $table.timeWindow,
    builder: (column) => column,
  );

  GeneratedColumn<String> get destination => $composableBuilder(
    column: $table.destination,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceUrl =>
      $composableBuilder(column: $table.sourceUrl, builder: (column) => column);

  GeneratedColumn<String> get ruleMatch =>
      $composableBuilder(column: $table.ruleMatch, builder: (column) => column);

  GeneratedColumn<bool> get duplicateWarning => $composableBuilder(
    column: $table.duplicateWarning,
    builder: (column) => column,
  );

  $$ObjectTemplatesTableAnnotationComposer get templateId {
    final $$ObjectTemplatesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.templateId,
      referencedTable: $db.objectTemplates,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ObjectTemplatesTableAnnotationComposer(
            $db: $db,
            $table: $db.objectTemplates,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> runPlanItemsRefs<T extends Object>(
    Expression<T> Function($$RunPlanItemsTableAnnotationComposer a) f,
  ) {
    final $$RunPlanItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlanItems,
      getReferencedColumn: (t) => t.itemId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlanItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.runPlanItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ScrapItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ScrapItemsTable,
          ScrapItemRow,
          $$ScrapItemsTableFilterComposer,
          $$ScrapItemsTableOrderingComposer,
          $$ScrapItemsTableAnnotationComposer,
          $$ScrapItemsTableCreateCompanionBuilder,
          $$ScrapItemsTableUpdateCompanionBuilder,
          (ScrapItemRow, $$ScrapItemsTableReferences),
          ScrapItemRow,
          PrefetchHooks Function({bool templateId, bool runPlanItemsRefs})
        > {
  $$ScrapItemsTableTableManager(_$AppDatabase db, $ScrapItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ScrapItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ScrapItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ScrapItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> templateId = const Value.absent(),
                Value<String> pickupAddress = const Value.absent(),
                Value<String> locationName = const Value.absent(),
                Value<double> miles = const Value.absent(),
                Value<String> timeWindow = const Value.absent(),
                Value<String> destination = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String?> sourceId = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                Value<String> ruleMatch = const Value.absent(),
                Value<bool> duplicateWarning = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ScrapItemsCompanion(
                id: id,
                title: title,
                templateId: templateId,
                pickupAddress: pickupAddress,
                locationName: locationName,
                miles: miles,
                timeWindow: timeWindow,
                destination: destination,
                status: status,
                notes: notes,
                source: source,
                sourceId: sourceId,
                sourceUrl: sourceUrl,
                ruleMatch: ruleMatch,
                duplicateWarning: duplicateWarning,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String templateId,
                required String pickupAddress,
                required String locationName,
                required double miles,
                required String timeWindow,
                required String destination,
                required String status,
                required String notes,
                required String source,
                Value<String?> sourceId = const Value.absent(),
                Value<String?> sourceUrl = const Value.absent(),
                required String ruleMatch,
                required bool duplicateWarning,
                Value<int> rowid = const Value.absent(),
              }) => ScrapItemsCompanion.insert(
                id: id,
                title: title,
                templateId: templateId,
                pickupAddress: pickupAddress,
                locationName: locationName,
                miles: miles,
                timeWindow: timeWindow,
                destination: destination,
                status: status,
                notes: notes,
                source: source,
                sourceId: sourceId,
                sourceUrl: sourceUrl,
                ruleMatch: ruleMatch,
                duplicateWarning: duplicateWarning,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ScrapItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({templateId = false, runPlanItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (runPlanItemsRefs) db.runPlanItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (templateId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.templateId,
                                    referencedTable: $$ScrapItemsTableReferences
                                        ._templateIdTable(db),
                                    referencedColumn:
                                        $$ScrapItemsTableReferences
                                            ._templateIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (runPlanItemsRefs)
                        await $_getPrefetchedData<
                          ScrapItemRow,
                          $ScrapItemsTable,
                          RunPlanItemRow
                        >(
                          currentTable: table,
                          referencedTable: $$ScrapItemsTableReferences
                              ._runPlanItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$ScrapItemsTableReferences(
                                db,
                                table,
                                p0,
                              ).runPlanItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.itemId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$ScrapItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ScrapItemsTable,
      ScrapItemRow,
      $$ScrapItemsTableFilterComposer,
      $$ScrapItemsTableOrderingComposer,
      $$ScrapItemsTableAnnotationComposer,
      $$ScrapItemsTableCreateCompanionBuilder,
      $$ScrapItemsTableUpdateCompanionBuilder,
      (ScrapItemRow, $$ScrapItemsTableReferences),
      ScrapItemRow,
      PrefetchHooks Function({bool templateId, bool runPlanItemsRefs})
    >;
typedef $$RunPlansTableCreateCompanionBuilder =
    RunPlansCompanion Function({
      required String id,
      required String name,
      required String vehicleId,
      Value<bool> active,
      Value<int> rowid,
    });
typedef $$RunPlansTableUpdateCompanionBuilder =
    RunPlansCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> vehicleId,
      Value<bool> active,
      Value<int> rowid,
    });

final class $$RunPlansTableReferences
    extends BaseReferences<_$AppDatabase, $RunPlansTable, RunPlanRow> {
  $$RunPlansTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias('run_plans__vehicle_id__vehicles__id');

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager(
      $_db,
      $_db.vehicles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$RunPlanItemsTable, List<RunPlanItemRow>>
  _runPlanItemsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.runPlanItems,
    aliasName: 'run_plans__id__run_plan_items__run_plan_id',
  );

  $$RunPlanItemsTableProcessedTableManager get runPlanItemsRefs {
    final manager = $$RunPlanItemsTableTableManager(
      $_db,
      $_db.runPlanItems,
    ).filter((f) => f.runPlanId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_runPlanItemsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RunPlansTableFilterComposer
    extends Composer<_$AppDatabase, $RunPlansTable> {
  $$RunPlansTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableFilterComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> runPlanItemsRefs(
    Expression<bool> Function($$RunPlanItemsTableFilterComposer f) f,
  ) {
    final $$RunPlanItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlanItems,
      getReferencedColumn: (t) => t.runPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlanItemsTableFilterComposer(
            $db: $db,
            $table: $db.runPlanItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RunPlansTableOrderingComposer
    extends Composer<_$AppDatabase, $RunPlansTable> {
  $$RunPlansTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get active => $composableBuilder(
    column: $table.active,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RunPlansTableAnnotationComposer
    extends Composer<_$AppDatabase, $RunPlansTable> {
  $$RunPlansTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> runPlanItemsRefs<T extends Object>(
    Expression<T> Function($$RunPlanItemsTableAnnotationComposer a) f,
  ) {
    final $$RunPlanItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.runPlanItems,
      getReferencedColumn: (t) => t.runPlanId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlanItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.runPlanItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RunPlansTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RunPlansTable,
          RunPlanRow,
          $$RunPlansTableFilterComposer,
          $$RunPlansTableOrderingComposer,
          $$RunPlansTableAnnotationComposer,
          $$RunPlansTableCreateCompanionBuilder,
          $$RunPlansTableUpdateCompanionBuilder,
          (RunPlanRow, $$RunPlansTableReferences),
          RunPlanRow,
          PrefetchHooks Function({bool vehicleId, bool runPlanItemsRefs})
        > {
  $$RunPlansTableTableManager(_$AppDatabase db, $RunPlansTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RunPlansTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RunPlansTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RunPlansTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RunPlansCompanion(
                id: id,
                name: name,
                vehicleId: vehicleId,
                active: active,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required String vehicleId,
                Value<bool> active = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RunPlansCompanion.insert(
                id: id,
                name: name,
                vehicleId: vehicleId,
                active: active,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RunPlansTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({vehicleId = false, runPlanItemsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (runPlanItemsRefs) db.runPlanItems,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (vehicleId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.vehicleId,
                                    referencedTable: $$RunPlansTableReferences
                                        ._vehicleIdTable(db),
                                    referencedColumn: $$RunPlansTableReferences
                                        ._vehicleIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (runPlanItemsRefs)
                        await $_getPrefetchedData<
                          RunPlanRow,
                          $RunPlansTable,
                          RunPlanItemRow
                        >(
                          currentTable: table,
                          referencedTable: $$RunPlansTableReferences
                              ._runPlanItemsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RunPlansTableReferences(
                                db,
                                table,
                                p0,
                              ).runPlanItemsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.runPlanId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RunPlansTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RunPlansTable,
      RunPlanRow,
      $$RunPlansTableFilterComposer,
      $$RunPlansTableOrderingComposer,
      $$RunPlansTableAnnotationComposer,
      $$RunPlansTableCreateCompanionBuilder,
      $$RunPlansTableUpdateCompanionBuilder,
      (RunPlanRow, $$RunPlansTableReferences),
      RunPlanRow,
      PrefetchHooks Function({bool vehicleId, bool runPlanItemsRefs})
    >;
typedef $$RunPlanItemsTableCreateCompanionBuilder =
    RunPlanItemsCompanion Function({
      required String runPlanId,
      required String itemId,
      required int stopOrder,
      Value<int> rowid,
    });
typedef $$RunPlanItemsTableUpdateCompanionBuilder =
    RunPlanItemsCompanion Function({
      Value<String> runPlanId,
      Value<String> itemId,
      Value<int> stopOrder,
      Value<int> rowid,
    });

final class $$RunPlanItemsTableReferences
    extends BaseReferences<_$AppDatabase, $RunPlanItemsTable, RunPlanItemRow> {
  $$RunPlanItemsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RunPlansTable _runPlanIdTable(_$AppDatabase db) =>
      db.runPlans.createAlias('run_plan_items__run_plan_id__run_plans__id');

  $$RunPlansTableProcessedTableManager get runPlanId {
    final $_column = $_itemColumn<String>('run_plan_id')!;

    final manager = $$RunPlansTableTableManager(
      $_db,
      $_db.runPlans,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_runPlanIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ScrapItemsTable _itemIdTable(_$AppDatabase db) =>
      db.scrapItems.createAlias('run_plan_items__item_id__scrap_items__id');

  $$ScrapItemsTableProcessedTableManager get itemId {
    final $_column = $_itemColumn<String>('item_id')!;

    final manager = $$ScrapItemsTableTableManager(
      $_db,
      $_db.scrapItems,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_itemIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RunPlanItemsTableFilterComposer
    extends Composer<_$AppDatabase, $RunPlanItemsTable> {
  $$RunPlanItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get stopOrder => $composableBuilder(
    column: $table.stopOrder,
    builder: (column) => ColumnFilters(column),
  );

  $$RunPlansTableFilterComposer get runPlanId {
    final $$RunPlansTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.runPlanId,
      referencedTable: $db.runPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlansTableFilterComposer(
            $db: $db,
            $table: $db.runPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScrapItemsTableFilterComposer get itemId {
    final $$ScrapItemsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scrapItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScrapItemsTableFilterComposer(
            $db: $db,
            $table: $db.scrapItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RunPlanItemsTableOrderingComposer
    extends Composer<_$AppDatabase, $RunPlanItemsTable> {
  $$RunPlanItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get stopOrder => $composableBuilder(
    column: $table.stopOrder,
    builder: (column) => ColumnOrderings(column),
  );

  $$RunPlansTableOrderingComposer get runPlanId {
    final $$RunPlansTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.runPlanId,
      referencedTable: $db.runPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlansTableOrderingComposer(
            $db: $db,
            $table: $db.runPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScrapItemsTableOrderingComposer get itemId {
    final $$ScrapItemsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scrapItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScrapItemsTableOrderingComposer(
            $db: $db,
            $table: $db.scrapItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RunPlanItemsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RunPlanItemsTable> {
  $$RunPlanItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get stopOrder =>
      $composableBuilder(column: $table.stopOrder, builder: (column) => column);

  $$RunPlansTableAnnotationComposer get runPlanId {
    final $$RunPlansTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.runPlanId,
      referencedTable: $db.runPlans,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RunPlansTableAnnotationComposer(
            $db: $db,
            $table: $db.runPlans,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ScrapItemsTableAnnotationComposer get itemId {
    final $$ScrapItemsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.itemId,
      referencedTable: $db.scrapItems,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ScrapItemsTableAnnotationComposer(
            $db: $db,
            $table: $db.scrapItems,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RunPlanItemsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RunPlanItemsTable,
          RunPlanItemRow,
          $$RunPlanItemsTableFilterComposer,
          $$RunPlanItemsTableOrderingComposer,
          $$RunPlanItemsTableAnnotationComposer,
          $$RunPlanItemsTableCreateCompanionBuilder,
          $$RunPlanItemsTableUpdateCompanionBuilder,
          (RunPlanItemRow, $$RunPlanItemsTableReferences),
          RunPlanItemRow,
          PrefetchHooks Function({bool runPlanId, bool itemId})
        > {
  $$RunPlanItemsTableTableManager(_$AppDatabase db, $RunPlanItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RunPlanItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RunPlanItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RunPlanItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> runPlanId = const Value.absent(),
                Value<String> itemId = const Value.absent(),
                Value<int> stopOrder = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RunPlanItemsCompanion(
                runPlanId: runPlanId,
                itemId: itemId,
                stopOrder: stopOrder,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String runPlanId,
                required String itemId,
                required int stopOrder,
                Value<int> rowid = const Value.absent(),
              }) => RunPlanItemsCompanion.insert(
                runPlanId: runPlanId,
                itemId: itemId,
                stopOrder: stopOrder,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RunPlanItemsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({runPlanId = false, itemId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (runPlanId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.runPlanId,
                                referencedTable: $$RunPlanItemsTableReferences
                                    ._runPlanIdTable(db),
                                referencedColumn: $$RunPlanItemsTableReferences
                                    ._runPlanIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (itemId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.itemId,
                                referencedTable: $$RunPlanItemsTableReferences
                                    ._itemIdTable(db),
                                referencedColumn: $$RunPlanItemsTableReferences
                                    ._itemIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$RunPlanItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RunPlanItemsTable,
      RunPlanItemRow,
      $$RunPlanItemsTableFilterComposer,
      $$RunPlanItemsTableOrderingComposer,
      $$RunPlanItemsTableAnnotationComposer,
      $$RunPlanItemsTableCreateCompanionBuilder,
      $$RunPlanItemsTableUpdateCompanionBuilder,
      (RunPlanItemRow, $$RunPlanItemsTableReferences),
      RunPlanItemRow,
      PrefetchHooks Function({bool runPlanId, bool itemId})
    >;
typedef $$ReceiptsTableCreateCompanionBuilder =
    ReceiptsCompanion Function({
      required String id,
      required String yardId,
      required double amount,
      required DateTime date,
      required String notes,
      Value<int> rowid,
    });
typedef $$ReceiptsTableUpdateCompanionBuilder =
    ReceiptsCompanion Function({
      Value<String> id,
      Value<String> yardId,
      Value<double> amount,
      Value<DateTime> date,
      Value<String> notes,
      Value<int> rowid,
    });

final class $$ReceiptsTableReferences
    extends BaseReferences<_$AppDatabase, $ReceiptsTable, ReceiptRow> {
  $$ReceiptsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $YardsTable _yardIdTable(_$AppDatabase db) =>
      db.yards.createAlias('receipts__yard_id__yards__id');

  $$YardsTableProcessedTableManager get yardId {
    final $_column = $_itemColumn<String>('yard_id')!;

    final manager = $$YardsTableTableManager(
      $_db,
      $_db.yards,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_yardIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ReceiptsTableFilterComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  $$YardsTableFilterComposer get yardId {
    final $$YardsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableFilterComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableOrderingComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  $$YardsTableOrderingComposer get yardId {
    final $$YardsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableOrderingComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ReceiptsTable> {
  $$ReceiptsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  $$YardsTableAnnotationComposer get yardId {
    final $$YardsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.yardId,
      referencedTable: $db.yards,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$YardsTableAnnotationComposer(
            $db: $db,
            $table: $db.yards,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ReceiptsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ReceiptsTable,
          ReceiptRow,
          $$ReceiptsTableFilterComposer,
          $$ReceiptsTableOrderingComposer,
          $$ReceiptsTableAnnotationComposer,
          $$ReceiptsTableCreateCompanionBuilder,
          $$ReceiptsTableUpdateCompanionBuilder,
          (ReceiptRow, $$ReceiptsTableReferences),
          ReceiptRow,
          PrefetchHooks Function({bool yardId})
        > {
  $$ReceiptsTableTableManager(_$AppDatabase db, $ReceiptsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ReceiptsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ReceiptsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ReceiptsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> yardId = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ReceiptsCompanion(
                id: id,
                yardId: yardId,
                amount: amount,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String yardId,
                required double amount,
                required DateTime date,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => ReceiptsCompanion.insert(
                id: id,
                yardId: yardId,
                amount: amount,
                date: date,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ReceiptsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({yardId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (yardId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.yardId,
                                referencedTable: $$ReceiptsTableReferences
                                    ._yardIdTable(db),
                                referencedColumn: $$ReceiptsTableReferences
                                    ._yardIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ReceiptsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ReceiptsTable,
      ReceiptRow,
      $$ReceiptsTableFilterComposer,
      $$ReceiptsTableOrderingComposer,
      $$ReceiptsTableAnnotationComposer,
      $$ReceiptsTableCreateCompanionBuilder,
      $$ReceiptsTableUpdateCompanionBuilder,
      (ReceiptRow, $$ReceiptsTableReferences),
      ReceiptRow,
      PrefetchHooks Function({bool yardId})
    >;
typedef $$PhotoAttachmentsTableCreateCompanionBuilder =
    PhotoAttachmentsCompanion Function({
      required String id,
      required String ownerId,
      required String ownerType,
      Value<String?> localPath,
      required String caption,
      required DateTime createdAt,
      Value<String?> hash,
      Value<String?> ocrText,
      Value<int> rowid,
    });
typedef $$PhotoAttachmentsTableUpdateCompanionBuilder =
    PhotoAttachmentsCompanion Function({
      Value<String> id,
      Value<String> ownerId,
      Value<String> ownerType,
      Value<String?> localPath,
      Value<String> caption,
      Value<DateTime> createdAt,
      Value<String?> hash,
      Value<String?> ocrText,
      Value<int> rowid,
    });

class $$PhotoAttachmentsTableFilterComposer
    extends Composer<_$AppDatabase, $PhotoAttachmentsTable> {
  $$PhotoAttachmentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ocrText => $composableBuilder(
    column: $table.ocrText,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PhotoAttachmentsTableOrderingComposer
    extends Composer<_$AppDatabase, $PhotoAttachmentsTable> {
  $$PhotoAttachmentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerId => $composableBuilder(
    column: $table.ownerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownerType => $composableBuilder(
    column: $table.ownerType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get caption => $composableBuilder(
    column: $table.caption,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get hash => $composableBuilder(
    column: $table.hash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ocrText => $composableBuilder(
    column: $table.ocrText,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PhotoAttachmentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PhotoAttachmentsTable> {
  $$PhotoAttachmentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get ownerId =>
      $composableBuilder(column: $table.ownerId, builder: (column) => column);

  GeneratedColumn<String> get ownerType =>
      $composableBuilder(column: $table.ownerType, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get caption =>
      $composableBuilder(column: $table.caption, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<String> get hash =>
      $composableBuilder(column: $table.hash, builder: (column) => column);

  GeneratedColumn<String> get ocrText =>
      $composableBuilder(column: $table.ocrText, builder: (column) => column);
}

class $$PhotoAttachmentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PhotoAttachmentsTable,
          PhotoAttachmentRow,
          $$PhotoAttachmentsTableFilterComposer,
          $$PhotoAttachmentsTableOrderingComposer,
          $$PhotoAttachmentsTableAnnotationComposer,
          $$PhotoAttachmentsTableCreateCompanionBuilder,
          $$PhotoAttachmentsTableUpdateCompanionBuilder,
          (
            PhotoAttachmentRow,
            BaseReferences<
              _$AppDatabase,
              $PhotoAttachmentsTable,
              PhotoAttachmentRow
            >,
          ),
          PhotoAttachmentRow,
          PrefetchHooks Function()
        > {
  $$PhotoAttachmentsTableTableManager(
    _$AppDatabase db,
    $PhotoAttachmentsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PhotoAttachmentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PhotoAttachmentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PhotoAttachmentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ownerId = const Value.absent(),
                Value<String> ownerType = const Value.absent(),
                Value<String?> localPath = const Value.absent(),
                Value<String> caption = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<String?> hash = const Value.absent(),
                Value<String?> ocrText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoAttachmentsCompanion(
                id: id,
                ownerId: ownerId,
                ownerType: ownerType,
                localPath: localPath,
                caption: caption,
                createdAt: createdAt,
                hash: hash,
                ocrText: ocrText,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ownerId,
                required String ownerType,
                Value<String?> localPath = const Value.absent(),
                required String caption,
                required DateTime createdAt,
                Value<String?> hash = const Value.absent(),
                Value<String?> ocrText = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PhotoAttachmentsCompanion.insert(
                id: id,
                ownerId: ownerId,
                ownerType: ownerType,
                localPath: localPath,
                caption: caption,
                createdAt: createdAt,
                hash: hash,
                ocrText: ocrText,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PhotoAttachmentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PhotoAttachmentsTable,
      PhotoAttachmentRow,
      $$PhotoAttachmentsTableFilterComposer,
      $$PhotoAttachmentsTableOrderingComposer,
      $$PhotoAttachmentsTableAnnotationComposer,
      $$PhotoAttachmentsTableCreateCompanionBuilder,
      $$PhotoAttachmentsTableUpdateCompanionBuilder,
      (
        PhotoAttachmentRow,
        BaseReferences<
          _$AppDatabase,
          $PhotoAttachmentsTable,
          PhotoAttachmentRow
        >,
      ),
      PhotoAttachmentRow,
      PrefetchHooks Function()
    >;
typedef $$AssistantContextsTableCreateCompanionBuilder =
    AssistantContextsCompanion Function({
      Value<int> id,
      required String currentScreen,
      Value<String?> selectedItemId,
      Value<String?> selectedTemplateId,
      Value<String?> selectedRunId,
      Value<String?> selectedYardId,
      Value<String?> selectedReceiptId,
    });
typedef $$AssistantContextsTableUpdateCompanionBuilder =
    AssistantContextsCompanion Function({
      Value<int> id,
      Value<String> currentScreen,
      Value<String?> selectedItemId,
      Value<String?> selectedTemplateId,
      Value<String?> selectedRunId,
      Value<String?> selectedYardId,
      Value<String?> selectedReceiptId,
    });

final class $$AssistantContextsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AssistantContextsTable,
          AssistantContextRow
        > {
  $$AssistantContextsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$AssistantMessagesTable, List<AssistantMessageRow>>
  _assistantMessagesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.assistantMessages,
        aliasName: 'assistant_contexts__id__assistant_messages__context_id',
      );

  $$AssistantMessagesTableProcessedTableManager get assistantMessagesRefs {
    final manager = $$AssistantMessagesTableTableManager(
      $_db,
      $_db.assistantMessages,
    ).filter((f) => f.contextId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _assistantMessagesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$AssistantContextsTableFilterComposer
    extends Composer<_$AppDatabase, $AssistantContextsTable> {
  $$AssistantContextsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currentScreen => $composableBuilder(
    column: $table.currentScreen,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedItemId => $composableBuilder(
    column: $table.selectedItemId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedTemplateId => $composableBuilder(
    column: $table.selectedTemplateId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedRunId => $composableBuilder(
    column: $table.selectedRunId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedYardId => $composableBuilder(
    column: $table.selectedYardId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get selectedReceiptId => $composableBuilder(
    column: $table.selectedReceiptId,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> assistantMessagesRefs(
    Expression<bool> Function($$AssistantMessagesTableFilterComposer f) f,
  ) {
    final $$AssistantMessagesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.assistantMessages,
      getReferencedColumn: (t) => t.contextId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssistantMessagesTableFilterComposer(
            $db: $db,
            $table: $db.assistantMessages,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$AssistantContextsTableOrderingComposer
    extends Composer<_$AppDatabase, $AssistantContextsTable> {
  $$AssistantContextsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currentScreen => $composableBuilder(
    column: $table.currentScreen,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedItemId => $composableBuilder(
    column: $table.selectedItemId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedTemplateId => $composableBuilder(
    column: $table.selectedTemplateId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedRunId => $composableBuilder(
    column: $table.selectedRunId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedYardId => $composableBuilder(
    column: $table.selectedYardId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get selectedReceiptId => $composableBuilder(
    column: $table.selectedReceiptId,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AssistantContextsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssistantContextsTable> {
  $$AssistantContextsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get currentScreen => $composableBuilder(
    column: $table.currentScreen,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedItemId => $composableBuilder(
    column: $table.selectedItemId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedTemplateId => $composableBuilder(
    column: $table.selectedTemplateId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedRunId => $composableBuilder(
    column: $table.selectedRunId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedYardId => $composableBuilder(
    column: $table.selectedYardId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get selectedReceiptId => $composableBuilder(
    column: $table.selectedReceiptId,
    builder: (column) => column,
  );

  Expression<T> assistantMessagesRefs<T extends Object>(
    Expression<T> Function($$AssistantMessagesTableAnnotationComposer a) f,
  ) {
    final $$AssistantMessagesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.assistantMessages,
          getReferencedColumn: (t) => t.contextId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssistantMessagesTableAnnotationComposer(
                $db: $db,
                $table: $db.assistantMessages,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$AssistantContextsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssistantContextsTable,
          AssistantContextRow,
          $$AssistantContextsTableFilterComposer,
          $$AssistantContextsTableOrderingComposer,
          $$AssistantContextsTableAnnotationComposer,
          $$AssistantContextsTableCreateCompanionBuilder,
          $$AssistantContextsTableUpdateCompanionBuilder,
          (AssistantContextRow, $$AssistantContextsTableReferences),
          AssistantContextRow,
          PrefetchHooks Function({bool assistantMessagesRefs})
        > {
  $$AssistantContextsTableTableManager(
    _$AppDatabase db,
    $AssistantContextsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssistantContextsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssistantContextsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssistantContextsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> currentScreen = const Value.absent(),
                Value<String?> selectedItemId = const Value.absent(),
                Value<String?> selectedTemplateId = const Value.absent(),
                Value<String?> selectedRunId = const Value.absent(),
                Value<String?> selectedYardId = const Value.absent(),
                Value<String?> selectedReceiptId = const Value.absent(),
              }) => AssistantContextsCompanion(
                id: id,
                currentScreen: currentScreen,
                selectedItemId: selectedItemId,
                selectedTemplateId: selectedTemplateId,
                selectedRunId: selectedRunId,
                selectedYardId: selectedYardId,
                selectedReceiptId: selectedReceiptId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String currentScreen,
                Value<String?> selectedItemId = const Value.absent(),
                Value<String?> selectedTemplateId = const Value.absent(),
                Value<String?> selectedRunId = const Value.absent(),
                Value<String?> selectedYardId = const Value.absent(),
                Value<String?> selectedReceiptId = const Value.absent(),
              }) => AssistantContextsCompanion.insert(
                id: id,
                currentScreen: currentScreen,
                selectedItemId: selectedItemId,
                selectedTemplateId: selectedTemplateId,
                selectedRunId: selectedRunId,
                selectedYardId: selectedYardId,
                selectedReceiptId: selectedReceiptId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssistantContextsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({assistantMessagesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (assistantMessagesRefs) db.assistantMessages,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (assistantMessagesRefs)
                    await $_getPrefetchedData<
                      AssistantContextRow,
                      $AssistantContextsTable,
                      AssistantMessageRow
                    >(
                      currentTable: table,
                      referencedTable: $$AssistantContextsTableReferences
                          ._assistantMessagesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$AssistantContextsTableReferences(
                            db,
                            table,
                            p0,
                          ).assistantMessagesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.contextId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$AssistantContextsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssistantContextsTable,
      AssistantContextRow,
      $$AssistantContextsTableFilterComposer,
      $$AssistantContextsTableOrderingComposer,
      $$AssistantContextsTableAnnotationComposer,
      $$AssistantContextsTableCreateCompanionBuilder,
      $$AssistantContextsTableUpdateCompanionBuilder,
      (AssistantContextRow, $$AssistantContextsTableReferences),
      AssistantContextRow,
      PrefetchHooks Function({bool assistantMessagesRefs})
    >;
typedef $$AssistantMessagesTableCreateCompanionBuilder =
    AssistantMessagesCompanion Function({
      Value<int> id,
      Value<int?> contextId,
      required String role,
      required String message,
      required DateTime createdAt,
    });
typedef $$AssistantMessagesTableUpdateCompanionBuilder =
    AssistantMessagesCompanion Function({
      Value<int> id,
      Value<int?> contextId,
      Value<String> role,
      Value<String> message,
      Value<DateTime> createdAt,
    });

final class $$AssistantMessagesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $AssistantMessagesTable,
          AssistantMessageRow
        > {
  $$AssistantMessagesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $AssistantContextsTable _contextIdTable(_$AppDatabase db) => db
      .assistantContexts
      .createAlias('assistant_messages__context_id__assistant_contexts__id');

  $$AssistantContextsTableProcessedTableManager? get contextId {
    final $_column = $_itemColumn<int>('context_id');
    if ($_column == null) return null;
    final manager = $$AssistantContextsTableTableManager(
      $_db,
      $_db.assistantContexts,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_contextIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AssistantMessagesTableFilterComposer
    extends Composer<_$AppDatabase, $AssistantMessagesTable> {
  $$AssistantMessagesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$AssistantContextsTableFilterComposer get contextId {
    final $$AssistantContextsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contextId,
      referencedTable: $db.assistantContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssistantContextsTableFilterComposer(
            $db: $db,
            $table: $db.assistantContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssistantMessagesTableOrderingComposer
    extends Composer<_$AppDatabase, $AssistantMessagesTable> {
  $$AssistantMessagesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get message => $composableBuilder(
    column: $table.message,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$AssistantContextsTableOrderingComposer get contextId {
    final $$AssistantContextsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.contextId,
      referencedTable: $db.assistantContexts,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AssistantContextsTableOrderingComposer(
            $db: $db,
            $table: $db.assistantContexts,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AssistantMessagesTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssistantMessagesTable> {
  $$AssistantMessagesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get message =>
      $composableBuilder(column: $table.message, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$AssistantContextsTableAnnotationComposer get contextId {
    final $$AssistantContextsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.contextId,
          referencedTable: $db.assistantContexts,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$AssistantContextsTableAnnotationComposer(
                $db: $db,
                $table: $db.assistantContexts,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$AssistantMessagesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AssistantMessagesTable,
          AssistantMessageRow,
          $$AssistantMessagesTableFilterComposer,
          $$AssistantMessagesTableOrderingComposer,
          $$AssistantMessagesTableAnnotationComposer,
          $$AssistantMessagesTableCreateCompanionBuilder,
          $$AssistantMessagesTableUpdateCompanionBuilder,
          (AssistantMessageRow, $$AssistantMessagesTableReferences),
          AssistantMessageRow,
          PrefetchHooks Function({bool contextId})
        > {
  $$AssistantMessagesTableTableManager(
    _$AppDatabase db,
    $AssistantMessagesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssistantMessagesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssistantMessagesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssistantMessagesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> contextId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> message = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => AssistantMessagesCompanion(
                id: id,
                contextId: contextId,
                role: role,
                message: message,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int?> contextId = const Value.absent(),
                required String role,
                required String message,
                required DateTime createdAt,
              }) => AssistantMessagesCompanion.insert(
                id: id,
                contextId: contextId,
                role: role,
                message: message,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$AssistantMessagesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contextId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (contextId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.contextId,
                                referencedTable:
                                    $$AssistantMessagesTableReferences
                                        ._contextIdTable(db),
                                referencedColumn:
                                    $$AssistantMessagesTableReferences
                                        ._contextIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AssistantMessagesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AssistantMessagesTable,
      AssistantMessageRow,
      $$AssistantMessagesTableFilterComposer,
      $$AssistantMessagesTableOrderingComposer,
      $$AssistantMessagesTableAnnotationComposer,
      $$AssistantMessagesTableCreateCompanionBuilder,
      $$AssistantMessagesTableUpdateCompanionBuilder,
      (AssistantMessageRow, $$AssistantMessagesTableReferences),
      AssistantMessageRow,
      PrefetchHooks Function({bool contextId})
    >;
typedef $$HomeBaseSettingsTableTableCreateCompanionBuilder =
    HomeBaseSettingsTableCompanion Function({
      required String id,
      required String label,
      required String address,
      required String cityStateZip,
      required double defaultFuelPrice,
      required String notes,
      Value<int> rowid,
    });
typedef $$HomeBaseSettingsTableTableUpdateCompanionBuilder =
    HomeBaseSettingsTableCompanion Function({
      Value<String> id,
      Value<String> label,
      Value<String> address,
      Value<String> cityStateZip,
      Value<double> defaultFuelPrice,
      Value<String> notes,
      Value<int> rowid,
    });

class $$HomeBaseSettingsTableTableFilterComposer
    extends Composer<_$AppDatabase, $HomeBaseSettingsTableTable> {
  $$HomeBaseSettingsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get defaultFuelPrice => $composableBuilder(
    column: $table.defaultFuelPrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$HomeBaseSettingsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $HomeBaseSettingsTableTable> {
  $$HomeBaseSettingsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get label => $composableBuilder(
    column: $table.label,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get defaultFuelPrice => $composableBuilder(
    column: $table.defaultFuelPrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HomeBaseSettingsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $HomeBaseSettingsTableTable> {
  $$HomeBaseSettingsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get cityStateZip => $composableBuilder(
    column: $table.cityStateZip,
    builder: (column) => column,
  );

  GeneratedColumn<double> get defaultFuelPrice => $composableBuilder(
    column: $table.defaultFuelPrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$HomeBaseSettingsTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HomeBaseSettingsTableTable,
          HomeBaseSettingsRow,
          $$HomeBaseSettingsTableTableFilterComposer,
          $$HomeBaseSettingsTableTableOrderingComposer,
          $$HomeBaseSettingsTableTableAnnotationComposer,
          $$HomeBaseSettingsTableTableCreateCompanionBuilder,
          $$HomeBaseSettingsTableTableUpdateCompanionBuilder,
          (
            HomeBaseSettingsRow,
            BaseReferences<
              _$AppDatabase,
              $HomeBaseSettingsTableTable,
              HomeBaseSettingsRow
            >,
          ),
          HomeBaseSettingsRow,
          PrefetchHooks Function()
        > {
  $$HomeBaseSettingsTableTableTableManager(
    _$AppDatabase db,
    $HomeBaseSettingsTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HomeBaseSettingsTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$HomeBaseSettingsTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$HomeBaseSettingsTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> label = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> cityStateZip = const Value.absent(),
                Value<double> defaultFuelPrice = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => HomeBaseSettingsTableCompanion(
                id: id,
                label: label,
                address: address,
                cityStateZip: cityStateZip,
                defaultFuelPrice: defaultFuelPrice,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String label,
                required String address,
                required String cityStateZip,
                required double defaultFuelPrice,
                required String notes,
                Value<int> rowid = const Value.absent(),
              }) => HomeBaseSettingsTableCompanion.insert(
                id: id,
                label: label,
                address: address,
                cityStateZip: cityStateZip,
                defaultFuelPrice: defaultFuelPrice,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$HomeBaseSettingsTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HomeBaseSettingsTableTable,
      HomeBaseSettingsRow,
      $$HomeBaseSettingsTableTableFilterComposer,
      $$HomeBaseSettingsTableTableOrderingComposer,
      $$HomeBaseSettingsTableTableAnnotationComposer,
      $$HomeBaseSettingsTableTableCreateCompanionBuilder,
      $$HomeBaseSettingsTableTableUpdateCompanionBuilder,
      (
        HomeBaseSettingsRow,
        BaseReferences<
          _$AppDatabase,
          $HomeBaseSettingsTableTable,
          HomeBaseSettingsRow
        >,
      ),
      HomeBaseSettingsRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$YardsTableTableManager get yards =>
      $$YardsTableTableManager(_db, _db.yards);
  $$YardPricesTableTableManager get yardPrices =>
      $$YardPricesTableTableManager(_db, _db.yardPrices);
  $$SearchSourcesTableTableManager get searchSources =>
      $$SearchSourcesTableTableManager(_db, _db.searchSources);
  $$SearchRulesTableTableManager get searchRules =>
      $$SearchRulesTableTableManager(_db, _db.searchRules);
  $$SearchRuleSourcesTableTableManager get searchRuleSources =>
      $$SearchRuleSourcesTableTableManager(_db, _db.searchRuleSources);
  $$NotificationSettingsTableTableTableManager get notificationSettingsTable =>
      $$NotificationSettingsTableTableTableManager(
        _db,
        _db.notificationSettingsTable,
      );
  $$ObjectTemplatesTableTableManager get objectTemplates =>
      $$ObjectTemplatesTableTableManager(_db, _db.objectTemplates);
  $$ScrapItemsTableTableManager get scrapItems =>
      $$ScrapItemsTableTableManager(_db, _db.scrapItems);
  $$RunPlansTableTableManager get runPlans =>
      $$RunPlansTableTableManager(_db, _db.runPlans);
  $$RunPlanItemsTableTableManager get runPlanItems =>
      $$RunPlanItemsTableTableManager(_db, _db.runPlanItems);
  $$ReceiptsTableTableManager get receipts =>
      $$ReceiptsTableTableManager(_db, _db.receipts);
  $$PhotoAttachmentsTableTableManager get photoAttachments =>
      $$PhotoAttachmentsTableTableManager(_db, _db.photoAttachments);
  $$AssistantContextsTableTableManager get assistantContexts =>
      $$AssistantContextsTableTableManager(_db, _db.assistantContexts);
  $$AssistantMessagesTableTableManager get assistantMessages =>
      $$AssistantMessagesTableTableManager(_db, _db.assistantMessages);
  $$HomeBaseSettingsTableTableTableManager get homeBaseSettingsTable =>
      $$HomeBaseSettingsTableTableTableManager(_db, _db.homeBaseSettingsTable);
}
