import 'package:flutter/material.dart';
import 'package:material_expressive/material_expressive.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Regular', type: M3EFloatingActionButton)
Widget buildFloatingActionButton(BuildContext context) {
  return M3EFloatingActionButton(onPressed: () {}, child: Icon(Icons.stars));
}

@widgetbook.UseCase(name: 'Medium', type: M3EFloatingActionButton)
Widget buildSecondaryFloatingActionButton(BuildContext context) {
  return M3EFloatingActionButton.medium(
    onPressed: () {},
    child: Icon(Icons.stars),
  );
}

@widgetbook.UseCase(name: 'Large', type: M3EFloatingActionButton)
Widget buildLargeFloatingActionButton(BuildContext context) {
  return M3EFloatingActionButton.large(
    onPressed: () {},
    child: Icon(Icons.stars),
  );
}

@widgetbook.UseCase(name: 'Extended', type: M3EFloatingActionButton)
Widget buildExtendedFloatingActionButton(BuildContext context) {
  return M3EFloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.stars),
    label: Text('Extended'),
  );
}
