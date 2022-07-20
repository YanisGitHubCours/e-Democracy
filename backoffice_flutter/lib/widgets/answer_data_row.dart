import 'package:backoffice_flutter/models/answer.dart';
import 'package:flutter/material.dart';

DataRow answerDataRow(Answer answer) {
  return DataRow(
    onLongPress: () {},
    cells: [
      DataCell(
        Text(answer.id),
      ),
      DataCell(
        Text(answer.content),
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