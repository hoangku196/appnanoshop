import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nanoshop_app/screens/starter_screen/widgets/indicator_page_view.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_image.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';

class MainSliderImage extends StatefulWidget {
  const MainSliderImage({Key? key}) : super(key: key);

  @override
  _MainSliderImageState createState() => _MainSliderImageState();
}

class _MainSliderImageState extends State<MainSliderImage> {
  var _indexPage = 0;

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MarginBottom10(
          child: CarouselSlider(
            carouselController: _carouselController,
            options: CarouselOptions(
              onPageChanged: (index, _) {
                _indexPage = index;
                setState(() {});
              },
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 2.0,
              initialPage: 0,
            ),
            items: dummyImage.map(
              (e) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    e.url,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).toList(),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            dummyImage.length,
            (index) {
              return IndicatorPageView(
                height: 4,
                isActive: index == _indexPage ? true : false,
                onTap: () {
                  if (_indexPage != index) {
                    // _pageController.animateToPage(index,
                    //     duration: Duration(milliseconds: 1000),
                    //     curve: Curves.fastOutSlowIn);
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
