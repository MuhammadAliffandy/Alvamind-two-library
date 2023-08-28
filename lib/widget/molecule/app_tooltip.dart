import 'package:flutter/material.dart';
import 'package:super_tooltip/super_tooltip.dart';

class AppTooltip extends StatelessWidget {
  final Widget child;
  final Widget content;
  final double? arrowLength;
  final double? left;
  final double? right;

  const AppTooltip({
    super.key,
    required this.child,
    required this.content,
    this.arrowLength,
    this.left,
    this.right,
  });

  @override
  Widget build(BuildContext context) {
    final _controller = SuperTooltipController();
    void makeTooltip() {
      _controller.showTooltip();
    }

    // TODO: implement build
    return GestureDetector(
      onTap: () async {
        await _controller.showTooltip();
      },
      child: SuperTooltip(
        barrierColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        borderColor: Colors.transparent,
        elevation: 0,
        arrowLength: arrowLength ?? 20,
        right: left,
        left: right,
        hasShadow: false,
        controller: _controller,
        content: content,
        child: child,
      ),
    );
  }
}
