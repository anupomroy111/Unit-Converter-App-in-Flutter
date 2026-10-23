import 'package:flutter/material.dart';

import '../models/conversion_category.dart';
import '../theme/app_theme.dart';

/// Segmented tab bar that switches between the conversion categories.
///
/// The active tab is highlighted with the primary colour, the remaining tabs
/// stay neutral, which mirrors the reference design of the assignment.
class CategoryTabBar extends StatelessWidget {
  const CategoryTabBar({
    super.key,
    required this.categories,
    required this.selectedId,
    required this.onSelected,
  });

  final List<ConversionCategory> categories;
  final String selectedId;
  final ValueChanged<ConversionCategory> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.border),
      ),
      child: Row(
        children: [
          for (final category in categories)
            Expanded(
              child: _TabButton(
                label: category.label,
                isSelected: category.id == selectedId,
                onTap: () => onSelected(category),
              ),
            ),
        ],
      ),
    );
  }
}

class _TabButton extends StatelessWidget {
  const _TabButton({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      curve: Curves.easeOut,
      height: 38,
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(9),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 14.5,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? Colors.white : const Color(0xFF5B6577),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
