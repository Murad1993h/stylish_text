import 'dart:async';
import 'package:flutter/material.dart';

class TypewriterText extends StatefulWidget {
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

  const TypewriterText(this.text, {
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
    this.duration = const Duration(milliseconds: 250),
  }) : super(key: key);

  @override
  State<TypewriterText> createState() => _TypewriterTextState();
}

void textPrintingDelay(int subStringLength, int stringLength, String text, Function(String) callback, Duration duration){
  if(subStringLength<=stringLength){
    Timer(subStringLength!=0 && text[subStringLength-1]==' '? const Duration(milliseconds: 0):duration, (){
      String subString = text.substring(0, subStringLength);
      callback(subString);
      textPrintingDelay(subStringLength+1, stringLength, text, callback, duration);
    });
  }
}

class _TypewriterTextState extends State<TypewriterText> {
  String subString = '';

  @override
  void initState() {
    String text = widget.text;
    super.initState();
    textPrintingDelay(0, widget.text.length, text, (String subString){
      if(mounted){
        setState(() {
          this.subString = subString;
        });
      }
    }, widget.duration);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Text(
            widget.text,
            style: widget.style.copyWith(color: Colors.transparent),
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
        ),
        SizedBox(
          child: Text(
            subString,
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
        ),
      ],
    );
  }
}
