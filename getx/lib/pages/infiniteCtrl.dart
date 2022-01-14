// ignore_for_file: use_key_in_widget_constructors, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/getxControl.dart';

class InfiniteCtrl extends StatelessWidget {
  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('INFINITE SCROLL by CONTROL'),
      ),
      body: GetBuilder<Controller>(
        builder: (_) {
          return LayoutBuilder(builder: (ctx, constraints) {
            if (_.items.isNotEmpty) {
              return Stack(
                children: [
                  ListView.separated(
                      controller: _.scrollctrl,
                      itemBuilder: (ctx, idx) {
                        return ListTile(
                          title: Text(
                            _.items[idx],
                          ),
                        );
                      },
                      separatorBuilder: (ctx, idx) {
                        return const Divider(height: 1);
                      },
                      itemCount: _.items.length),
                  if (_.loading)
                    Positioned(
                        bottom: 16,
                        child: Container(
                          width: constraints.maxWidth,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          });
        },
      ),
    );
  }
}
