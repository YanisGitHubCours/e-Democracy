import 'package:backoffice_flutter/models/survey.dart';
import 'package:flutter/material.dart';

DataRow surveyDataRow(Survey survey) {
  return DataRow(
    onLongPress: () {},
    cells: [
      DataCell(
        Text(survey.id),
      ),
      DataCell(
        Text(survey.name),
      ),
      DataCell(
        Text(survey.type),
      ),
      DataCell(
        Text(survey.isAnonym ? "Oui" : "Non"),
      ),
      DataCell(
        Text(survey.timer),
      ),
      DataCell(
        Text(survey.isFinish ? "Terminé" : "En cours"),
      ),
    ],
  );
}

/*
    this.name,
    this.description,
    this.type,
    this.isAnonym,
    this.isFinish,
    this.timer,
*/