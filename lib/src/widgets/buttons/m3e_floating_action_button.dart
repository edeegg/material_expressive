import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_expressive/src/theme/m3e_theme.dart';

class _DefaultHeroTag {
  const _DefaultHeroTag();

  @override
  String toString() => '<default M3EFloatingActionButton tag>';
}

enum _M3EFloatingActionButtonType { regular, medium, large }

class M3EFloatingActionButton extends StatelessWidget {
  const M3EFloatingActionButton({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.isExtended = false,
    this.enableFeedback,
    super.key,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EFloatingActionButtonType.regular,
       extendedIconLabelSpacing = null,
       extendedPadding = null,
       extendedTextStyle = null;

  const M3EFloatingActionButton.medium({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.enableFeedback,
    super.key,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EFloatingActionButtonType.medium,
       isExtended = false,
       extendedIconLabelSpacing = null,
       extendedPadding = null,
       extendedTextStyle = null;

  const M3EFloatingActionButton.large({
    this.child,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.focusColor,
    this.hoverColor,
    this.splashColor,
    this.heroTag = const _DefaultHeroTag(),
    this.elevation,
    this.focusElevation,
    this.hoverElevation,
    this.highlightElevation,
    this.disabledElevation,
    required this.onPressed,
    this.mouseCursor,
    this.shape,
    this.clipBehavior = Clip.none,
    this.focusNode,
    this.autofocus = false,
    this.materialTapTargetSize,
    this.enableFeedback,
    super.key,
  }) : assert(elevation == null || elevation >= 0.0),
       assert(focusElevation == null || focusElevation >= 0.0),
       assert(hoverElevation == null || hoverElevation >= 0.0),
       assert(highlightElevation == null || highlightElevation >= 0.0),
       assert(disabledElevation == null || disabledElevation >= 0.0),
       _floatingActionButtonType = _M3EFloatingActionButtonType.large,
       isExtended = false,
       extendedIconLabelSpacing = null,
       extendedPadding = null,
       extendedTextStyle = null;

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

  /// The color to use for filling the button when the button has input focus.
  ///
  /// In Material3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.1.
  /// In Material 2, it defaults to [ThemeData.focusColor] for the current theme.
  final Color? focusColor;

  /// The color to use for filling the button when the button has a pointer
  /// hovering over it.
  ///
  /// Defaults to [ThemeData.hoverColor] for the current theme in Material 2. In
  /// Material 3, defaults to [ColorScheme.onPrimaryContainer] with opacity 0.08.
  final Color? hoverColor;

  /// The splash color for this [M3EFloatingActionButton]'s [InkWell].
  ///
  /// If null, [FloatingActionButtonThemeData.splashColor] is used, if that is
  /// null, [ThemeData.splashColor] is used in Material 2; [ColorScheme.onPrimaryContainer]
  /// with opacity 0.1 is used in Material 3.
  final Color? splashColor;

  /// The tag to apply to the button's [Hero] widget.
  ///
  /// Defaults to a tag that matches other floating action buttons.
  ///
  /// Set this to null explicitly if you don't want the floating action button to
  /// have a hero tag.
  ///
  /// If this is not explicitly set, then there can only be one
  /// [M3EFloatingActionButton] per route (that is, per screen), since otherwise
  /// there would be a tag conflict (multiple heroes on one route can't have the
  /// same tag). The Material Design specification recommends only using one
  /// floating action button per screen.
  final Object? heroTag;

  /// The callback that is called when the button is tapped or otherwise activated.
  ///
  /// If this is set to null, the button will be disabled.
  final VoidCallback? onPressed;

  /// {@macro flutter.material.RawMaterialButton.mouseCursor}
  ///
  /// If this property is null, [WidgetStateMouseCursor.clickable] will be used.
  final MouseCursor? mouseCursor;

  /// The z-coordinate at which to place this button relative to its parent.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 6, the appropriate elevation for floating action buttons. The
  /// value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double? elevation;

  /// The z-coordinate at which to place this button relative to its parent when
  /// the button has the input focus.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 8, the appropriate elevation for floating action buttons
  /// while they have focus. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double? focusElevation;

  /// The z-coordinate at which to place this button relative to its parent when
  /// the button is enabled and has a pointer hovering over it.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 8, the appropriate elevation for floating action buttons while
  /// they have a pointer hovering over them. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  ///  * [disabledElevation], the elevation when the button is disabled.
  final double? hoverElevation;

  /// The z-coordinate at which to place this button relative to its parent when
  /// the user is touching the button.
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to 12, the appropriate elevation for floating action buttons
  /// while they are being touched. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  final double? highlightElevation;

  /// The z-coordinate at which to place this button when the button is disabled
  /// ([onPressed] is null).
  ///
  /// This controls the size of the shadow below the floating action button.
  ///
  /// Defaults to the same value as [elevation]. Setting this to zero makes the
  /// floating action button work similar to an [ElevatedButton] but the titular
  /// "floating" effect is lost. The value is always non-negative.
  ///
  /// See also:
  ///
  ///  * [elevation], the default elevation.
  ///  * [highlightElevation], the elevation when the button is pressed.
  final double? disabledElevation;

  /// The shape of the button's [Material].
  ///
  /// The button's highlight and splash are clipped to this shape. If the
  /// button has an elevation, then its drop shadow is defined by this
  /// shape as well.
  final ShapeBorder? shape;

  /// {@macro flutter.material.Material.clipBehavior}
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;

  /// True if this is an "extended" floating action button.
  ///
  /// Typically "extended" buttons have a [StadiumBorder] [shape]
  /// and have been created with the [FloatingActionButton.extended]
  /// constructor.
  ///
  /// The [Scaffold] animates the appearance of ordinary floating
  /// action buttons with scale and rotation transitions. Extended
  /// floating action buttons are scaled and faded in.
  final bool isExtended;

  /// {@macro flutter.widgets.Focus.focusNode}
  final FocusNode? focusNode;

  /// {@macro flutter.widgets.Focus.autofocus}
  final bool autofocus;

  /// Configures the minimum size of the tap target.
  ///
  /// Defaults to [ThemeData.materialTapTargetSize].
  ///
  /// See also:
  ///
  ///  * [MaterialTapTargetSize], for a description of how this affects tap targets.
  final MaterialTapTargetSize? materialTapTargetSize;

  /// Whether detected gestures should provide acoustic and/or haptic feedback.
  ///
  /// For example, on Android a tap will produce a clicking sound and a
  /// long-press will produce a short vibration, when feedback is enabled.
  ///
  /// If null, [FloatingActionButtonThemeData.enableFeedback] is used.
  /// If both are null, then default value is true.
  ///
  /// See also:
  ///
  ///  * [Feedback] for providing platform-specific feedback to certain actions.
  final bool? enableFeedback;

  /// The spacing between the icon and the label for an extended
  /// [FloatingActionButton].
  ///
  /// If null, [FloatingActionButtonThemeData.extendedIconLabelSpacing] is used.
  /// If that is also null, the default is 8.0.
  final double? extendedIconLabelSpacing;

  /// The padding for an extended [FloatingActionButton]'s content.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedPadding] is used. If that
  /// is also null, the default is
  /// `EdgeInsetsDirectional.only(start: 16.0, end: 20.0)` if an icon is
  /// provided, and `EdgeInsetsDirectional.only(start: 20.0, end: 20.0)` if not.
  final EdgeInsetsGeometry? extendedPadding;

  /// The text style for an extended [FloatingActionButton]'s label.
  ///
  /// If null, [FloatingActionButtonThemeData.extendedTextStyle] is used. If
  /// that is also null, then [TextTheme.labelLarge] with a letter spacing of 1.2
  /// is used.
  final TextStyle? extendedTextStyle;

  final _M3EFloatingActionButtonType _floatingActionButtonType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final floatingActionButtonTheme = theme.floatingActionButtonTheme;
    final m3eFabTheme = theme.extension<M3ETheme>()?.floatingActionButtonTheme;
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
    final focusColor =
        this.focusColor ??
        floatingActionButtonTheme.focusColor ??
        defaults.focusColor;
    final hoverColor =
        this.hoverColor ??
        floatingActionButtonTheme.hoverColor ??
        defaults.hoverColor;
    final splashColor =
        this.splashColor ??
        floatingActionButtonTheme.splashColor ??
        defaults.splashColor;
    final elevation =
        this.elevation ??
        floatingActionButtonTheme.elevation ??
        defaults.elevation!;
    final focusElevation =
        this.focusElevation ??
        floatingActionButtonTheme.focusElevation ??
        defaults.focusElevation!;
    final hoverElevation =
        this.hoverElevation ??
        floatingActionButtonTheme.hoverElevation ??
        defaults.hoverElevation!;
    final disabledElevation =
        this.disabledElevation ??
        floatingActionButtonTheme.disabledElevation ??
        defaults.disabledElevation ??
        elevation;
    final highlightElevation =
        this.highlightElevation ??
        floatingActionButtonTheme.highlightElevation ??
        defaults.highlightElevation!;
    final materialTapTargetSize =
        this.materialTapTargetSize ?? theme.materialTapTargetSize;
    final enableFeedback =
        this.enableFeedback ??
        floatingActionButtonTheme.enableFeedback ??
        defaults.enableFeedback!;
    final iconSize = floatingActionButtonTheme.iconSize ?? defaults.iconSize!;
    final extendedTextStyle = (this.extendedTextStyle ??
            floatingActionButtonTheme.extendedTextStyle ??
            defaults.extendedTextStyle!)
        .copyWith(color: foregroundColor);
    final shape =
        this.shape ?? floatingActionButtonTheme.shape ?? defaults.shape!;

    Widget? resolvedChild =
        child != null
            ? IconTheme.merge(
              data: IconThemeData(size: iconSize),
              child: child!,
            )
            : child;
    final BoxConstraints sizeConstraints;
    switch (_floatingActionButtonType) {
      case _M3EFloatingActionButtonType.regular:
        sizeConstraints =
            floatingActionButtonTheme.sizeConstraints ??
            defaults.sizeConstraints!;
      case _M3EFloatingActionButtonType.medium:
        sizeConstraints =
            m3eFabTheme?.mediumSizeConstraints ??
            defaults.mediumSizeConstraints;
      case _M3EFloatingActionButtonType.large:
        sizeConstraints =
            floatingActionButtonTheme.largeSizeConstraints ??
            defaults.largeSizeConstraints!;
    }

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

    if (tooltip != null) result = Tooltip(message: tooltip, child: result);
    if (heroTag case final heroTag?) result = Hero(tag: heroTag, child: result);

    return MergeSemantics(child: result);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      ObjectFlagProperty<VoidCallback>(
        'onPressed',
        onPressed,
        ifNull: 'disabled',
      ),
    );
    properties.add(StringProperty('tooltip', tooltip, defaultValue: null));
    properties.add(
      ColorProperty('foregroundColor', foregroundColor, defaultValue: null),
    );
    properties.add(
      ColorProperty('backgroundColor', backgroundColor, defaultValue: null),
    );
    properties.add(ColorProperty('focusColor', focusColor, defaultValue: null));
    properties.add(ColorProperty('hoverColor', hoverColor, defaultValue: null));
    properties.add(
      ColorProperty('splashColor', splashColor, defaultValue: null),
    );
    properties.add(
      ObjectFlagProperty<Object>('heroTag', heroTag, ifPresent: 'hero'),
    );
    properties.add(DoubleProperty('elevation', elevation, defaultValue: null));
    properties.add(
      DoubleProperty('focusElevation', focusElevation, defaultValue: null),
    );
    properties.add(
      DoubleProperty('hoverElevation', hoverElevation, defaultValue: null),
    );
    properties.add(
      DoubleProperty(
        'highlightElevation',
        highlightElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DoubleProperty(
        'disabledElevation',
        disabledElevation,
        defaultValue: null,
      ),
    );
    properties.add(
      DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null),
    );
    properties.add(
      DiagnosticsProperty<FocusNode>(
        'focusNode',
        focusNode,
        defaultValue: null,
      ),
    );
    properties.add(
      FlagProperty('isExtended', value: isExtended, ifTrue: 'extended'),
    );
    properties.add(
      DiagnosticsProperty<MaterialTapTargetSize>(
        'materialTapTargetSize',
        materialTapTargetSize,
        defaultValue: null,
      ),
    );
  }
}

// This MaterialStateProperty is passed along to RawMaterialButton which
// resolves the property against MaterialState.pressed, MaterialState.hovered,
// MaterialState.focused, MaterialState.disabled.
class _EffectiveMouseCursor extends WidgetStateMouseCursor {
  const _EffectiveMouseCursor(this.widgetCursor, this.themeCursor);

  final MouseCursor? widgetCursor;
  final WidgetStateProperty<MouseCursor?>? themeCursor;

  @override
  MouseCursor resolve(Set<WidgetState> states) {
    return WidgetStateProperty.resolveAs<MouseCursor?>(widgetCursor, states) ??
        themeCursor?.resolve(states) ??
        WidgetStateMouseCursor.clickable.resolve(states);
  }

  @override
  String get debugDescription =>
      'MaterialStateMouseCursor(M3EFloatingActionButton)';
}

class _FABDefaultsM3E extends FloatingActionButtonThemeData {
  _FABDefaultsM3E(this.context, this.type, this.hasChild)
    : mediumSizeConstraints = const BoxConstraints.tightFor(
        width: 80.0,
        height: 80.0,
      ),
      super(
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

  final BuildContext context;
  final _M3EFloatingActionButtonType type;
  final bool hasChild;
  final BoxConstraints mediumSizeConstraints;
  late final _colors = Theme.of(context).colorScheme;
  late final _textTheme = Theme.of(context).textTheme;

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
  };

  @override
  double? get iconSize => switch (type) {
    _M3EFloatingActionButtonType.regular => 24.0,
    _M3EFloatingActionButtonType.medium => 28.0,
    _M3EFloatingActionButtonType.large => 36.0,
  };

  @override
  EdgeInsetsGeometry? get extendedPadding =>
      EdgeInsetsDirectional.only(start: 20.0, end: 20.0);

  @override
  TextStyle? get extendedTextStyle => _textTheme.labelLarge;
}
