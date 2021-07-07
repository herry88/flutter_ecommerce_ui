import 'package:flutter/material.dart';
import 'package:flutteruinew/src/widget/flashsale.dart';
import 'package:flutteruinew/model/product.dart';
import 'package:flutteruinew/src/widget/flashsaleslider.dart';
import 'package:flutteruinew/src/widget/search.dart';
import 'package:flutteruinew/src/widget/sliderwidget.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ProductsList _productList = ProductsList();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: SearchWidget(),
        ),
        SliderWidget(),
        FlashSaleWidget(),
        FlashSaleSliderWidget(heroTag:'home_flash_sales', productsList: _productList.flashSalesList),
      ],
    );
  }
}
