import 'package:flutter/material.dart';
import 'package:meragi_task_karthik/core/constants/colors.dart';
import 'bold_text.dart';
import 'package:meragi_task_karthik/modules/shared/widgets/small_text.dart';

class RecentLoginWidget extends StatelessWidget {
  const RecentLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
        double deviceWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 12, right: 12, left: 0),
      child: LayoutBuilder(builder: (context, constraints) {
        return ConstrainedBox(
           constraints: BoxConstraints(maxWidth: deviceWidth/2.8),
          child: Column(children: [
            const BoldTextWidget(text: "Welcome to Design Guild"),
            const SmallTextWidget(
              text: "Join the world's largest community for designers",
            ),
            const SizedBox(
              height: 16,
            ),
            const SmallTextWidget(
              text: "Recent Logins",
            ),
            const SizedBox(
              height: 16,
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: 110,
                  maxWidth: MediaQuery.of(context).size.width / 2.4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width / 9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.backgroundColor)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [CircleAvatar(
          backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.YDyoIafIwW1tILED3HgZRQHaHa?rs=1&pid=ImgDetMain"),
          
                      ), Text("karthik")],
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width / 9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.backgroundColor)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [CircleAvatar(backgroundImage: NetworkImage("https://th.bing.com/th/id/OIP.1YA0YJyk6CkgC9KeaJ7a8wHaHa?w=626&h=626&rs=1&pid=ImgDetMain"),), Text("John")],
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Container(
                    height: 110,
                    width: MediaQuery.of(context).size.width / 9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColors.backgroundColor)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton.filled(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: AppColors.greyColor,
                            applyTextScaling: true,
                          ),
                          color: AppColors.greyColor,
                          highlightColor: AppColors.lightGreyColor,
                        ),
                        const Text("Add account")
                      ],
                    ),
                  )
                ],
              ),
            ),
          ]),
        );
      }),
    );
  }
}
