import 'package:backoffice_flutter/screens/login/components/pwd_frgt_form.dart';
import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../responsiveness.dart';
import 'label.dart';
import 'login_form.dart';

class ContaineForm extends StatefulWidget {
  const ContaineForm({
    Key? key,
  }) : super(key: key);

  @override
  State<ContaineForm> createState() => _ContaineFormState();
}

class _ContaineFormState extends State<ContaineForm> {

  bool _form = true;

  void changeForm (){
    setState(() {
      _form = _form ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (Responsive.isMobile(context))
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
              vertical: defaultPadding / 2,
            ),
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/images/logo-votaction-blanc.png',
              height: 50,
            ),
          ),
        _form ? FormConnexion(cb: changeForm,) : PasswordForgotten(cb: changeForm,),
        const LabelProject(),
      ],
    );
  }
}
