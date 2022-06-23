import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../models/user.dart';
import '../../../requests/users.dart';

class DetailsUser extends StatefulWidget {
  final User? _userSelected;
  final Function() reload;

  const DetailsUser({
    Key? key,
    required User? userSelected,
    required this.reload,
  })  : _userSelected = userSelected,
        super(key: key);

  @override
  State<DetailsUser> createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(defaultPadding / 4),
      ),
      child: widget._userSelected != null
          ? Column(
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
                          if (await Users.deleteUser(
                              widget._userSelected?.id)) {
                            widget.reload();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Erreur lors de la suppression rééssayez ultérieurement')),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Nom : ${widget._userSelected?.lastName}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: grey,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                'Prénom : ${widget._userSelected?.firstName}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: grey,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                'Pseudo : ${widget._userSelected?.pseudo}',
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ID : ${widget._userSelected?.id}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: grey,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                'Email : ${widget._userSelected?.email}',
                                style: const TextStyle(
                                  fontSize: 17,
                                  color: grey,
                                  fontFamily: 'Helvetica',
                                ),
                              ),
                              Text(
                                'Bio : ${widget._userSelected?.bio}',
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
                )
              ],
            )
          : const Center(
              child: Text(
                "Selectionnez un utilisateur",
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
