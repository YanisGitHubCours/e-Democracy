import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../responsiveness.dart';
import '../../../widgets/custom_input.dart';

class PasswordForgotten extends StatelessWidget {
  final VoidCallback cb;

  const PasswordForgotten({
    Key? key,
    required this.cb,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();

    return Center(
      child: Container(
        alignment: Alignment.center,
        height: 586,
        width: 510,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              peach,
              pitaya,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 15,
              offset: Offset(0.0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: 0)
              : const EdgeInsets.symmetric(
              horizontal: defaultPadding * 3, vertical: 0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 0, vertical: defaultPadding * 3),
                child: Text(
                  "Mot de passe oublié",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Helvetica',
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              InputForm(
                title: "Adresse mail",
                placeholder: "Votre adresse mail",
                isPass: false,
                inputController: emailController,
              ),
              const SizedBox(height: defaultPadding * 2),
              const SizedBox(height: defaultPadding * 2),
              Container(
                height: 64,
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Connexion',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            cb();
                          }, //Navigation
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding * 0.8,
                            vertical: defaultPadding / 2),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/caret-forward.svg",
                              height: 23,
                              color: Color(0x6F000000),
                            ),
                            const Text(
                              "Envoyer",
                              style: TextStyle(
                                fontFamily: "Helvetica",
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Color(0x6F000000),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
