import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'contents/content_display.dart';

class AdministrationScreen extends StatelessWidget {
  const AdministrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context, "Administration"),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Expanded(
              child: SideMenu(select: 4),
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
