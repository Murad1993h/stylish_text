import 'package:flutter/material.dart';

class OscillateText extends StatefulWidget {
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
  final bool reverse;
  final int fontSizeIncrease;

  const OscillateText(this.text, {
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
    this.duration = const Duration(seconds: 3),
    this.reverse = true,
    this.fontSizeIncrease = 10,
  }) : super(key: key);

  @override
  State<OscillateText> createState() => _OscillateTextState();
}

class _OscillateTextState extends State<OscillateText> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    _controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )..repeat(reverse: widget.reverse);
    _animation = IntTween(begin: 0, end: widget.text.length-1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child){
        return RichText(
          text: _getTextSpan(),
        );
      },
    );
  }

  TextSpan _getTextSpan(){
    double defaultFontSize = Theme.of(context).textTheme.bodyMedium!.fontSize!;
    double fontSize = widget.style.fontSize ?? defaultFontSize;

    List<TextSpan> textSpans = [];
    for(int i=0; i<widget.text.length; i++){
      int j = widget.textDirection == TextDirection.rtl? widget.text.length-1-i : i;
      textSpans.add(
        TextSpan(
          text: widget.text[i],
          style: widget.style.copyWith(
            fontSize: j==_animation.value? fontSize+widget.fontSizeIncrease:fontSize,
          )
        )
      );
    }
    return TextSpan(children: textSpans);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

}
