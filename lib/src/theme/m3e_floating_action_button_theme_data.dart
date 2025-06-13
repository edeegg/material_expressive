import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class M3EFloatingActionButtonThemeData with Diagnosticable {
  const M3EFloatingActionButtonThemeData({this.mediumSizeConstraints});

  /// Overrides the default size constraints for [M3EFloatingActionButton.medium].
  final BoxConstraints? mediumSizeConstraints;

  M3EFloatingActionButtonThemeData copyWith({
    BoxConstraints? mediumSizeConstraints,
  }) {
    return M3EFloatingActionButtonThemeData(
      mediumSizeConstraints:
          mediumSizeConstraints ?? this.mediumSizeConstraints,
    );
  }

  M3EFloatingActionButtonThemeData lerp(
    M3EFloatingActionButtonThemeData? other,
    double t,
  ) {
    if (other == null || identical(this, other)) return this;
    return M3EFloatingActionButtonThemeData(
      mediumSizeConstraints: BoxConstraints.lerp(
        mediumSizeConstraints,
        other.mediumSizeConstraints,
        t,
      ),
    );
  }

  @override
  int get hashCode => Object.hash(runtimeType, mediumSizeConstraints);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is M3EFloatingActionButtonThemeData &&
        runtimeType == other.runtimeType &&
        other.mediumSizeConstraints == mediumSizeConstraints;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<BoxConstraints>(
        'mediumSizeConstraints',
        mediumSizeConstraints,
        defaultValue: null,
      ),
    );
  }
}
