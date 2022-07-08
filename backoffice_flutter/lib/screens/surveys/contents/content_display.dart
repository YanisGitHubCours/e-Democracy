import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/models/survey.dart';
import 'package:backoffice_flutter/requests/polls.dart';
import 'package:backoffice_flutter/screens/surveys/components/detail_survey.dart';
import 'package:backoffice_flutter/widgets/survey_item.dart';
import 'package:flutter/material.dart';

class ContentDisplay extends StatefulWidget {
  const ContentDisplay({Key? key}) : super(key: key);

  @override
  State<ContentDisplay> createState() => _ContentDisplayState();
}

class _ContentDisplayState extends State<ContentDisplay> {
  Survey? _surveySelected;

  void _displayUserData(Survey? surveyClicked) {
    setState(() {
      _surveySelected = surveyClicked;
    });
  }

  void _reload() {
    setState(() {
      _surveySelected = null;
    });
  }

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
                  //color: Colors.white,
                  borderRadius: BorderRadius.circular(defaultPadding / 4),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Text(
                        'Sondages :',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: Polls.getAllPollsDesc(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.waiting:
                              return const Center(
                                child: CircularProgressIndicator(color: pitaya),
                              );
                              break;
                            case ConnectionState.done:
                              if (snapshot.hasError) {
                                return Center(
                                  child: Text("Error: ${snapshot.error}"),
                                );
                              }
                              if (snapshot.hasData) {
                                final List<Survey> users = snapshot.data;
                                if (users.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Aucun Sondage",
                                      style: TextStyle(color: grey),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: users.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return SurveyItem(
                                      survey: users[index],
                                      click: _displayUserData,
                                      isSelected: users[index].id ==
                                          _surveySelected?.id,
                                    );
                                  },
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
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              flex: 2,
              child: DetailSurvey(
                surveySelected: _surveySelected,
                reload: _reload,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
