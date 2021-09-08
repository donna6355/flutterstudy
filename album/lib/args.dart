import 'package:flutter/material.dart';

class Args extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routerArgs = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: Text('Full Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              Image.asset('asset/$routerArgs.png'),
              SizedBox(
                height: 20,
              ),
              Text(
                'Title: $routerArgs',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
