import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:scoketio/app/utils/colors.dart';
import 'package:scoketio/app/widgets/custom_app_bar.dart';
import 'package:scoketio/app/widgets/custom_button.dart';
import 'package:scoketio/app/widgets/custom_text_field.dart';
import 'package:scoketio/app/widgets/scaffold_body.dart';
import 'package:scoketio/app/widgets/texts/poppins.dart';

import '../data/controllers/auth_repo_controller.dart';
import '../widgets/snackbar_widget.dart';

class SignInPage extends StatelessWidget {
  SignInPage({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  Future<void> _login(context) async {
    String password = passController.text.trim();
    String email = emailController.text.trim();
    //

    if (email.isEmpty || password.length < 6 || !GetUtils.isEmail(email) ) {
      CustomSnackbar.showSnackbar(description: "Please fill the box Correctly");
    } else {
      await Get.find<AuthRepoController>()
          .login(email, password)
          .then((status) async {
        if (status.success) {
          CustomSnackbar.showSnackbar(
              description: status.message,
              isError: !status.success,
              title: "Welcome");


          // await Get.find<AuthRepoController>().getUser();
          // await Get.find<UserRepoController>().getUserInfo();

          // Navigator.pushReplacementNamed(context, Routeshelper.getFoodHomePageRoute(0));
        } else {
          CustomSnackbar.showSnackbar(description: status.message.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Body(
        child: Column(
          children: [
            const Poppins(
              label: "Login here",
              size: 30,
              color: AppColors.primaryColor,
              weight: FontWeight.w700,
            ),
            const SizedBox(
              height: 10,
            ),
            const Poppins(
              label: "Welcome back you’ve\n been missed!",
              size: 20,
              maxLines: 2,
              align: TextAlign.center,
              weight: FontWeight.w600,
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
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Poppins(
                  label: "Forgot your password",
                  size: 14,
                  weight: FontWeight.w500,
                  align: TextAlign.right,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            CustomCircularButton(
              callbackAction: ()async {
                _login(context);
              },
              btnLabel: "Sign in",
              isPrimaryColor: true,
              corners: 10,
            ),
            CustomCircularButton(
                labelSize: 14,
                labelWeight: FontWeight.w500,
                callbackAction: ()async {},
                btnLabel: "Create new account"),
          ],
        ),
      ),
    );
  }
}
