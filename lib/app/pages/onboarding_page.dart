import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scoketio/app/widgets/scaffold_body.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_button.dart';
import '../widgets/texts/poppins.dart';

// ignore: camel_case_types
class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(),
        body: Body(
          child: Center(
            child: Column(
              children: [
                SvgPicture.asset(
                  Assets.svg.wellComeSvg,
                  semanticsLabel: "Welcome Image",
                ),
                const Poppins(
                  color: AppColors.primaryColor,
                  size: 35,
                  weight: FontWeight.w600,
                  label: "Discover Your \nDream Job here",
                  maxLines: 2,
                  align: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Poppins(
                  color: AppColors.blackColor,
                  size: 14,
                  maxLines: 2,
                  label:
                      "Explore all the existing job roles based on your\n interest and study major",
                  align: TextAlign.center,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Expanded(
                      // Ensures the button fits within the Row
                      child: CustomCircularButton(
                          elevation: 3,
                          corners: 10,
                          isPrimaryColor: true,
                          callbackAction: () async{},
                          btnLabel: "Login"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      // Ensures the button fits within the Row
                      child: CustomCircularButton(
                          corners: 10,
                          callbackAction: () async{},
                          btnLabel: "Register",),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
