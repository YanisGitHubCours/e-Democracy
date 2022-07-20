import 'package:flutter/material.dart';

import '../constants/constants.dart';

class InputForm extends StatelessWidget {

  const InputForm({
    Key? key,
    required this.title,
    required this.placeholder,
    required this.isPass,
    required this.inputController,
  }) : super(key: key);

  final String title, placeholder;
  final bool isPass;
  final TextEditingController inputController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Center(
        child: TextFormField(
          controller: inputController,
          obscureText: isPass,
          style: const TextStyle(
            fontFamily: "Helvetica",
            fontWeight: FontWeight.bold,
            color: grey,
          ),
          decoration: InputDecoration(
            labelText: title,
            labelStyle: const TextStyle(color: pitaya),
            hintText: placeholder,
            hintStyle:
            const TextStyle(color: Color(0x20000000), fontSize: 13),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}