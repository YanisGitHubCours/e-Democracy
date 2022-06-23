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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding / 4),
                ),
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding / 4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
