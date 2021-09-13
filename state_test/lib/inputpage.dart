import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './product.dart';
import './providers/products.dart';

class InputPage extends StatelessWidget {
  final titleControl = TextEditingController();
  final contentControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _submit() {
      Provider.of<Products>(
        context,
        listen: false,
      ).addProduct(Product(
          contents: contentControl.text,
          id: 'abc999',
          title: titleControl.text));
      Navigator.of(context).pushNamed('/');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Input Items'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Please input title'),
              controller: titleControl,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Please input descriptions'),
              controller: contentControl,
            ),
            ElevatedButton(
              onPressed: () {
                _submit();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
