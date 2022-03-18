import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/features/screens/starter_screen/widgets/indicator_page_view.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_image.dart';

import '../images/load_image_from_network.dart';

class MainSliderImage extends StatefulWidget {
  final BorderRadius borderRadius;
  final List<String> images;

  const MainSliderImage({
    Key? key,
    required this.images,
    this.borderRadius = BorderRadius.zero,
  }) : super(key: key);

  @override
  _MainSliderImageState createState() => _MainSliderImageState();
}

class _MainSliderImageState extends State<MainSliderImage> {
  var _indexPage = 0;

  CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          MarginBottom10(
            child: Container(
              child: CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  onPageChanged: (index, _) {
                    _indexPage = index;
                    setState(() {});
                  },
                  autoPlay: false,
                  viewportFraction: 0.8,
                  aspectRatio: 16 / 9,
                  initialPage: 0,
                ),
                items: widget.images.map(
                  (e) {
                    return Container(
                      margin: const EdgeInsets.only(right: 15),
                      child: ClipRRect(
                        borderRadius: widget.borderRadius,
                        child: LoadImageFromNetwork(
                          url: e,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              widget.images.length,
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
      ),
    );
  }
}
