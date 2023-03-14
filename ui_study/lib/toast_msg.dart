import 'package:flutter/material.dart';

class ToastMsg extends StatelessWidget {
  const ToastMsg({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.brown, //TODO
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(children: [
        // Padding(
        //   padding: const EdgeInsets.fromLTRB(31, 14, 18, 14),
        //   child: Image.asset(name),
        // ),
        // Text(),
      ]),
    );
  }
}
