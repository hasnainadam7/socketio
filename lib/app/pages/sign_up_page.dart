import 'package:flutter/material.dart';
import 'package:scoketio/app/widgets/custom_app_bar.dart';
import 'package:scoketio/app/widgets/scaffold_body.dart';

import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/texts/poppins.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Body(
        child: Column(
          children: [
            const Poppins(
              label: "Create Account",
              size: 30,
              color: AppColors.primaryColor,
              weight: FontWeight.w700,
            ),
            const SizedBox(
              height: 10,
            ),
            const Poppins(
              label:
                  "Create an account so you can explore all \nthe existing jobs",
              size: 14,
              maxLines: 2,
              align: TextAlign.center,
              weight: FontWeight.w400,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              textEditingController: emailController,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              textEditingController: passController,
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              textEditingController: confirmPassController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(
              height: 40,
            ),
            CustomCircularButton(
              callbackAction: () {},
              btnLabel: "Sign up",
              isPrimaryColor: true,
              corners: 10,
            ),
            CustomCircularButton(
              labelSize: 14,
              labelWeight: FontWeight.w500,
              callbackAction: () {},
              btnLabel: "Already have an account",
            ),
          ],
        ),
      ),
    );
  }
}
