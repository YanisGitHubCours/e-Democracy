import 'package:backoffice_flutter/constants/constants.dart';
import 'package:flutter/material.dart';

import '../models/user.dart';

class UserItem extends StatelessWidget {
  final User user;
  final Function(User?) click;
  final bool isSelected;

  const UserItem({
    Key? key,
    required this.user,
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
          Icons.person,
          color: isSelected ? Colors.white : pitaya,
        ),
        title: Text(
          user.email,
          style: TextStyle(
            color: isSelected ? Colors.white : grey,
            fontFamily: "Helvetica",
          ),
        ),
        subtitle: Text(
          user.id,
          style: TextStyle(
            fontFamily: 'Helvetica',
            color: isSelected ? Colors.white : pitaya,
          ),
        ),
        onTap: () {
          click(user);
        },
      ),
    );
  }
}
