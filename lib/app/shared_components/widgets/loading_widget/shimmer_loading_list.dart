import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../utils/style/app_color.dart';
import '../margins/main_margin.dart';
import '../margins/margin_bottom10.dart';

class ShimmerLoadingList extends StatelessWidget {
  const ShimmerLoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppColor.color29,
      baseColor: AppColor.color28,
      child: MarginBottom10(
        child: MainMargin(
          child: StaggeredGridView.count(
            staggeredTiles: List.filled(10, "a")
                .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                .toList(),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            children: List.filled(10, "a")
                .map(
                  (e) => ShimmerContainer(),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class ShimmerContainer extends StatelessWidget {
  const ShimmerContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MarginBottom10(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(5),
                topLeft: Radius.circular(5),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                width: MediaQuery.of(context).size.width / 2,
                height: MediaQuery.of(context).size.width / 2,
              ),
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
    );
  }
}
