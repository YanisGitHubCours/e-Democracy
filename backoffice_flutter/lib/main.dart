import 'package:backoffice_flutter/screens/dashboard/dashboard_screen.dart';
import 'package:backoffice_flutter/screens/login/login_page.dart';
import 'package:backoffice_flutter/utils/token_preferences.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'constants/constants.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await TokenSimplePreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Votaction Administration',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: bgColor,
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: grey),
        canvasColor: pitaya,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),
      onGenerateRoute: (RouteSettings settings) {
        final dynamic arguments = settings.arguments;
        switch (settings.name) {
          case "/":
            return TokenSimplePreferences.getToken('token') != null
                ? PageTransition(
                    child: DashBoardScreen(), type: PageTransitionType.fade)
                : PageTransition(
                    child: const LoginPage(), type: PageTransitionType.fade);
            break;
          default:
            return MaterialPageRoute(
                builder: (BuildContext context) => const LoginPage());
            break;
        }
      },
    );
  }
}
