import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/motion_scheme.dart';

class M3ETheme extends ThemeExtension<M3ETheme> {
  const M3ETheme({required this.colorScheme})
    : motionScheme = const M3EMotionScheme();

  factory M3ETheme.light({ColorScheme? colorScheme}) {
    return M3ETheme(colorScheme: colorScheme ?? ColorScheme.light());
  }

  factory M3ETheme.dark({ColorScheme? colorScheme}) {
    return M3ETheme(colorScheme: colorScheme ?? ColorScheme.dark());
  }

  final ColorScheme colorScheme;
  final MotionScheme motionScheme;

  @override
  M3ETheme copyWith({ColorScheme? colorScheme, MotionScheme? motionScheme}) {
    return M3ETheme(colorScheme: colorScheme ?? this.colorScheme);
  }

  @override
  M3ETheme lerp(M3ETheme? other, double t) {
    if (other == null) return this;
    return M3ETheme(
      colorScheme: ColorScheme.lerp(colorScheme, other.colorScheme, t),
    );
  }
}
