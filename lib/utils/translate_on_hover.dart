import 'package:flutter/widgets.dart';

class TranslateOnHover extends StatefulWidget {
  TranslateOnHover(
      {this.x, this.y, this.z, this.enable = true, this.child, Key key})
      : super(key: key);

  final double x, y, z;
  final bool enable;
  final Widget child;

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState(x, y, z);
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  _TranslateOnHoverState(double x, double y, double z) {
    this.nonHoveringTransform = Matrix4.identity();
    this.hoveringTransform = Matrix4.identity()..translate(x, y, z);
  }

  Matrix4 nonHoveringTransform;
  Matrix4 hoveringTransform;

  bool _hovering = false;

  void _mouseEnter(bool hovering) {
    setState(() {
      this._hovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MouseRegion(
        onEnter: (e) => _mouseEnter(true),
        onExit: (e) => _mouseEnter(false),
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          child: widget.child,
          transform: widget.enable && _hovering
              ? hoveringTransform
              : nonHoveringTransform,
        ),
      ),
    );
  }
}
