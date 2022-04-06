import 'package:flutter/material.dart';

class InterViewTutorial extends StatelessWidget {
  const InterViewTutorial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Interactive Viewer')),
      body: Column(
        children: [
          const Text(
              'Interactive Viewer is for bigger things to show, It will allow to zoom n pan around'),
          const Text(
              'set constrained:false, but be careful about infinite layout!'),
          SizedBox(
            width: double.infinity,
            height: 500,
            child: InteractiveViewer(
                constrained: false,
                child: Image.network(
                  'https://html.com/wp-content/uploads/flamingo.webp',
                  width: 640,
                  height: 425,
                  fit: BoxFit.cover,
                )),
          )
        ],
      ),
    );
  }
}
