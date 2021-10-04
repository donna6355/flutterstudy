import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = new TextEditingController();
  var _enteredMsg = '';

  void _sendMsg() async {
    FocusScope.of(context).unfocus();
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final userData =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text': _enteredMsg,
      'time': Timestamp.now(),
      'userId': uid,
      'userName': userData['username'],
      'userImage': userData['image_url']
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      padding: EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: 'Send a message....'),
              onChanged: (val) {
                setState(() {
                  _enteredMsg = val;
                });
              },
            ),
          ),
          IconButton(
            color: Theme.of(context).primaryColor,
            onPressed: _enteredMsg.trim().isEmpty ? null : _sendMsg,
            icon: Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
