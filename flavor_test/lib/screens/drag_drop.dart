import 'package:flutter/material.dart';

class Test {
  final String name;
  final Color color;

  Test(this.name, this.color);
}

class DragAndDrop extends StatelessWidget {
  const DragAndDrop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Test> _customList = [
      Test('hello', Colors.green),
      Test('how', Colors.amber),
      Test('are', Colors.orange),
      Test('you', Colors.teal),
    ];
    return Scaffold(
      body: DragTarget(
        builder: (context, candidateItems, rejectedItems) {
          return ListView(
            children: _customList
                .map((el) => LongPressDraggable(
                    child: ListTile(
                      tileColor: el.color,
                      title: Text(el.name),
                    ),
                    feedback: Icon(Icons.dry_cleaning_rounded)))
                .toList(),
          );
        },
        //this drag and drop widgets for drop it in outside list!!!!! user reorderable widget to change order inside widget!
        //       onAccept: (item) {
        //   _itemDroppedOnCustomerCart(
        //     item: item,
        //     customer: customer,
        //   );
        // },
      ),
    );
  }
}
