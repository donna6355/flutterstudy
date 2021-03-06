import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './providers/products.dart';

class Grid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final products = Provider.of<Products>(context).items;

    // return Center(
    //   child: ListView.builder(
    //     itemCount: products.length,
    //     itemBuilder: (context, idx) {
    //       return Container(
    //         decoration: BoxDecoration(
    //           color: Colors.blue[50],
    //         ),
    //         padding: EdgeInsets.all(10),
    //         margin: EdgeInsets.fromLTRB(0, 0, 0, 5),
    //         child: Column(
    //           children: [
    //             Text(
    //               products[idx].title,
    //               style: TextStyle(
    //                 fontSize: 20,
    //                 fontWeight: FontWeight.bold,
    //               ),
    //             ),
    //             Text(products[idx].contents),
    //           ],
    //         ),
    //       );
    //     },
    //   ),
    // );

    // better to use Consumer to get data and Provider is recommended for method only use.
    // put Consumer as deeper as possible to avoid any unnecessary rebuild.

    return Consumer<Products>(builder: (context, products, child) {
      return Center(
        child: ListView.builder(
          itemCount: products.items.length,
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
                    products.items[idx].title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(products.items[idx].contents),
                ],
              ),
            );
          },
        ),
      );
    });
  }
}
