import 'package:adoption_animal/app/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders adoption app home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));
    await tester.pumpAndSettle();

    expect(find.text('台南市'), findsOneWidget);
    expect(find.text('領養代替購買'), findsOneWidget);
    expect(find.text('最新來的毛孩'), findsOneWidget);
    expect(find.text('首頁'), findsOneWidget);
  });
}
