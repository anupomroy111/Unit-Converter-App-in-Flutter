import 'package:flutter/material.dart';

import '../models/unit.dart';
import '../theme/app_theme.dart';

/// Labelled dropdown that lets the user pick the source or target unit.
class UnitDropdownField extends StatelessWidget {
  const UnitDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.units,
    required this.onChanged,
  });

  /// Caption shown above the field, e.g. `From`.
  final String label;

  /// Currently selected unit name.
  final String value;

  /// Units the user can choose from.
  final List<Unit> units;

  /// Called with the name of the newly selected unit.
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _FieldLabel(label),
        const SizedBox(height: 8),
        Container(
          height: AppTheme.fieldHeight,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.border),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              isDense: true,
              borderRadius: BorderRadius.circular(12),
              dropdownColor: Colors.white,
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Color(0xFF7C8798),
              ),
              style: const TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.w500,
                color: Color(0xFF1F2733),
              ),
              items: [
                for (final unit in units)
                  DropdownMenuItem<String>(
                    value: unit.name,
                    child: Text(unit.name),
                  ),
              ],
              onChanged: (selected) {
                if (selected != null) onChanged(selected);
              },
            ),
          ),
        ),
      ],
    );
  }
}

/// Small muted caption used above the input and dropdown fields.
class _FieldLabel extends StatelessWidget {
  const _FieldLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 12.5,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.3,
        color: AppTheme.label,
      ),
    );
  }
}
