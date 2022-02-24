// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeroTrial extends StatelessWidget {
  const HeroTrial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Hero(
          tag: 'trial',
          child: FittedBox(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'img/issac.jpeg',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
