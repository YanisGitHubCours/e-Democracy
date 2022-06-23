import 'package:backoffice_flutter/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'contents/content_display.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context, "Utilisateurs"),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Expanded(
              child: SideMenu(select: 2),
            ),
            Expanded(
              flex: 5,
              child: ContentDisplay(),
            ),
          ],
        ),
      ),
    );
  }
}
