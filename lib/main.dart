import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:myapp/screens/splash_screen/splash_screen.dart';
import 'app_binding/app_binding.dart';
import 'db/db_helper.dart';
import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox<int>(DatabaseHelper.authenticationDB);
  await Hive.openBox<String>("filePath");
  await Hive.openBox<double>(DatabaseHelper.priceDB);
  await Hive.openBox<int>("StoragePermission");
  Hive.registerAdapter(UserModelAdapter());
  // Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<UserModel>("userDetails");
  // await Hive.openBox<ProductModel>("productDetails");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: MyBinding(),
          debugShowCheckedModeBanner: false,
          title: "Task 2",
          theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme(),
            scaffoldBackgroundColor: Color.fromARGB(255, 249, 221, 215),
          ),
          home: child,
        );
      },
      child: OurSplashScreen(),
    );
  }
}
