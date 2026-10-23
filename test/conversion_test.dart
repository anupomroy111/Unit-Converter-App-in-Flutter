import 'package:flutter_test/flutter_test.dart';
import 'package:unit_converter/data/unit_catalog.dart';
import 'package:unit_converter/providers/converter_provider.dart';

void main() {
  group('Length conversion', () {
    test('meter to kilometer', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.length)
        ..setFromUnit('Meter')
        ..setToUnit('Kilometer')
        ..setInputValue('10');

      expect(converter.result, closeTo(0.01, 1e-9));
    });

    test('kilometer to meter', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.length)
        ..setFromUnit('Kilometer')
        ..setToUnit('Meter')
        ..setInputValue('10');

      expect(converter.result, closeTo(10000, 1e-9));
    });

    test('mile to foot', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.length)
        ..setFromUnit('Mile')
        ..setToUnit('Foot')
        ..setInputValue('1');

      expect(converter.result, closeTo(5280, 1e-6));
    });
  });

  group('Weight conversion', () {
    test('gram to kilogram', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.weight)
        ..setFromUnit('Gram')
        ..setToUnit('Kilogram')
        ..setInputValue('500');

      expect(converter.result, closeTo(0.5, 1e-9));
    });

    test('kilogram to gram', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.weight)
        ..setFromUnit('Kilogram')
        ..setToUnit('Gram')
        ..setInputValue('2');

      expect(converter.result, closeTo(2000, 1e-9));
    });

    test('pound to kilogram', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.weight)
        ..setFromUnit('Pound')
        ..setToUnit('Kilogram')
        ..setInputValue('1');

      expect(converter.result, closeTo(0.45359237, 1e-9));
    });
  });

  group('Temperature conversion', () {
    test('celsius to fahrenheit', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.temperature)
        ..setFromUnit('Celsius')
        ..setToUnit('Fahrenheit')
        ..setInputValue('100');

      expect(converter.result, closeTo(212, 1e-9));
    });

    test('fahrenheit to celsius', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.temperature)
        ..setFromUnit('Fahrenheit')
        ..setToUnit('Celsius')
        ..setInputValue('32');

      expect(converter.result, closeTo(0, 1e-9));
    });

    test('celsius to kelvin', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.temperature)
        ..setFromUnit('Celsius')
        ..setToUnit('Kelvin')
        ..setInputValue('0');

      expect(converter.result, closeTo(273.15, 1e-9));
    });
  });

  group('Converter behaviour', () {
    test('result is null while the input is empty', () {
      final converter = ConverterProvider();

      expect(converter.result, isNull);
    });

    test('swapping the units keeps the value and inverts the result', () {
      final converter = ConverterProvider()
        ..setCategory(UnitCatalog.length)
        ..setFromUnit('Kilometer')
        ..setToUnit('Meter')
        ..setInputValue('10')
        ..swapUnits();

      expect(converter.fromUnitName, 'Meter');
      expect(converter.toUnitName, 'Kilometer');
      expect(converter.result, closeTo(0.01, 1e-9));
    });

    test('changing the category resets the units to the defaults', () {
      final converter = ConverterProvider()
        ..setFromUnit('Mile')
        ..setCategory(UnitCatalog.weight);

      expect(converter.fromUnitName, UnitCatalog.weight.defaultFrom);
      expect(converter.toUnitName, UnitCatalog.weight.defaultTo);
    });
  });
}
