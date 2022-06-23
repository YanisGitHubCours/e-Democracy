import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../requests/polls.dart';

class CounterPolls extends StatelessWidget {
  const CounterPolls({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 4),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Text(
              'Sondages',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica',
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: Polls.countPolls(),
              builder: (BuildContext context,
                  AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(
                      child: CircularProgressIndicator(
                          color: pitaya),
                    );
                    break;
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error}"),
                      );
                    }
                    if (snapshot.hasData) {
                      final counter = snapshot.data;
                      if (counter == 0) {
                        return const Center(
                          child: Text(
                            "Aucun sondage",
                            style: TextStyle(
                              color: grey,
                            ),
                          ),
                        );
                      }
                      return Center(
                        child: Text(
                          "$counter",
                          style: const TextStyle(
                            fontSize: 100,
                            color: peach,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                      );
                    } else {
                      return const Center(
                        child: Text("No data"),
                      );
                    }
                    break;
                  default:
                    return Container();
                    break;
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
