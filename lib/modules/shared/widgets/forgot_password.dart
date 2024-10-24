
import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/colors.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot password?",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              decoration: TextDecoration.underline,
              color: AppColors.backgroundColor,
            ),
          )),
    );
  }
}
