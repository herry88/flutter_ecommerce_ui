import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';

class ShoppingCartButton extends StatelessWidget {
  final Color? iconColor;
  final Color? labelColor;
  final int? labelCount;
  const ShoppingCartButton({
    this.iconColor,
    this.labelColor,
    this.labelCount = 0,
  });
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: Stack(
        alignment: AlignmentDirectional.topEnd,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Icon(
              UiIcons.shopping_cart,
              color: this.iconColor,
              size: 28,
            ),
          ),
          Container(
            child: Text(
              this.labelCount.toString(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.caption!.merge(
                    TextStyle(
                      color: Colors.teal,
                      fontSize: 9,
                    ),
                  ),
            ),
            padding: EdgeInsets.all(0),
            decoration: BoxDecoration(
              
              color: this.labelColor,
              
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            constraints: BoxConstraints(
                minWidth: 15, maxWidth: 15, minHeight: 15, maxHeight: 15),
          ),
        ],
      ),
    );
  }
}
