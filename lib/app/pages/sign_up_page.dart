import 'package:flutter/material.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:scoketio/app/data/models/users_models.dart';
import 'package:scoketio/app/widgets/custom_app_bar.dart';
import 'package:scoketio/app/widgets/scaffold_body.dart';

import '../data/controllers/auth_repo_controller.dart';
import '../utils/colors.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/snackbar_widget.dart';
import '../widgets/texts/poppins.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  SignUpPage({super.key});
  Future<void> registration(AuthRepoController authrepo) async {
    String password = passController.text.trim();
    String email = emailController.text.trim();

    if (email.isEmpty || password.length < 6 || !GetUtils.isEmail(email)) {
      CustomSnackbar.showSnackbar(description: "Please fill the box Correctly");
    } else {
      UsersModel userModel = UsersModel(
        username: "user",
        email: email,
        fullname: "fullname",
        avatar: "avatar",
        password: password,
      );
      await authrepo.registration(userModel).then((status) async {
        if (status.success) {
          CustomSnackbar.showSnackbar(
            description: "Registration Successfully done",
            isError: false,
            title: "Welcome user",
          );


          // Get.toNamed(Routeshelper.getFoodHomePageRoute(3));
        } else {
          CustomSnackbar.showSnackbar(description: "Registration Failed");
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
              callbackAction: () async {},
              btnLabel: "Sign up",
              isPrimaryColor: true,
              corners: 10,
            ),
            CustomCircularButton(
              labelSize: 14,
              labelWeight: FontWeight.w500,
              callbackAction: () async {},
              btnLabel: "Already have an account",
            ),
          ],
        ),
      ),
    );
  }
}
