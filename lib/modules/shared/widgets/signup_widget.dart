import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/styles.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/bold_text.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/gradient_button.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/outlined_button.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/small_text.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
   // double deviceheight = MediaQuery.of(context).size.height;  
    return LayoutBuilder(builder: (context, constraints) {
      return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: deviceWidth/3.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          const BoldTextWidget(text: "Join our"),
          const BoldTextWidget(text: "community today"),
          const SmallTextWidget(
            text: "Get connected, find designers to start a project",
          ),
          const SizedBox(
            height: 20,
          ),
          GradientButton(height: 50,width: deviceWidth/3.6, onPressed: () {}, title: "Sign Up"),
          const SizedBox(
            height: 15,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "Or, Login with",
              style: kSmallStyle,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: deviceWidth/12,
                child: OutlinedButtonWidget(onPressed: () {}, title: 'Facebook')),
             SizedBox(
                width: deviceWidth/12,
                child: OutlinedButtonWidget(onPressed: () {}, title: 'Linkedin')),   SizedBox(
                width: deviceWidth/12,
                child: OutlinedButtonWidget(onPressed: () {}, title: 'Google')),
            ],
          )
        ]),
      );
    });
  }
}
