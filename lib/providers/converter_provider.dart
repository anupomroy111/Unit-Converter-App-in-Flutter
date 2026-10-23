import 'package:flutter/foundation.dart';

import '../data/unit_catalog.dart';
import '../models/conversion_category.dart';
import '../models/unit.dart';

/// Holds every piece of state of the converter and notifies the UI whenever
/// something changes (category, input value, selected units).
///
/// The conversion itself is derived on the fly in [result], which is what
/// makes the result update in real time while the user types.
class ConverterProvider extends ChangeNotifier {
  ConverterProvider() {
    _applyCategory(UnitCatalog.length);
  }

  ConversionCategory _category = UnitCatalog.length;
  String _fromUnitName = UnitCatalog.length.defaultFrom;
  String _toUnitName = UnitCatalog.length.defaultTo;
  double? _inputValue;

  /// The active category (Length, Weight or Temperature).
  ConversionCategory get category => _category;

  /// Every unit of the active category.
  List<Unit> get units => _category.units;

  /// Name of the unit selected in the "From" dropdown.
  String get fromUnitName => _fromUnitName;

  /// Name of the unit selected in the "To" dropdown.
  String get toUnitName => _toUnitName;

  /// The unit selected in the "From" dropdown.
  Unit get fromUnit => _category.unitByName(_fromUnitName);

  /// The unit selected in the "To" dropdown.
  Unit get toUnit => _category.unitByName(_toUnitName);

  /// The number currently entered by the user, `null` when the field is empty.
  double? get inputValue => _inputValue;

  /// The live conversion result, `null` while no valid number is entered.
  double? get result {
    final value = _inputValue;
    if (value == null) return null;
    return toUnit.fromBase(fromUnit.toBase(value));
  }

  /// Switches to another category and resets the units to its defaults.
  void setCategory(ConversionCategory next) {
    if (next.id == _category.id) return;
    _applyCategory(next);
    notifyListeners();
  }

  /// Stores the raw text of the input field and keeps the valid number.
  void setInputValue(String? raw) {
    final text = (raw ?? '').trim();
    final parsed = text.isEmpty ? null : double.tryParse(text);
    if (parsed == _inputValue) return;
    _inputValue = parsed;
    notifyListeners();
  }

  /// Selects the unit of the "From" dropdown.
  void setFromUnit(String name) {
    if (name == _fromUnitName) return;
    _fromUnitName = name;
    notifyListeners();
  }

  /// Selects the unit of the "To" dropdown.
  void setToUnit(String name) {
    if (name == _toUnitName) return;
    _toUnitName = name;
    notifyListeners();
  }

  /// Swaps the source and the target unit.
  void swapUnits() {
    final previousFrom = _fromUnitName;
    _fromUnitName = _toUnitName;
    _toUnitName = previousFrom;
    notifyListeners();
  }

  void _applyCategory(ConversionCategory next) {
    _category = next;
    _fromUnitName = next.defaultFrom;
    _toUnitName = next.defaultTo;
  }
}
