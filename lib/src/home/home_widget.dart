import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';
import 'package:flutteruinew/model/brand.dart';
import 'package:flutteruinew/model/category.dart';
import 'package:flutteruinew/src/widget/brandiconcarouselwidget.dart';
import 'package:flutteruinew/src/widget/categoryIconWidget.dart';
import 'package:flutteruinew/src/widget/flashsale.dart';
import 'package:flutteruinew/model/product.dart';
import 'package:flutteruinew/src/widget/flashsaleslider.dart';
import 'package:flutteruinew/src/widget/search.dart';
import 'package:flutteruinew/src/widget/sliderwidget.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:flutteruinew/src/widget/categoriproductwidget.dart';

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget>
    with SingleTickerProviderStateMixin {
  List<Product>? _productsOfCategoryList;
  List<Product>? _productsOfBrandList;
  CategoriesList _categoriesList = new CategoriesList();
  BrandsList? _brandsList = new BrandsList();
  ProductsList _productsList = new ProductsList();

  late Animation<double> animationOpacity;
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    CurvedAnimation curve = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );
    animationOpacity = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();

    _productsOfCategoryList = _categoriesList.list!.firstWhere((category) {
      return category.selected!;
    }).products;

    _productsOfBrandList = _brandsList!.list!.firstWhere((brand) {
      return brand.selected!;
    }).products;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: (){
        return Future.delayed(
          Duration(
            seconds: 1,
          ),
        );
      },
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchWidget(),
          ),
          SliderWidget(),
          FlashSaleWidget(),
          FlashSaleSliderWidget(
              heroTag: 'home_flash_sales',
              productsList: _productsList.flashSalesList),
          // Heading (Recommended for you)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
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
          StickyHeader(
            header: CategoriesIconsCarouselWidget(
                heroTag: 'home_categories_1',
                categoriesList: _categoriesList,
                onChanged: (id) {
                  setState(() {
                    animationController.reverse().then((f) {
                      _productsOfCategoryList =
                          _categoriesList.list!.firstWhere((category) {
                        return category.id == id;
                      }).products;
                      animationController.forward();
                    });
                  });
                }),
            content: CategorizedProductsWidget(
              animationOpacity: animationOpacity,
              productsList: _productsOfCategoryList,
            ),
          ),
          // Bagian brand
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: ListTile(
              dense: true,
              contentPadding: EdgeInsets.symmetric(vertical: 0),
              leading: Icon(
                UiIcons.flag,
                color: Theme.of(context).hintColor,
              ),
              title: Text('Brands', style: Theme.of(context).textTheme.headline4),
            ),
          ),
          StickyHeader(
            header: BrandsIconsCarouselWidget(
                heroTag: 'home_brand_1',
                brandsList: _brandsList,
                onChanged: (id) {
                  setState(() {
                    animationController.reverse().then((f) {
                      _productsOfBrandList = _brandsList!.list!.firstWhere((brand) {
                        return brand.id == id;
                      }).products;
                      animationController.forward();
                    });
                  });
                }),
            content: CategorizedProductsWidget(
                animationOpacity: animationOpacity,
                productsList: _productsOfBrandList),
          ),
        ],
      ),
    );

  }
}
