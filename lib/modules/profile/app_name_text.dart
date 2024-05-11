import 'package:bloom_buddy/modules/profile/title.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class AppNameTextWidget extends StatelessWidget {
  const AppNameTextWidget({super.key, this.fontSize = 30, required this.text});

  final double fontSize;
  final String text ;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.green,
      highlightColor: Colors.purple,
      child: TitlesTextWidget(
        fontSize: fontSize,
        label: text,
      ),
    );
  }
}
