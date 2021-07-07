import 'package:flutter/material.dart';
import 'package:flutteruinew/model/product.dart';

import 'flashsaleslideritem.dart';

// ignore: must_be_immutable
class FlashSaleSliderWidget extends StatelessWidget {
  List<Product>? productsList;
  String? heroTag;
  FlashSaleSliderWidget({Key? key, this.productsList, this.heroTag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.0,
      margin: EdgeInsets.only(
        top: 10.0,
      ),
      child: ListView.builder(
        itemCount: productsList!.length,
        itemBuilder: (context, index) {
          double _marginLeft = 0;
          (index == 0) ? _marginLeft = 20 : _marginLeft = 0;
          return FlashSaleSliderItemWidget(
            heroTag: this.heroTag,
            marginLeft: _marginLeft,
            product: productsList!.elementAt(index),
          );
        },
        scrollDirection: Axis.horizontal,
      ),
      
    );
  }
}
