import 'package:flutter/material.dart';

class FadeText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final StrutStyle? strutStyle;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool softWrap;
  final TextOverflow overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? sectionColor;
  final Duration duration;

  const FadeText(this.text, {
    Key? key,
    this.style = const TextStyle(),
    this.strutStyle,
    this.textAlign = TextAlign.left,
    this.textDirection,
    this.locale,
    this.softWrap = true,
    this.overflow = TextOverflow.clip,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.sectionColor,
    this.duration = const Duration(milliseconds: 1300),
  }) : super(key: key);

  @override
  State<FadeText> createState() => _FadeTextState();
}

class _FadeTextState extends State<FadeText> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn)
    );

  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child){
        return Opacity(
          opacity: _animation.value,
          child: Text(
            widget.text,
            style: widget.style,
            strutStyle: widget.strutStyle,
            textAlign: widget.textAlign,
            textDirection: widget.textDirection,
            locale: widget.locale,
            softWrap: widget.softWrap,
            overflow: widget.overflow,
            textScaleFactor: widget.textScaleFactor,
            maxLines: widget.maxLines,
            semanticsLabel: widget.semanticsLabel,
            textWidthBasis: widget.textWidthBasis,
            textHeightBehavior: widget.textHeightBehavior,
            selectionColor: widget.sectionColor,
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
