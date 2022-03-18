import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:shimmer/shimmer.dart';

import '../../../features/screens/starter_screen/widgets/indicator_page_view.dart';

class ShimmerSlider extends StatelessWidget {
  const ShimmerSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColor.color29,
      baseColor: AppColor.color28,
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: MarginBottom10(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Icon(
                      Icons.image_rounded,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) {
                  return IndicatorPageView(
                    height: 4,
                    isActive: false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
