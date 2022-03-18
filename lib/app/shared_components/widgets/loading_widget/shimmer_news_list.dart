import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/style/app_color.dart';
import '../margins/main_margin.dart';
import '../margins/margin_bottom10.dart';

class ShimmerNewsList extends StatelessWidget {
  const ShimmerNewsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return ShimmerNews();
        },
      ),
      highlightColor: AppColor.color29,
      baseColor: AppColor.color28,
    );
  }
}

class ShimmerNews extends StatelessWidget {
  const ShimmerNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarginBottom10(
          child: Container(
            width: double.infinity,
            color: Colors.red,
            height: MediaQuery.of(context).size.width / 2,
          ),
        ),
        MarginBottom10(
          child: MainMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarginBottom10(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 20,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ),
                MarginBottom10(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ),
                MarginBottom10(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 10,
                    width: MediaQuery.of(context).size.width / 4,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
