import 'package:flutter/material.dart';

class MsgBubble extends StatelessWidget {
  final String msg;
  final String userName;
  final String userImage;
  final bool fromMe;
  final Key key;
  MsgBubble(
    this.msg,
    this.userName,
    this.userImage,
    this.fromMe,
    this.key,
  );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              fromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: fromMe
                    ? Colors.black12
                    : Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.only(
                  bottomLeft: fromMe ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      fromMe ? Radius.circular(0) : Radius.circular(12),
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment:
                    fromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  if (!fromMe)
                    Text(
                      userName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(
                    msg,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: fromMe ? 130 : null,
          left: fromMe ? null : 130,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              userImage,
            ),
          ),
        ),
      ],
      clipBehavior: Clip.none,
    );
  }
}
