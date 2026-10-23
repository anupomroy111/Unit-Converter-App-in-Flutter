import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/unit_catalog.dart';
import '../providers/converter_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/category_tab_bar.dart';
import '../widgets/result_card.dart';
import '../widgets/swap_button.dart';
import '../widgets/unit_dropdown_field.dart';

/// Main screen of the app: category tabs, input field, unit pickers and the
/// live conversion result.
class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  final TextEditingController _valueController = TextEditingController();

  @override
  void dispose() {
    _valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => Navigator.of(context).maybePop(),
          tooltip: 'Back',
        ),
        title: const Text('Unit Converter'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 22, 20, 32),
          child: Consumer<ConverterProvider>(
            builder: (context, converter, _) {
              return Container(
                padding: const EdgeInsets.fromLTRB(18, 18, 18, 22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 22,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CategoryTabBar(
                      categories: UnitCatalog.all,
                      selectedId: converter.category.id,
                      onSelected: converter.setCategory,
                    ),
                    const SizedBox(height: 24),
                    _ValueField(
                      controller: _valueController,
                      onChanged: converter.setInputValue,
                    ),
                    const SizedBox(height: 24),
                    _UnitSelectors(converter: converter),
                    const SizedBox(height: 24),
                    ResultCard(
                      result: converter.result,
                      resultSymbol: converter.toUnit.symbol,
                      resultUnitName: converter.toUnit.name,
                      inputValue: converter.inputValue,
                      fromUnitName: converter.fromUnit.name,
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

/// Text field where the value to convert is entered.
class _ValueField extends StatelessWidget {
  const _ValueField({required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Enter Value',
          style: TextStyle(
            fontSize: 12.5,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.3,
            color: AppTheme.label,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          onChanged: onChanged,
          keyboardType: const TextInputType.numberWithOptions(
            decimal: true,
            signed: true,
          ),
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: Color(0xFF1F2733),
          ),
          decoration: InputDecoration(
            hintText: 'e.g. 25',
            hintStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Color(0xFFB6BEC9),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: _border(AppTheme.border),
            enabledBorder: _border(AppTheme.border),
            focusedBorder: _border(AppTheme.primary, width: 1.4),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _border(Color color, {double width = 1}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: color, width: width),
    );
  }
}

/// "From" dropdown, swap button and "To" dropdown.
///
/// The swap button is layered on top of the two pickers so that it overlaps
/// the "From" field, exactly like the mock-up of the assignment.
class _UnitSelectors extends StatelessWidget {
  const _UnitSelectors({required this.converter});

  final ConverterProvider converter;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            UnitDropdownField(
              label: 'From',
              value: converter.fromUnitName,
              units: converter.units,
              onChanged: converter.setFromUnit,
            ),
            const SizedBox(height: 22),
            UnitDropdownField(
              label: 'To',
              value: converter.toUnitName,
              units: converter.units,
              onChanged: converter.setToUnit,
            ),
          ],
        ),
        Positioned(
          top: 59,
          left: 0,
          right: 0,
          child: Center(child: SwapButton(onTap: converter.swapUnits)),
        ),
      ],
    );
  }
}
