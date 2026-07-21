import 'package:file_picker/file_picker.dart';

abstract final class FileSelectionService {
  static Future<String?> selectBackup() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const <String>['json'],
    );
    return result?.files.single.path;
  }

  static Future<String?> selectAttachment() async {
    final result = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: const <String>['jpg', 'jpeg', 'png', 'webp', 'pdf'],
    );
    return result?.files.single.path;
  }
}
