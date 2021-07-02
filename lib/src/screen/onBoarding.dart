import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutteruinew/config/app_config.dart' as config;
import 'package:flutteruinew/model/on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingWidget extends StatefulWidget {
  @override
  _OnBoardingWidgetState createState() => _OnBoardingWidgetState();
}

class _OnBoardingWidgetState extends State<OnBoardingWidget> {
  int _current = 0;
  OnBoardingList? _onBoardingList;
  @override
  void initState() {
    _onBoardingList = new OnBoardingList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor.withOpacity(0.96),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20, top: 50),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(height: 400.0),
              // onPageChanged: (index) {
              //   setState(() {
              //     _current = index;
              //   });
              // },
              items: _onBoardingList?.list?.map((OnBoarding boarding) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Image.asset(
                            boarding.image.toString(),
                            width: 500,
                          ),
                        ),
                        Container(
                          width: config.App(context).appWidth(75),
                          padding: const EdgeInsets.only(right: 20),
                          child: Text(
                            boarding.description.toString(),
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            Container(
              width: config.App(context).appWidth(75),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: _onBoardingList!.list!.map((OnBoarding boarding) {
                  return Container(
                    width: 25.0,
                    height: 3.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      color:
                          _current == _onBoardingList?.list?.indexOf(boarding)
                              ? Theme.of(context).hintColor.withOpacity(0.8)
                              : Theme.of(context).hintColor.withOpacity(0.2),
                    ),
                  );
                }).toList(),
              ),
            ),
            Container(
              width: config.App(context).appWidth(75),
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed('/SignUp');
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Sign up',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: config.Colors().secondColor(1),
                    ),
                  ],
                ),
                // shape: RoundedRectangleBorder(
                //   borderRadius: new BorderRadius.only(
                //     topLeft: Radius.circular(50),
                //     bottomLeft: Radius.circular(50),
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
