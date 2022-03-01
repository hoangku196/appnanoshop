import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';

class CircularImage extends StatelessWidget {
  final double kImageHeight;

  const CircularImage({
    Key? key,
    this.kImageHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kImageHeight,
      height: kImageHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            AssetsSource.dummyImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
