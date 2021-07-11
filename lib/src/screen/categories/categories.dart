import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({Key? key}) : super(key: key);

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(
        8.0,
      ),
      child: Image.asset(
        'img/under.png',
        height: 150.0,
        width: 100.0,
      ),
    ));
  }
}
