import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../utils/formatters.dart';

/// Card that shows the live conversion result.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.result,
    required this.resultSymbol,
    required this.resultUnitName,
    required this.inputValue,
    required this.fromUnitName,
  });

  /// Converted value, `null` while the input is empty.
  final double? result;

  /// Symbol of the target unit, e.g. `km`.
  final String resultSymbol;

  /// Name of the target unit, e.g. `Kilometer`.
  final String resultUnitName;

  /// Value entered by the user, `null` while the input is empty.
  final double? inputValue;

  /// Name of the source unit.
  final String fromUnitName;

  @override
  Widget build(BuildContext context) {
    final value = result;
    final formatted = value == null ? '—' : formatNumber(value);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(18, 14, 18, 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Result:',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppTheme.label,
            ),
          ),
          const SizedBox(height: 6),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Flexible(
                child: Text(
                  formatted,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.primary,
                    height: 1.15,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              if (value != null)
                Text(
                  resultSymbol,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.primary.withValues(alpha: 0.78),
                  ),
                ),
            ],
          ),
          if (inputValue != null) ...[
            const SizedBox(height: 4),
            Text(
              '${formatInput(inputValue!)} $fromUnitName = '
              '$formatted $resultUnitName',
              style: const TextStyle(
                fontSize: 12.5,
                color: Color(0xFF9AA3B2),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
