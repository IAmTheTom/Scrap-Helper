import 'package:flutter_test/flutter_test.dart';
import 'package:scrap_helper/app.dart';

void main() {
  testWidgets('shows foundation status', (tester) async {
    await tester.pumpWidget(const ScrapHelperApp());
    expect(find.text('Scrap Helper'), findsOneWidget);
    expect(find.textContaining('Core foundation installed'), findsOneWidget);
  });
}
