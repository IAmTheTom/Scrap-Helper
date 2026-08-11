part of '../main.dart';

class CameraService {
  const CameraService();

  void pending(BuildContext context, String kind) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$kind photo: camera integration pending.')),
    );
  }
}
