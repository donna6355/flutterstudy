import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BadgeSample extends StatelessWidget {
  const BadgeSample({super.key});

  @override
  Widget build(BuildContext context) {
    return badges.Badge(
      position: badges.BadgePosition.topEnd(top: -10, end: -12),
      showBadge: true,
      ignorePointer: false,
      onTap: () {},
      badgeContent: Icon(Icons.check, color: Colors.white, size: 10),
      badgeAnimation: badges.BadgeAnimation.rotation(
        animationDuration: Duration(seconds: 1),
        colorChangeAnimationDuration: Duration(seconds: 1),
        loopAnimation: false,
        curve: Curves.fastOutSlowIn,
        colorChangeAnimationCurve: Curves.easeInCubic,
      ),
      badgeStyle: badges.BadgeStyle(
        shape: badges.BadgeShape.square,
        badgeColor: Colors.blue,
        padding: EdgeInsets.all(5),
        borderRadius: BorderRadius.circular(4),
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderGradient:
            badges.BadgeGradient.linear(colors: [Colors.red, Colors.black]),
        badgeGradient: badges.BadgeGradient.linear(
          colors: [Colors.blue, Colors.yellow],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        elevation: 0,
      ),
      child: Text('Badge'),
    );
  }
}
