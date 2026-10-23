import '../models/conversion_category.dart';
import '../models/unit.dart';

/// Static catalogue of every conversion category supported by the app.
///
/// Keeping the catalogue in one place makes it easy to add a new category or a
/// new unit without touching the UI or the state management layer.
class UnitCatalog {
  const UnitCatalog._();

  /// Length units, based on the meter.
  static const ConversionCategory length = ConversionCategory(
    id: 'length',
    label: 'Length',
    baseUnitLabel: 'Meter',
    defaultFrom: 'Meter',
    defaultTo: 'Kilometer',
    units: [
      Unit(name: 'Meter', symbol: 'm', factor: 1),
      Unit(name: 'Kilometer', symbol: 'km', factor: 1000),
      Unit(name: 'Centimeter', symbol: 'cm', factor: 0.01),
      Unit(name: 'Millimeter', symbol: 'mm', factor: 0.001),
      Unit(name: 'Mile', symbol: 'mi', factor: 1609.344),
      Unit(name: 'Yard', symbol: 'yd', factor: 0.9144),
      Unit(name: 'Foot', symbol: 'ft', factor: 0.3048),
      Unit(name: 'Inch', symbol: 'in', factor: 0.0254),
    ],
  );

  /// Weight units, based on the kilogram.
  static const ConversionCategory weight = ConversionCategory(
    id: 'weight',
    label: 'Weight',
    baseUnitLabel: 'Kilogram',
    defaultFrom: 'Kilogram',
    defaultTo: 'Gram',
    units: [
      Unit(name: 'Kilogram', symbol: 'kg', factor: 1),
      Unit(name: 'Gram', symbol: 'g', factor: 0.001),
      Unit(name: 'Milligram', symbol: 'mg', factor: 0.000001),
      Unit(name: 'Pound', symbol: 'lb', factor: 0.45359237),
      Unit(name: 'Ounce', symbol: 'oz', factor: 0.028349523125),
      Unit(name: 'Stone', symbol: 'st', factor: 6.35029318),
      Unit(name: 'Metric Ton', symbol: 't', factor: 1000),
    ],
  );

  /// Temperature units, based on the degree Celsius.
  static const ConversionCategory temperature = ConversionCategory(
    id: 'temperature',
    label: 'Temp',
    baseUnitLabel: 'Celsius',
    defaultFrom: 'Celsius',
    defaultTo: 'Fahrenheit',
    units: [
      Unit(name: 'Celsius', symbol: '°C', factor: 1),
      Unit(name: 'Fahrenheit', symbol: '°F', factor: 5 / 9, offset: -160 / 9),
      Unit(name: 'Kelvin', symbol: 'K', factor: 1, offset: -273.15),
    ],
  );

  /// The categories in the order they appear in the tab bar.
  static const List<ConversionCategory> all = [length, weight, temperature];
}
