import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

class ContentDisplay extends StatefulWidget {
  const ContentDisplay({Key? key}) : super(key: key);

  @override
  State<ContentDisplay> createState() => _ContentDisplayState();
}

class _ContentDisplayState extends State<ContentDisplay> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: bgColor,
    );
  }
}
