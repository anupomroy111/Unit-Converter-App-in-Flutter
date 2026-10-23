import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/converter_provider.dart';
import 'screens/converter_screen.dart';
import 'theme/app_theme.dart';

/// Root widget of the Unit Converter application.
///
/// The [ConverterProvider] is registered once here so that every screen and
/// widget below can read and update the conversion state.
class UnitConverterApp extends StatelessWidget {
  const UnitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ConverterProvider(),
      child: MaterialApp(
        title: 'Unit Converter',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        home: const ConverterScreen(),
      ),
    );
  }
}
