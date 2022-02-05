import 'package:flutter/material.dart';

class OverlayAnimation extends ModalRoute<void> {
  List<String> routesOverlay = [];

  @override
  // TODO: implement barrierColor
  Color? get barrierColor => Colors.black.withOpacity(0.6);

  @override
  // TODO: implement barrierDismissible
  bool get barrierDismissible => true;

  @override
  // TODO: implement barrierLabel
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: _buildOverlayContent(context),
      ),
    );
  }

  @override
  bool get maintainState => true;

  @override
  bool get opaque => false;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }

  Widget _buildOverlayContent(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
    );
  }
}
