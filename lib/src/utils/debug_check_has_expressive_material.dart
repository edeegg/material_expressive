import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/m3_expressive_theme.dart';

bool debugCheckHasExpressiveMaterial(BuildContext context) {
  assert(debugCheckHasMaterial(context));
  assert(() {
    final hasExpressiveTheme = Theme.of(context).extension<M3ETheme>() != null;
    if (!hasExpressiveTheme) {
      throw FlutterError.fromParts([
        ErrorSummary('No M3ExpressiveTheme found within the context.'),
        ErrorDescription(
          '${context.widget.runtimeType} widgets require for the '
          'M3ExpressiveTheme to be provided in the ThemeData extensions.',
        ),
        ErrorHint(
          'To fix this, ensure that your ThemeData includes '
          'M3ExpressiveTheme in its theme extensions.',
        ),
        ...context.describeMissingAncestor(expectedAncestorType: M3ETheme),
      ]);
    }
    return true;
  }());
  return true;
}
