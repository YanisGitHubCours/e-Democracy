import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/widgets/top_app_bar.dart';
import 'package:flutter/material.dart';

import '../../widgets/side_menu.dart';
import 'contents/content_display.dart';

class SurveysScreen extends StatelessWidget {
  SurveysScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: topAppBar(context, "Sondages"),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Expanded(
              child: SideMenu(select: 3),
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
