import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_image.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class DetailProductSliderImage extends StatefulWidget {
  final List<dynamic> images;

  const DetailProductSliderImage({
    Key? key,
    required this.images,
  }) : super(key: key);

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
            items: widget.images.map(
              (e) {
                return Container(
                  child: LoadImageFromNetwork(
                    url: e.path + e.name,
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
              color: AppColor.color23,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "${_indexPage + 1}/${widget.images.length}",
              style: TextStyleApp.textStyle2.copyWith(
                color: AppColor.color12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
