import 'package:backoffice_flutter/constants/constants.dart';
import 'package:backoffice_flutter/models/survey.dart';
import 'package:flutter/material.dart';

import '../models/survey.dart';

class SurveyItem extends StatelessWidget {
  final Survey survey;
  final Function(Survey?) click;
  final bool isSelected;

  const SurveyItem({
    Key? key,
    required this.survey,
    required this.click,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: defaultPadding / 4),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultPadding / 4),
        ),
        tileColor: isSelected ? pitaya : Colors.white,
        leading: Icon(
          Icons.poll,
          color: isSelected ? Colors.white : pitaya,
        ),
        title: Text(
          survey.name,
          style: TextStyle(
            color: isSelected ? Colors.white : grey,
            fontFamily: "Helvetica",
          ),
        ),
        subtitle: Text(
          survey.id,
          style: TextStyle(
            fontFamily: 'Helvetica',
            color: isSelected ? Colors.white : pitaya,
          ),
        ),
        onTap: () {
          click(survey);
        },
      ),
    );
  }
}
