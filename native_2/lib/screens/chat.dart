import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import '../widget/message.dart';
import '../widget/new_message.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Chat'),
        actions: [
          DropdownButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                value: 'logout',
                child: Container(
                  child: Row(
                    children: [
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (item) {
              if (item == 'logout') FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Message(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
