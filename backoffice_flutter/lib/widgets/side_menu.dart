import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/screens/login/login_page.dart';
import 'package:backoffice_flutter/screens/surveys/surveys_screen.dart';
import 'package:backoffice_flutter/screens/users/users_screen.dart';
import 'package:backoffice_flutter/utils/token_preferences.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/dashboard/dashboard_screen.dart';

class SideMenu extends StatelessWidget {
  final int select;

  const SideMenu({
    Key? key,
    required this.select,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            DrawerListTile(
              title: "Dashboard",
              logo: Icon(
                Icons.dashboard,
                color: select == 1 ? Colors.white : pitaya,
              ),
              press: () {
                if (select != 1) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: DashBoardScreen()));
                }
              },
              select: select == 1 ? true : false,
            ),
            DrawerListTile(
              title: "Utilisateurs",
              logo: Icon(
                Icons.person,
                color: select == 2 ? Colors.white : pitaya,
              ),
              press: () {
                if (select != 2) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: UsersScreen()));
                }
              },
              select: select == 2 ? true : false,
            ),
            DrawerListTile(
              title: "Sondages",
              logo: Icon(
                Icons.poll,
                color: select == 3 ? Colors.white : pitaya,
              ),
              press: () {
                if (select != 3) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: SurveysScreen()));
                }
              },
              select: select == 3 ? true : false,
            ),
            ListTile(
              onTap: () async {
                bool? success =
                    await TokenSimplePreferences.removeToken('token');
                if (success != null && success) {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: const LoginPage()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Une erreur est survenue'),
                    ),
                  );
                }
              },
              horizontalTitleGap: 0.0,
              leading: const Icon(
                Icons.logout,
                color: pitaya,
              ),
              title: const Text(
                'Déconnexion',
                style: TextStyle(
                  color: pitaya,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    required this.logo,
    required this.press,
    required this.select,
  }) : super(key: key);

  final String title;
  final Icon logo;
  final VoidCallback press;
  final bool select;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      tileColor: select ? pitaya : Colors.transparent,
      leading: logo,
      title: Text(
        title,
        style: TextStyle(
          color: select ? Colors.white : pitaya,
        ),
      ),
    );
  }
}
