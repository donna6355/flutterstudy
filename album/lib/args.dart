import 'package:flutter/material.dart';

class Args extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routerArgs = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(routerArgs),
      ),
      body: Center(
        child: Text(routerArgs),
      ),
    );
  }
}
