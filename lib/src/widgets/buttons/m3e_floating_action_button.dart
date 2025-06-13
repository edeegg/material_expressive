import 'package:flutter/material.dart';
import 'package:material_expressive/src/theme/m3e_floating_action_button_theme_data.dart';

class M3EFloatingActionButton extends StatelessWidget {
  const M3EFloatingActionButton({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    required this.onPressed,
    super.key,
  }) : _floatingActionButtonType = _M3EFloatingActionButtonType.regular;

  const M3EFloatingActionButton.medium({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    required this.onPressed,
    super.key,
  }) : _floatingActionButtonType = _M3EFloatingActionButtonType.medium;

  const M3EFloatingActionButton.large({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    required this.onPressed,
    super.key,
  }) : _floatingActionButtonType = _M3EFloatingActionButtonType.large;

  /// The widget below this widget in the tree.
  ///
  /// Typically an [Icon].
  final Widget? child;

  /// Text that describes the action that will occur when the button is pressed.
  ///
  /// This text is displayed when the user long-presses on the button and is
  /// used for accessibility.
  final String? tooltip;

  /// The default foreground color for icons and text within the button.
  ///
  /// If this property is null, then the [FloatingActionButtonThemeData.foregroundColor]
  /// of [ThemeData.floatingActionButtonTheme] is used. If that property is also
  /// null, then the [ColorScheme.onPrimaryContainer] color of [ThemeData.colorScheme]
  /// is used. If [ThemeData.useMaterial3] is set to false, then the
  /// [ColorScheme.onSecondary] color of [ThemeData.colorScheme] is used.
  final Color? foregroundColor;

  /// The button's background color.
  ///
  /// If this property is null, then the [FloatingActionButtonThemeData.backgroundColor]
  /// of [ThemeData.floatingActionButtonTheme] is used. If that property is also
  /// null, then the [ColorScheme.primaryContainer] color of [ThemeData.colorScheme]
  /// is used. If [ThemeData.useMaterial3] is set to false, then the
  /// [ColorScheme.secondary] color of [ThemeData.colorScheme] is used.
  final Color? backgroundColor;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  final _M3EFloatingActionButtonType _floatingActionButtonType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final defaults = _FABDefaultsM3E(
      context,
      _floatingActionButtonType,
      child != null,
    );

    final foregroundColor =
        this.foregroundColor ??
        floatingActionButtonTheme.foregroundColor ??
        defaults.foregroundColor;
    final backgroundColor =
        this.backgroundColor ??
        floatingActionButtonTheme.backgroundColor ??
        defaults.backgroundColor;

    Widget result = RawMaterialButton(
      onPressed: onPressed,
      mouseCursor: _EffectiveMouseCursor(
        mouseCursor,
        floatingActionButtonTheme.mouseCursor,
      ),
      elevation: elevation,
      focusElevation: focusElevation,
      hoverElevation: hoverElevation,
      highlightElevation: highlightElevation,
      disabledElevation: disabledElevation,
      constraints: sizeConstraints,
      materialTapTargetSize: materialTapTargetSize,
      fillColor: backgroundColor,
      focusColor: focusColor,
      hoverColor: hoverColor,
      splashColor: splashColor,
      textStyle: extendedTextStyle,
      shape: shape,
      clipBehavior: clipBehavior,
      focusNode: focusNode,
      autofocus: autofocus,
      enableFeedback: enableFeedback,
      child: resolvedChild,
    );

    if (tooltip != null) {
      result = Tooltip(message: tooltip, child: result);
    }

    if (heroTag != null) {
      result = Hero(tag: heroTag!, child: result);
    }

    return MergeSemantics(child: result);
  }
}

enum _M3EFloatingActionButtonType { regular, medium, large, extended }

class _FABDefaultsM3E extends FloatingActionButtonThemeData {
  _FABDefaultsM3E(this.context, this.type, this.hasChild)
    : super(
        elevation: 6.0,
        focusElevation: 6.0,
        hoverElevation: 8.0,
        highlightElevation: 6.0,
        enableFeedback: true,
        sizeConstraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        largeSizeConstraints: const BoxConstraints.tightFor(
          width: 96.0,
          height: 96.0,
        ),
        extendedSizeConstraints: const BoxConstraints.tightFor(height: 56.0),
        extendedIconLabelSpacing: 8.0,
      );

  final mediumSizeConstraints = const BoxConstraints.tightFor(
    width: 80.0,
    height: 80.0,
  );

  final BuildContext context;
  final _M3EFloatingActionButtonType type;
  final bool hasChild;
  late final _colors = Theme.of(context).colorScheme;
  late final _textTheme = Theme.of(context).textTheme;

  bool get _isExtended => type == _M3EFloatingActionButtonType.extended;

  @override
  Color? get foregroundColor => _colors.onPrimaryContainer;

  @override
  Color? get backgroundColor => _colors.primaryContainer;

  @override
  Color? get splashColor => _colors.onPrimaryContainer.withValues(alpha: .1);

  @override
  Color? get focusColor => _colors.onPrimaryContainer.withValues(alpha: .1);

  @override
  Color? get hoverColor => _colors.onPrimaryContainer.withValues(alpha: .08);

  @override
  ShapeBorder? get shape => switch (type) {
    _M3EFloatingActionButtonType.regular => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
    _M3EFloatingActionButtonType.medium => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
    ),
    _M3EFloatingActionButtonType.large => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(28.0)),
    ),
    _M3EFloatingActionButtonType.extended => const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(16.0)),
    ),
  };

  @override
  double? get iconSize => switch (type) {
    _M3EFloatingActionButtonType.regular => 24.0,
    _M3EFloatingActionButtonType.medium => 28.0,
    _M3EFloatingActionButtonType.large => 36.0,
    _M3EFloatingActionButtonType.extended => 24.0,
  };

  @override
  EdgeInsetsGeometry? get extendedPadding => EdgeInsetsDirectional.only(
    start: hasChild && _isExtended ? 16.0 : 20.0,
    end: 20.0,
  );
  @override
  TextStyle? get extendedTextStyle => _textTheme.labelLarge;
}
