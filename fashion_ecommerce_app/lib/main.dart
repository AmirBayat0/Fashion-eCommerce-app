import 'package:flutter/material.dart';

import '../utils/app_theme.dart';
import 'main_wrapper.dart';

void main() => runApp(
      MaterialApp(
        theme: AppTheme.appTheme,
        debugShowCheckedModeBanner: false,
        home: const MainWrapper(),
      ),
    );
