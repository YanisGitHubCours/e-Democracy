import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import '../components/counter_polls.dart';
import '../components/counter_user.dart';
import '../components/recent_activity.dart';

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
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: const [
                  Expanded(
                    child: CounterUsers(),
                  ),
                  SizedBox(width: defaultPadding),
                  Expanded(
                    child: CounterPolls(),
                  )
                ],
              ),
            ),
            const SizedBox(height: defaultPadding),
            const Expanded(
                flex: 2,
                child: RecentActivity(),
            ),
          ],
        ),
      ),
    );
  }
}