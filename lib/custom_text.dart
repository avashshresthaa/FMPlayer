import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double hpadding;
  final double vpadding;
  double? fontSize = 14;
  final FontWeight? weight;
  final Color? color;
  final String? family;
  final textAlign;
  final maxLine;
  final textOverflow;

  CustomText(
      {super.key,
      this.maxLine,
      required this.text,
      this.fontSize,
      this.hpadding = 0,
      this.vpadding = 0,
      this.weight = FontWeight.w400,
      this.color = CupertinoColors.label,
      this.family = 'NotoSans',
      this.textOverflow = TextOverflow.visible,
      this.textAlign = TextAlign.left});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      maxLines: maxLine,
      style: TextStyle(
        fontFamily: family,
        fontSize: fontSize,
        color: color,
        fontWeight: weight,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: hpadding, vertical: vpadding),
        child: Text(
          text,
        ),
      ),
    );
  }
}
