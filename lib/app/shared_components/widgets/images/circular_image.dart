import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';

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
            AssetsPath.dummyImage,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
