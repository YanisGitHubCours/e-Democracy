import 'package:backoffice_flutter/models/survey.dart';
import 'package:backoffice_flutter/requests/polls.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';

class DetailSurvey extends StatefulWidget {
  final Survey? _surveySelected;
  final Function() reload;

  const DetailSurvey({
    Key? key,
    required Survey? surveySelected,
    required this.reload,
  })  : _surveySelected = surveySelected,
        super(key: key);

  @override
  State<DetailSurvey> createState() => _DetailSurveyState();
}

class _DetailSurveyState extends State<DetailSurvey> {
  @override
  Widget build(BuildContext context) {
    var ano;
    var finish;

    if (widget._surveySelected != null) {
      ano = widget._surveySelected?.isAnonym;
      finish = widget._surveySelected?.isFinish;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 4),
      ),
      child: widget._surveySelected != null
          ? Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Row(
                        children: [
                          const Text(
                            'Détails :',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Helvetica',
                              color: pitaya,
                              fontSize: 25,
                            ),
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () async {
                              if (await Polls.deleteSurvey(
                                  widget._surveySelected?.id)) {
                                widget.reload();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Erreur lors de la suppression rééssayez ultérieurement')),
                                );
                              }
                            },
                            child: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'ID : ${widget._surveySelected?.id}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  Text(
                                    'Nom : ${widget._surveySelected?.name}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  Text(
                                    'Type : ${widget._surveySelected?.type}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Accessibilité : ${ano ? 'Privé ' : 'Public'}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  Text(
                                    'Status : ${finish ? "Terminé" : "En cours"}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                  Text(
                                    'Timer : ${widget._surveySelected?.timer}',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: grey,
                                      fontFamily: 'Helvetica',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Text(
                          'Description : ${widget._surveySelected?.description}',
                          style: const TextStyle(
                            fontSize: 17,
                            color: grey,
                            fontFamily: 'Helvetica',
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            )
          : const Center(
              child: Text(
                "Sélectionnez un sondage",
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
