import 'package:flutter/material.dart';

enum Direction{
  ltr, rtl, dtu, utd,
}

const ltr = Direction.ltr;
const rtl = Direction.rtl;
const dtu = Direction.dtu;
const utd = Direction.utd;

// ignore: must_be_immutable
class MovingAnimation extends StatefulWidget {
  final Widget child;
  Direction? direction;
  Duration? duration;
  final Curve curve;
  final EdgeInsetsGeometry padding;

  MovingAnimation({Key? key, required this.child, this.direction, this.duration, required this.curve, required this.padding}) : super(key: key);

  @override
  State<MovingAnimation> createState() => _MovingAnimationState();
}

class _MovingAnimationState extends State<MovingAnimation> with SingleTickerProviderStateMixin {
  late Animation<double>_animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration ?? const Duration(seconds: 15),
      vsync: this,
    );
    _animation = Tween(begin: -10.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: widget.curve,),
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _controller.forward();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child){
        return Transform.translate(
          offset: widget.direction == ltr? Offset(50*_animation.value, 0):
          widget.direction == rtl? Offset(-50*_animation.value, 0):
          widget.direction == utd? Offset(0, 50*_animation.value):
          Offset(0, -50*_animation.value),
          child: Padding(
            padding: widget.padding,
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
