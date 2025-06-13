import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/motion_scheme.dart';

import 'm3e_floating_action_button_theme_data.dart';

class M3ETheme extends ThemeExtension<M3ETheme> {
  const M3ETheme({this.floatingActionButtonTheme})
    : motionScheme = const M3EMotionScheme();

  final MotionScheme motionScheme;
  final M3EFloatingActionButtonThemeData? floatingActionButtonTheme;

  @override
  M3ETheme copyWith({
    M3EFloatingActionButtonThemeData? floatingActionButtonTheme,
  }) {
    return M3ETheme(
      floatingActionButtonTheme:
          floatingActionButtonTheme ?? this.floatingActionButtonTheme,
    );
  }

  @override
  M3ETheme lerp(M3ETheme? other, double t) {
    if (other == null || identical(this, other)) return this;
    return M3ETheme(
      floatingActionButtonTheme: floatingActionButtonTheme?.lerp(
        other.floatingActionButtonTheme,
        t,
      ),
    );
  }
}
