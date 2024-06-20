import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/responsivness.dart';
import 'package:flutter_web_dashboard/layout.dart';
import 'package:flutter_web_dashboard/widgets/large_screen.dart';
import 'package:flutter_web_dashboard/widgets/small_screen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dash",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme:
            GoogleFonts.mulishTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        }),
        primaryColor: Colors.blue,
      ),
      home: SideLayout(),
    );
  }
}
