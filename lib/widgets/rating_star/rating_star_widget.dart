import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';

class RatingStarWidget extends StatelessWidget {
  final double rating;
  final double kSizeStar;

  final total = 5;

  const RatingStarWidget({
    Key? key,
    this.kSizeStar = 18,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        total,
        (index) {
          return rating > index + 1
              ? Icon(
                  Icons.star,
                  color: color26,
                  size: kSizeStar,
                )
              : rating >= index + 0.5
                  ? Icon(
                      Icons.star_half,
                      color: color26,
                      size: kSizeStar,
                    )
                  : Icon(
                      Icons.star_border,
                      color: color10,
                      size: kSizeStar,
                    );
        },
      ),
    );
  }
}
