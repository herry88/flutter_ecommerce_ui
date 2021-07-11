import 'package:flutter/material.dart';
import 'package:flutteruinew/model/category.dart';
import 'package:flutteruinew/model/routeargument.dart';

// ignore: must_be_immutable
class CategoryWidget extends StatefulWidget {
  RouteArgument? routeArgument;
  Category? _category;
  CategoryWidget({Key? key, this.routeArgument}){
    _category = this.routeArgument!.argumentsList[0] as Category;
  }

  @override
  _CategoryWidgetState createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
