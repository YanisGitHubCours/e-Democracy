import 'package:backoffice_flutter/models/survey.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/answer.dart';
import '../../../requests/polls.dart';
import '../../../widgets/answer_data_row.dart';

class AnswerSurvey extends StatefulWidget {
  const AnswerSurvey({
    Key? key,
    required Survey? surveySelected,
  })  : _surveySelected = surveySelected,
        super(key: key);

  final Survey? _surveySelected;

  @override
  State<AnswerSurvey> createState() => _AnswerSurveyState();
}

class _AnswerSurveyState extends State<AnswerSurvey> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 4),
      ),
      child: widget._surveySelected != null
          ? Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sondages :',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica',
                fontSize: 25,
                color: pitaya,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: FutureBuilder(
                future:
                Polls.getAnswerByIdPolls(widget._surveySelected?.id),
                builder:
                    (BuildContext context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return const Center(
                        child:
                        CircularProgressIndicator(color: pitaya),
                      );
                      break;
                    case ConnectionState.done:
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("Error: ${snapshot.error}"),
                        );
                      }
                      if (snapshot.hasData) {
                        final List<Answer> answers = snapshot.data;
                        if (answers.isEmpty) {
                          return const Center(
                            child: Text(
                              "Aucune Réponse",
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Helvetica',
                                fontSize: 40,
                                color: Colors.black12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }
                        return DataTable(
                          horizontalMargin: 0,
                          columnSpacing: defaultPadding,
                          columns: const [
                            DataColumn(
                              label: Text("ID"),
                            ),
                            DataColumn(
                              label: Text("Réponse"),
                            ),
                          ],
                          rows: List.generate(
                            answers.length,
                                (index) => answerDataRow(answers[index]),
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text(
                            "Aucune réponse",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Helvetica',
                              fontSize: 40,
                              color: Colors.black12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
      )
          : const Center(
        child: Text(
          "Selectionnez un sondage",
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontFamily: 'Helvetica',
            fontSize: 40,
            color: Colors.black12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
