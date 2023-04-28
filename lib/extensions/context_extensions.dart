import 'package:flutter/material.dart';

extension RounterContext on BuildContext {
  navigate(Widget screen) => Navigator.of(this).push(
        MaterialPageRoute(builder: (context) => screen),
      );

  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  Size get screenSize => MediaQuery.of(this).size;
}
