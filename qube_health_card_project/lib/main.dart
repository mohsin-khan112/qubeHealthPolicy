import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:qube_health_card_project/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (context) =>  MyApp()), // Wrap your app
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        // useInheritedMediaQuery: true,
        // locale: DevicePreview.locale(context),
        // builder: DevicePreview.appBuilder,
        // darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.firstScreen,
        getPages: AppPages.pages,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.white,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      );
    });
  }
}
