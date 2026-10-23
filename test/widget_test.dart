import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/app.dart';

void main() {
  testWidgets('shows the converter screen with the default units', (
    tester,
  ) async {
    await tester.pumpWidget(const UnitConverterApp());

    expect(find.text('Unit Converter'), findsOneWidget);
    expect(find.text('Length'), findsOneWidget);
    expect(find.text('Weight'), findsOneWidget);
    expect(find.text('Temp'), findsOneWidget);
    expect(find.text('Meter'), findsOneWidget);
    expect(find.text('Kilometer'), findsOneWidget);
  });

  testWidgets('converts the entered value in real time', (tester) async {
    await tester.pumpWidget(const UnitConverterApp());

    await tester.enterText(find.byType(TextField), '25');
    await tester.pump();

    // 25 Meter -> 0.025 Kilometer
    expect(find.text('0.025'), findsOneWidget);
    expect(find.text('25 Meter = 0.025 Kilometer'), findsOneWidget);
  });

  testWidgets('swap button exchanges the source and target unit', (
    tester,
  ) async {
    await tester.pumpWidget(const UnitConverterApp());

    await tester.enterText(find.byType(TextField), '10');
    await tester.pump();
    await tester.tap(find.byIcon(Icons.swap_horiz_rounded));
    await tester.pump();

    // 10 Kilometer -> 10000 Meter
    expect(find.text('10000'), findsOneWidget);
    expect(find.text('10 Kilometer = 10000 Meter'), findsOneWidget);
  });

  testWidgets('switching the tab loads the units of that category', (
    tester,
  ) async {
    await tester.pumpWidget(const UnitConverterApp());

    await tester.tap(find.text('Temp'));
    await tester.pumpAndSettle();

    // Celsius and Fahrenheit are the default source and target units.
    expect(find.text('Celsius'), findsOneWidget);
    expect(find.text('Fahrenheit'), findsOneWidget);

    // Kelvin is only rendered once the target dropdown is opened.
    await tester.tap(find.byType(DropdownButton<String>).last);
    await tester.pumpAndSettle();

    expect(find.text('Kelvin'), findsOneWidget);
  });
}
