// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:adoption_animal/main.dart';

void main() {
  testWidgets('renders adoption app home screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('台南市'), findsOneWidget);
    expect(find.text('領養代替購買'), findsOneWidget);
    expect(find.text('最新來的毛孩'), findsOneWidget);
    expect(find.text('首頁'), findsOneWidget);
  });
}
