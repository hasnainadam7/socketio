import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scoketio/app/pages/sign_in_page.dart';
import 'package:scoketio/app/utils/colors.dart';
import 'app/data/controllers/auth_repo_controller.dart';
import 'app/data/helper/dependency.dart' as dep;
import 'app/pages/contactlist/contact_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(const Duration(milliseconds: 1000), () async {
    await dep.init();
  });

  await Get.find<AuthRepoController>().checkUserIfLogin();
  runApp(MyApp(initialRoute:SignInPage()));
  // runApp(MyApp(initialRoute: token != null ? ContactPage() : SignInPage()));
}

class MyApp extends StatelessWidget {
  final Widget initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
      ),
      home: initialRoute,
    );
  }
}
