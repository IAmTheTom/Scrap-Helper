part of '../main.dart';

typedef UriLauncher = Future<bool> Function(Uri uri);

class ExternalLinkService {
  const ExternalLinkService({this._launcher = launchUrl});

  final UriLauncher _launcher;

  Future<bool> open(String? value) async {
    final uri = Uri.tryParse(value?.trim() ?? '');
    if (uri == null || !const {'http', 'https'}.contains(uri.scheme)) {
      return false;
    }
    return _launcher(uri);
  }

  Future<void> openSourceListing(BuildContext context, ScrapItem item) async {
    if (item.sourceUrl?.trim().isEmpty ?? true) {
      _message(context, 'No source listing URL saved for this item.');
      return;
    }
    if (!await open(item.sourceUrl) && context.mounted) {
      _message(context, 'Could not open the source listing URL.');
    }
  }

  void _message(BuildContext context, String value) => ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(value)));
}
