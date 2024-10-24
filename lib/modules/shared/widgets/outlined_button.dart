import 'package:flutter/material.dart';

import '../../../core/constants/styles.dart';

class OutlinedButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const OutlinedButtonWidget(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return 
     OutlinedButton(
         onPressed: () {},
         style: ButtonStyle(
             shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10)))),
         child: FittedBox(
           fit: BoxFit.scaleDown,
           child: Text(
             title,
             style: kSmallStyle,
           ),
         ));
  }
}
