import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutteruinew/model/slider.dart';
import 'package:flutteruinew/model/slider.dart' as profix_0;

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int _current = 0;
  SliderList _sliderList = SliderList();
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            viewportFraction: 1.0,
            autoPlayInterval: Duration(
              seconds: 5,
            ),
            height: 240.0,
            // onPageChanged: (index){
            //     setState(() {
            //       _current = index;
            //     });
            // }
          ),
          items: _sliderList.list!.map((profix_0.Slider slide) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 20.0,
                  ),
                  height: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(slide.image.toString()),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        )
      ],
    );
  }
}
