import 'package:flutter/material.dart';

class EnhancedSelectableText extends StatelessWidget {
  final String data;
  final TextStyle? style;

  const EnhancedSelectableText(
    this.data, {
    Key? key,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      data,
      style: style,
    );
  }
}
