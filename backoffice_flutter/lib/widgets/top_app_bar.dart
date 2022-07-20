import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:backoffice_flutter/responsiveness.dart';

import 'custom_text.dart';

AppBar topAppBar(BuildContext context, String title) => AppBar(
      elevation: 0,
      leading: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 14),
            child: Image.asset(
              "assets/images/logo-votaction-simple.png",
              width: 28,
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          Visibility(
            child: CustomText(
              text: title,
              color: grey,
              size: 20,
              weight: FontWeight.bold,
            ),
          ),
        ],
      ),
      iconTheme: const IconThemeData(color: grey),
      backgroundColor: Colors.white,
    );
