import 'package:flutter/material.dart';

import '../theme/app_theme.dart';

/// Round button that swaps the "From" and "To" units.
class SwapButton extends StatelessWidget {
  const SwapButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: AppTheme.swapButtonSize,
        height: AppTheme.swapButtonSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.primary,
          boxShadow: [
            BoxShadow(
              color: AppTheme.primary.withValues(alpha: 0.35),
              blurRadius: 14,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: const Icon(
            Icons.swap_horiz_rounded,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }
}
