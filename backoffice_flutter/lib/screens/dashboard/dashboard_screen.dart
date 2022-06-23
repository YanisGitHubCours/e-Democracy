import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'contents/content_display.dart';

class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context, "Dashboard"),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Expanded(
              child: SideMenu(select: 1),
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
