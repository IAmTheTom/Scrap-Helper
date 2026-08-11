part of '../main.dart';

class RouteService {
  const RouteService();

  void pending(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Maps/routing integration pending.')),
    );
  }
}
