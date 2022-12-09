import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.5,
                enableInfiniteScroll: true,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
              ),
              items: [
                Image.asset("assets/images/slide1.png"),
                Image.asset("assets/images/slide2.png"),
                Image.asset("assets/images/slide3.png"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
