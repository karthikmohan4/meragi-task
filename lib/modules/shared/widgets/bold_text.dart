import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';

class BoldTextWidget extends StatelessWidget {
  final String text;
  const BoldTextWidget({
    super.key, required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.topLeft,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
         text,
          style: kBoldStyle,
        ),
      ),
    );
  }
}