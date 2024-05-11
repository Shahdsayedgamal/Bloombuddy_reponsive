import 'package:flutter/material.dart';

class SubTitlesText extends StatelessWidget {
  const SubTitlesText({
    Key? key,
    required this.label,
    this.fontSize = 20,
    this.color,
    this.maxLines,
    this.fontWeight,
  }) : super(key: key);

  final String label;
  final double fontSize;
  final Color? color;
  final int? maxLines;
  final FontWeight? fontWeight ;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      maxLines: maxLines,
      // textAlign: TextAlign.justify,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
          overflow: TextOverflow.ellipsis),
    );
  }
}

