import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_image.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';

class DetailProductSliderImage extends StatefulWidget {
  const DetailProductSliderImage({Key? key}) : super(key: key);

  @override
  _DetailProductSliderImageState createState() =>
      _DetailProductSliderImageState();
}

class _DetailProductSliderImageState extends State<DetailProductSliderImage> {
  var _indexPage = 0;

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
              aspectRatio: 1,
              initialPage: 0,
            ),
            items: dummyImage.map(
              (e) {
                return Container(
                  child: Image.asset(
                    e.url,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ).toList(),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 10,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            decoration: BoxDecoration(
              color: color23,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${_indexPage + 1}/${dummyImage.length}",
              style: textStyle2.copyWith(
                color: color12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
