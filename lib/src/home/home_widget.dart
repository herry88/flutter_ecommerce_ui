import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';
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
  List<String>? _demoData;
  @override
  void initState() {
    // initializing state / demo data
    var productList = _productList;
    _demoData = [
      productList.toString(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          Duration(
            seconds: 1,
          ),
        );
      },
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: SearchWidget(),
          ),
          SliderWidget(),
          FlashSaleWidget(),
          FlashSaleSliderWidget(
            heroTag: 'home_flash_sales',
            productsList: _productList.flashSalesList,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 8.0,
            ),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: 0,
              ),
              leading: Icon(
                UiIcons.favorites,
                color: Theme.of(context).hintColor,
              ),
              title: Text(
                'Recommended Product KW',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
