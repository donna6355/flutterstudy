// import 'package:flutter/material.dart';

class Custom {
  final String id;
  final String name;
  int views;

  Custom({
    required this.id,
    required this.name,
    this.views = 0,
  });

// singleton pattern
// Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class
  factory Custom.fromMap(Map<String, dynamic> data) {
    return Custom(
      id: (data['_id'] != null) ? data['_id'] ?? '' : '',
      name: (data['name'] != null) ? data['name'] ?? '' : '',
      views: (data['views'] != null) ? data['views'] ?? 0 : 0,
    );
  }
}
