import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String username;

  const UserAvatar({
    Key? key,
    this.username = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.grey,
            minRadius: 48,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: Image.asset('assets/images/rabbit.png'),
            )),
        const Padding(padding: EdgeInsets.fromLTRB(12, 0, 0, 0)),
        Text(username,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
      ],
    );
  }
}
