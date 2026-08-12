part of '../main.dart';

class RouteService {
  const RouteService();

  RoutePlan buildActiveRun(ScrapprModel model) => buildPlan(
    homeBase: model.homeBase,
    run: model.run,
    items: model.items,
    yards: model.yards,
    vehicle: model.vehicle,
  );

  RoutePlan buildPlan({
    required HomeBaseSettings homeBase,
    required RunPlan run,
    required List<ScrapItem> items,
    required List<Yard> yards,
    Vehicle? vehicle,
  }) {
    final homeAddress = _joinedAddress(homeBase.address, homeBase.cityStateZip);
    final stops = <RouteStop>[
      RouteStop(
        label: homeBase.label,
        address: homeAddress,
        type: RouteStopType.home,
        notes: 'Route start',
      ),
    ];
    final runItems = <ScrapItem>[];
    for (final itemId in run.itemIds) {
      final matches = items.where((item) => item.id == itemId);
      if (matches.isNotEmpty) runItems.add(matches.first);
    }
    if (runItems.isEmpty) {
      return RoutePlan(
        stops: stops,
        mapsUrl: null,
        summary: '${run.name}: no pickups.',
        message:
            'Add at least one item to the active run before creating a route.',
      );
    }

    for (final item in runItems) {
      final address = item.pickupAddress.trim().isNotEmpty
          ? item.pickupAddress.trim()
          : item.locationName.trim();
      stops.add(
        RouteStop(
          label: item.title,
          address: address,
          type: RouteStopType.pickup,
          itemId: item.id,
          notes: destinationLabel(item.destination),
        ),
      );
    }

    final needsYard = runItems.any(
      (item) =>
          item.destination == Destination.yard ||
          item.destination == Destination.either,
    );
    final needsHomeReturn = runItems.any(
      (item) => item.destination == Destination.home,
    );
    final yard = needsYard ? _preferredYard(yards) : null;
    if (yard != null) {
      stops.add(
        RouteStop(
          label: yard.name,
          address: _joinedAddress(yard.address, yard.cityStateZip),
          type: RouteStopType.yard,
          notes: yard.preferred ? 'Preferred yard' : 'Yard drop',
        ),
      );
    }
    if (needsHomeReturn || (needsYard && yard == null)) {
      stops.add(
        RouteStop(
          label: homeBase.label,
          address: homeAddress,
          type: RouteStopType.home,
          notes: needsYard && yard == null
              ? 'Home return; no yard configured'
              : 'Home return',
        ),
      );
    }

    final mapsUrl = _mapsUrl(stops);
    final vehicleText = vehicle == null ? '' : ' using ${vehicle.name}';
    final summaryLines = <String>[
      '${run.name}$vehicleText - ${runItems.length} pickup${runItems.length == 1 ? '' : 's'}',
      for (var index = 0; index < stops.length; index++)
        '${index + 1}. ${stops[index].label}: ${stops[index].address}',
    ];
    final message = needsYard && yard == null
        ? 'No yard is configured. The route returns home after pickups.'
        : 'Route handoff ready. Full route optimization pending.';
    return RoutePlan(
      stops: stops,
      mapsUrl: mapsUrl,
      summary: summaryLines.join('\n'),
      message: message,
    );
  }

  Future<void> showHandoff(BuildContext context, ScrapprModel model) async {
    final plan = buildActiveRun(model);
    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: const Text('Route handoff'),
        content: SizedBox(
          width: 600,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(plan.message),
                const SizedBox(height: 12),
                SelectableText(plan.summary),
                if (plan.mapsUrl case final url?) ...[
                  const SizedBox(height: 12),
                  const Text('External Maps URL'),
                  SelectableText(url),
                ],
              ],
            ),
          ),
        ),
        actions: [
          if (plan.mapsUrl case final url?)
            TextButton.icon(
              onPressed: () async {
                await Clipboard.setData(ClipboardData(text: url));
                if (dialogContext.mounted) {
                  ScaffoldMessenger.of(dialogContext).showSnackBar(
                    const SnackBar(content: Text('Maps URL copied.')),
                  );
                }
              },
              icon: const Icon(Icons.copy),
              label: const Text('Copy URL'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  Yard? _preferredYard(List<Yard> yards) {
    if (yards.isEmpty) return null;
    return yards.firstWhere(
      (yard) => yard.preferred,
      orElse: () => yards.first,
    );
  }

  String _joinedAddress(String address, String cityStateZip) => [
    address.trim(),
    cityStateZip.trim(),
  ].where((part) => part.isNotEmpty).join(', ');

  String _mapsUrl(List<RouteStop> stops) {
    final origin = Uri.encodeQueryComponent(stops.first.address);
    final destination = Uri.encodeQueryComponent(stops.last.address);
    final waypoints = stops
        .skip(1)
        .take(stops.length - 2)
        .map((stop) => stop.address)
        .join('|');
    final buffer = StringBuffer(
      'https://www.google.com/maps/dir/?api=1&origin=$origin&destination=$destination&travelmode=driving',
    );
    if (waypoints.isNotEmpty) {
      buffer.write('&waypoints=${Uri.encodeQueryComponent(waypoints)}');
    }
    return buffer.toString();
  }
}
