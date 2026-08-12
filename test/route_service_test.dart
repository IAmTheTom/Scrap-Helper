import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/main.dart';

void main() {
  const service = RouteService();
  late HomeBaseSettings home;
  late Vehicle vehicle;
  late Yard preferredYard;

  setUp(() {
    home = HomeBaseSettings(
      id: 'home',
      label: 'Home Base',
      address: '10 Home St',
      cityStateZip: 'Vancouver, WA 98660',
      defaultFuelPrice: 4.25,
      notes: '',
    );
    vehicle = Vehicle(
      id: 'vehicle',
      name: 'Test Truck',
      type: 'Truck',
      mpg: 20,
      cargoLength: 72,
      cargoWidth: 48,
      cargoHeight: 24,
      payloadLimit: 1000,
      fullCargo: 2,
      largeUpright: 4,
      medium: 8,
      notes: '',
    );
    preferredYard = Yard(
      id: 'preferred',
      name: 'Preferred Yard',
      address: '90 Yard Rd',
      cityStateZip: 'Portland, OR 97201',
      phone: '',
      hours: '',
      notes: '',
      preferred: true,
    );
  });

  test('builds home to pickup to home route', () {
    final item = _item('one', Destination.home, '20 Pickup Ave');
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([item.id]),
      items: [item],
      yards: [preferredYard],
      vehicle: vehicle,
    );

    expect(plan.stops.map((stop) => stop.type), [
      RouteStopType.home,
      RouteStopType.pickup,
      RouteStopType.home,
    ]);
    expect(plan.stops.last.address, '10 Home St, Vancouver, WA 98660');
    expect(plan.summary, contains('using Test Truck'));
  });

  test('builds home to pickup to preferred yard route', () {
    final item = _item('one', Destination.yard, '20 Pickup Ave');
    final otherYard = Yard(
      id: 'other',
      name: 'Other Yard',
      address: '1 Other Rd',
      cityStateZip: 'Vancouver, WA',
      phone: '',
      hours: '',
      notes: '',
      preferred: false,
    );
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([item.id]),
      items: [item],
      yards: [otherYard, preferredYard],
    );

    expect(plan.stops.last.type, RouteStopType.yard);
    expect(plan.stops.last.label, 'Preferred Yard');
    expect(plan.stops.last.address, '90 Yard Rd, Portland, OR 97201');
  });

  test('preserves active run order for multiple pickups', () {
    final first = _item('first', Destination.home, '1 First St');
    final second = _item('second', Destination.home, '2 Second St');
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([second.id, first.id]),
      items: [first, second],
      yards: [preferredYard],
    );

    expect(
      plan.stops
          .where((stop) => stop.type == RouteStopType.pickup)
          .map((stop) => stop.itemId),
      ['second', 'first'],
    );
  });

  test('uses location name when pickup address is missing', () {
    final item = _item('one', Destination.home, '')
      ..locationName = 'Orchards neighborhood';
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([item.id]),
      items: [item],
      yards: [],
    );

    expect(plan.stops[1].address, 'Orchards neighborhood');
  });

  test('generated URL contains encoded origin, destination, and waypoints', () {
    final first = _item('first', Destination.yard, '1 First St');
    final second = _item('second', Destination.yard, '2 Second St');
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([first.id, second.id]),
      items: [first, second],
      yards: [preferredYard],
    );

    expect(
      plan.mapsUrl,
      contains('origin=10+Home+St%2C+Vancouver%2C+WA+98660'),
    );
    expect(
      plan.mapsUrl,
      contains('destination=90+Yard+Rd%2C+Portland%2C+OR+97201'),
    );
    expect(plan.mapsUrl, contains('waypoints=1+First+St%7C2+Second+St'));
  });

  test('mixed home and yard destinations drop at yard then return home', () {
    final homeItem = _item('home-item', Destination.home, '1 Home Item St');
    final yardItem = _item('yard-item', Destination.either, '2 Yard Item St');
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([homeItem.id, yardItem.id]),
      items: [homeItem, yardItem],
      yards: [preferredYard],
    );

    expect(plan.stops[plan.stops.length - 2].type, RouteStopType.yard);
    expect(plan.stops.last.type, RouteStopType.home);
  });

  test('empty active run returns useful result without maps URL', () {
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([]),
      items: [],
      yards: [preferredYard],
    );

    expect(plan.canHandOff, isFalse);
    expect(plan.mapsUrl, isNull);
    expect(plan.summary, contains('no pickups'));
    expect(plan.message, contains('Add at least one item'));
  });

  test('missing pickup location blocks an unusable route URL', () {
    final item = _item('one', Destination.home, '')..locationName = '';
    final plan = service.buildPlan(
      homeBase: home,
      run: _run([item.id]),
      items: [item],
      yards: [preferredYard],
    );

    expect(plan.canHandOff, isFalse);
    expect(plan.message, contains('pickup address or location'));
  });
}

RunPlan _run(List<String> itemIds) => RunPlan(
  id: 'run',
  name: 'Test Run',
  vehicleId: 'vehicle',
  itemIds: itemIds,
);

ScrapItem _item(String id, Destination destination, String pickupAddress) =>
    ScrapItem(
      id: id,
      title: 'Item $id',
      templateId: 'template',
      pickupAddress: pickupAddress,
      locationName: 'Fallback location',
      miles: 1,
      timeWindow: '',
      destination: destination,
      status: ItemStatus.claimed,
      notes: '',
      source: 'Test',
    );
