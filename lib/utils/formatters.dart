/// Formats a converted value for display.
///
/// Large and very small numbers switch to scientific notation, everything
/// else is printed with a maximum of [maxDecimals] decimals and without
/// trailing zeros (`0.025` instead of `0.025000`).
String formatNumber(double value, {int maxDecimals = 6}) {
  if (value == 0) return '0';

  final absolute = value.abs();
  if (absolute >= 1e12 || absolute < 1e-6) {
    return _formatExponential(value);
  }

  var text = value.toStringAsFixed(maxDecimals);
  if (text.contains('.')) {
    text = text.replaceFirst(RegExp(r'0+$'), '');
    text = text.replaceFirst(RegExp(r'\.$'), '');
  }
  return text;
}

/// Formats the raw text typed by the user for the result summary line.
String formatInput(double value) {
  if (value == value.roundToDouble() && value.abs() < 1e12) {
    return value.toStringAsFixed(0);
  }
  return formatNumber(value);
}

String _formatExponential(double value) {
  final text = value.toStringAsExponential(4);
  final parts = text.split('e');
  if (parts.length != 2) return text;

  var mantissa = parts[0];
  if (mantissa.contains('.')) {
    mantissa = mantissa.replaceFirst(RegExp(r'0+$'), '');
    mantissa = mantissa.replaceFirst(RegExp(r'\.$'), '');
  }
  return '${mantissa}e${parts[1]}';
}
