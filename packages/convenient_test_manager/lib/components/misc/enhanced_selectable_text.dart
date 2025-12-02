import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EnhancedSelectableText extends StatelessWidget {
  final bool enableCopyAllButton;

  // forward
  final String data;
  final TextStyle? style;

  const EnhancedSelectableText(
    this.data, {
    super.key,
    this.style,
    this.enableCopyAllButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SelectableText(data, style: style),
        if (enableCopyAllButton)
          Positioned(
            top: 0,
            right: 0,
            child: InkWell(
              onTap: () async =>
                  await Clipboard.setData(ClipboardData(text: data)),
              child: const Icon(Icons.copy, color: Colors.blue, size: 16),
            ),
          ),
      ],
    );
  }
}
