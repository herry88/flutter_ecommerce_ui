import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';
import 'package:intl/intl.dart' show DateFormat;

class FlashSaleWidget extends StatefulWidget {
  const FlashSaleWidget({Key? key}) : super(key: key);

  @override
  _FlashSaleWidgetState createState() => _FlashSaleWidgetState();
}

class _FlashSaleWidgetState extends State<FlashSaleWidget> {
  String? _timer;
  @override
  void initState() {
    _initTimer();
    super.initState();
  }

  void _initTimer() {
    var _now = DateTime.now();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          _now = _now.subtract(Duration(seconds: 1));
          _timer = DateFormat('HH:mm:ss').format(_now);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.symmetric(
          vertical: 0,
        ),
        leading: Icon(
          UiIcons.megaphone,
          color: Theme.of(context).hintColor,
        ),
        title: Text(
          'Flash Sale',
          style: Theme.of(context).textTheme.headline4,
        ),
        trailing: Text('End in $_timer'),
      ),
    );
  }
}
