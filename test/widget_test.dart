import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paws_at_home/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('shows the stay page and switches language', (tester) async {
    await tester.pumpWidget(const PawApp());
    await tester.pump();

    expect(find.text('Paws at Home'), findsWidgets);
    expect(find.textContaining('कुत्ता'), findsWidgets);

    await tester.tap(find.text('ਪੰ'));
    await tester.pump();

    expect(find.textContaining('ਕੁੱਤਾ'), findsWidgets);

    await tester.tap(find.text('EN'));
    await tester.pump();

    expect(find.textContaining('dog or cat'), findsOneWidget);
  });
}
