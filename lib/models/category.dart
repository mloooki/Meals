import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    // const means the property can't change of the object after the object has been created.
    @required this.id,
    @required this.title,
    this.color = Colors
        .orange, // defualt color will be orange if we did not pass a color.
  });
}
