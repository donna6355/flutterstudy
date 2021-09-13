import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).items;

    return Center(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, idx) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Column(
              children: [
                Text(
                  products[idx].title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(products[idx].contents),
              ],
            ),
          );
        },
      ),
    );
  }
}
