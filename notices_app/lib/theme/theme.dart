import 'package:flutter/material.dart';

final ThemeData theme = ThemeData();
final myTheme = ThemeData.dark()
    .copyWith(colorScheme: theme.colorScheme.copyWith(secondary: Colors.red));
