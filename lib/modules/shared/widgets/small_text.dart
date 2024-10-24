import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/styles.dart';

class SmallTextWidget extends StatelessWidget {
  final String text;
  const SmallTextWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        style: kSmallStyle,
      ),
    );
  }
}