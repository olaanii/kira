import 'package:flutter_test/flutter_test.dart';

import 'package:kira/app/kira_app.dart';

void main() {
  testWidgets('shows onboarding then opens discovery screen',
      (WidgetTester tester) async {
    await tester.pumpWidget(const KiraApp());

    expect(find.text('Your Food,\nDecoded By AI'), findsOneWidget);
    expect(find.text('Get Started'), findsOneWidget);

    await tester.tap(find.text('Get Started'));
    await tester.pumpAndSettle();

    expect(find.text('Trending Recipes'), findsOneWidget);
    expect(find.text('Quinoa Veggie Bowl'), findsOneWidget);
  });
}
