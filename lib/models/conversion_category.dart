import 'unit.dart';

/// A group of interchangeable units, e.g. Length, Weight or Temperature.
class ConversionCategory {
  const ConversionCategory({
    required this.id,
    required this.label,
    required this.baseUnitLabel,
    required this.units,
    required this.defaultFrom,
    required this.defaultTo,
  });

  /// Stable identifier, used to detect the active tab.
  final String id;

  /// Short label shown on the tab, e.g. `Length`.
  final String label;

  /// Name of the unit every conversion of this category is based on.
  final String baseUnitLabel;

  /// All units that belong to this category.
  final List<Unit> units;

  /// Unit selected in the "From" dropdown by default.
  final String defaultFrom;

  /// Unit selected in the "To" dropdown by default.
  final String defaultTo;

  /// Looks up a unit by its name and falls back to the first unit of the
  /// category when the name is unknown.
  Unit unitByName(String name) =>
      units.firstWhere((unit) => unit.name == name, orElse: () => units.first);
}
