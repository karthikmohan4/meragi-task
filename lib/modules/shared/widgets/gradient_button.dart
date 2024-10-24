import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/colors.dart';

class GradientButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;
   final double width;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.title, required this.height, required this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.gradient1,
            AppColors.gradient2,
            AppColors.gradient3,
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: Size( width, height),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child:  Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: AppColors.whiteColor
          ),
        ),
      ),
    );
  }
}
