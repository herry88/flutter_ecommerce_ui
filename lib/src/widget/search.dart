import 'package:flutter/material.dart';
import 'package:flutteruinew/config/icons.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(
          10.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).hintColor.withOpacity(0.10),
            offset: Offset(0, 4),
            blurRadius: 10,
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(12),
              hintText: 'Search',
              hintStyle: TextStyle(color: Theme.of(context).primaryColor.withOpacity(0.8)),
              prefixIcon: Icon(UiIcons.loupe, size: 20, color: Theme.of(context).primaryColor),
              border: UnderlineInputBorder(borderSide: BorderSide.none),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
          )
        ],
      ),
    );
  }
}
