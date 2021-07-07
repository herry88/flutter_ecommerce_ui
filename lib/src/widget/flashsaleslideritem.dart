import 'package:flutter/material.dart';
import 'package:flutteruinew/model/product.dart';

import 'availableprogres.dart';

// ignore: must_be_immutable
class FlashSaleSliderItemWidget extends StatelessWidget {
  String? heroTag;
  double marginLeft;
  Product? product;
  FlashSaleSliderItemWidget({
    Key? key,
    this.heroTag,
    required this.marginLeft,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //ini nanti
      },
      child: Container(
        margin: EdgeInsets.only(left: this.marginLeft, right: 20),
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: <Widget>[
            Hero(
              tag: heroTag! + product!.id.toString(),
              child: Container(
                width: 160,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(product!.image.toString()),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 6,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Theme.of(context).accentColor),
                alignment: AlignmentDirectional.topEnd,
                child: Text(
                  '${product!.discount} %',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .merge(TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 170),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: 140,
              height: 113,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: Theme.of(context).hintColor.withOpacity(0.15),
                        offset: Offset(0, 3),
                        blurRadius: 10)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product!.name.toString(),
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 1,
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
                  Row(
                    children: <Widget>[
                      // The title of the product
                      Expanded(
                        child: Text(
                          '${product!.sales} Sales',
                          style: Theme.of(context).textTheme.bodyText2,
                          overflow: TextOverflow.fade,
                          softWrap: false,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Text(
                        product!.rate.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.center,
                  ),
                  SizedBox(height: 7),
                  Text(
                    '${product!.available} Available',
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  AvailableProgressBarWidget(
                    available: product!.available!.toDouble(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
