import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/colors.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/convex_container.dart';

import '../../../core/constants/images.dart';

class MobileHeader extends StatelessWidget {
  const MobileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return   Center(
              child: ClipPath(
                clipper: BottomConvexClipper(),
                child: Container(
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradient1,
                        AppColors.gradient2,
                        AppColors.gradient3,
                      ],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                    ),
                  ),
                  child:  Center(
                    child: Image.asset(logoMobile)
                  ),
                ),
              ),
            );
  }
}