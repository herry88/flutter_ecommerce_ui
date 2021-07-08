import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutteruinew/model/product.dart';
import 'package:flutteruinew/src/widget/productgridwidget.dart';

// ignore: must_be_immutable
class CategorizedProductsWidget extends StatelessWidget {
  CategorizedProductsWidget({
    Key? key,
    required this.animationOpacity,
    List<Product>? productsList,
  })  : _productsList = productsList,
        super(key: key);

  Animation<double> animationOpacity;
  final List<Product>? _productsList;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animationOpacity,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: new StaggeredGridView.countBuilder(
          primary: false,
          shrinkWrap: true,
          crossAxisCount: 4,
          itemCount: _productsList!.length,
          itemBuilder: (BuildContext context, int index) {
            Product product = _productsList!.elementAt(index);
            return ProductGridItemWidget(
              product: product,
              heroTag: 'categorized_products_grid',
            );
          },
          staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
      ),
    );
  }
}
