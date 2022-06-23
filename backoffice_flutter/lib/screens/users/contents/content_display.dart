import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import '../../../models/user.dart';
import '../../../requests/users.dart';
import '../../../widgets/user_item.dart';
import '../components/detail_user.dart';
import '../components/survey_linked.dart';

class ContentDisplay extends StatefulWidget {
  const ContentDisplay({Key? key}) : super(key: key);

  @override
  State<ContentDisplay> createState() => _ContentDisplayState();
}

class _ContentDisplayState extends State<ContentDisplay> {
  User? _userSelected;

  void _displayUserData(User? userClicked) {
    setState(() {
      _userSelected = userClicked;
    });
  }

  void _reload() {
    setState(() {
      _userSelected = null;
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
                        'Utilisateurs :',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Helvetica',
                        ),
                      ),
                    ),
                    Expanded(
                      child: FutureBuilder(
                        future: Users.getUsers(),
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
                                final List<User> users = snapshot.data;
                                if (users.isEmpty) {
                                  return const Center(
                                    child: Text(
                                      "Aucun utilisateur",
                                      style: TextStyle(color: grey),
                                    ),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: users.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return UserItem(
                                      user: users[index],
                                      click: _displayUserData,
                                      isSelected:
                                          users[index].id == _userSelected?.id,
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
              flex: 3,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: DetailsUser(userSelected: _userSelected, reload: _reload,),
                  ),
                  const SizedBox(height: defaultPadding),
                  Expanded(
                    flex: 2,
                    child: SurveyLinked(userSelected: _userSelected),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
