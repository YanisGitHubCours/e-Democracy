import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class LabelProject extends StatelessWidget {
  const LabelProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      alignment: Alignment.bottomLeft,
      child: Row(
        children: const [
          Text(
            "ESGI project",
            style: TextStyle(
              fontFamily: "Helvetica",
              fontWeight: FontWeight.bold,
              color: Colors.white60,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}