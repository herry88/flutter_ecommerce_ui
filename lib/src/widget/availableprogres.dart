import 'package:flutter/material.dart';

class AvailableProgressBarWidget extends StatelessWidget {
  final double available;
  const AvailableProgressBarWidget({Key? key, required this.available})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: double.infinity,
        height: 4.0,
        decoration: BoxDecoration(
            color: Theme.of(context).focusColor,
            borderRadius: BorderRadius.circular(6)),
      ),
      Container(
        width: available,
        height: 4,
        decoration: BoxDecoration(
          color: available > 30
              ? Theme.of(context).accentColor
              : Colors.deepOrange,
          borderRadius: BorderRadius.circular(6),
        ),
      ),
    ]);
  }
}
