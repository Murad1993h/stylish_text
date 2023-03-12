import 'package:flutter/material.dart';
import 'package:stylish_text/src/moving_animation.dart';

// ignore: must_be_immutable
class LinearMovingText extends MovingAnimation{
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
  final double? width;
  final double? height;
  final Color? backgroundColor;

  LinearMovingText(this.text, {
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
    duration = const Duration(seconds: 3),
    direction,
    this.width,
    this.height,
    this.backgroundColor,
    padding = const EdgeInsets.all(0.0),
  }) : super(
      key: key,
      duration: duration,
      direction: direction,
      curve: Curves.linear,
      padding: padding,
      child: Container(
          color: backgroundColor,
          width: width,
          height: height,
          padding: padding,
          child: Text(
            text,
            style: style,
            strutStyle: strutStyle,
            textAlign: textAlign,
            textDirection: textDirection,
            locale: locale,
            softWrap: softWrap,
            overflow: overflow,
            textScaleFactor: textScaleFactor,
            maxLines: maxLines,
            semanticsLabel: semanticsLabel,
            textWidthBasis: textWidthBasis,
            textHeightBehavior: textHeightBehavior,
            selectionColor: sectionColor,
          )
      )
  );
}
