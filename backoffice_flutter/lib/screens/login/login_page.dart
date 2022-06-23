import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../../responsiveness.dart';
import 'components/contain_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 7,
            child: Container(
              height: double.infinity,
              width: double.infinity,
              decoration: const BoxDecoration(
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
                    blurRadius: 16,
                    offset: Offset(10, 0),
                  ),
                ],
              ),
              child: ContaineForm(),
            ),
          ),
          if (!Responsive.isMobile(context))
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 0, vertical: defaultPadding * 3),
                  child: Column(
                    children: [
                      Image.asset(
                        'images/logo-votaction.png',
                        height: 200,
                      ),
                      const SizedBox(height: defaultPadding * 2),
                      Text(
                        "Votaction",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.getFont(
                          'Oleo Script',
                          textStyle: const TextStyle(
                            fontSize: 60,
                            fontFamily: "Helvetica",
                            fontWeight: FontWeight.bold,
                            color: pitaya,
                          ),
                        ),
                      ),
                      const Text(
                        "Espace Administrateur",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Helvetica",
                          fontWeight: FontWeight.normal,
                          color: pitaya,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
