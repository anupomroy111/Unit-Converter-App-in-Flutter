/// A single measurable unit inside a conversion category.
///
/// The conversion towards the category base unit is expressed as:
///
/// ```text
/// baseValue = value * factor + offset
/// ```
///
/// Almost every unit is a pure scale change (`offset == 0`). Temperature needs
/// the offset because Fahrenheit and Kelvin do not start at zero the way
/// Celsius does.
class Unit {
  const Unit({
    required this.name,
    required this.symbol,
    required this.factor,
    this.offset = 0,
  });

  /// Human readable name, e.g. `Kilometer`.
  final String name;

  /// Short symbol rendered next to the result, e.g. `km`.
  final String symbol;

  /// Multiplier that scales a value into the category base unit.
  final double factor;

  /// Constant added after scaling, used by the temperature units.
  final double offset;

  /// Converts [value] from this unit into the category base unit.
  double toBase(double value) => value * factor + offset;

  /// Converts a [baseValue] from the category base unit into this unit.
  double fromBase(double baseValue) => (baseValue - offset) / factor;
}
