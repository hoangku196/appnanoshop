import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;

import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/logic/blocs/product_bloc/product_bloc.dart';
import 'package:nanoshop_app/app/logic/event/product_event/product_event.dart';
import 'package:nanoshop_app/app/logic/state/product_state/product_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/slider_image/main_slider_image.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../shared_components/widgets/loading_widget/shimmer_loading_list.dart';
import '../../../utils/repository/product_repository/product_repository.dart';
import '../home_screen/page/home_page/widgets/product_grid_tile.dart';

class ListProductScreen extends StatefulWidget {
  final dynamic argument;

  const ListProductScreen({
    Key? key,
    this.argument,
  }) : super(key: key);

  @override
  State<ListProductScreen> createState() => _ListProductScreenState();
}

class _ListProductScreenState extends State<ListProductScreen> {
  ProductBloc _productBloc = ProductBloc(
    productRepository: ProductRepository(),
  )..add(
      InitialProductEvent(),
    );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        title: widget.argument.title,
      ),
      body: FlutterBloc.BlocBuilder<ProductBloc, ProductState>(
        bloc: _productBloc,
        builder: (context, ProductState state) {
          if (state is LoadedProductState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  //   child: MainSliderImage(
                  //     borderRadius: BorderRadius.circular(8),
                  //   ),
                  // ),
                  MainMargin(
                    child: MarginBottom10(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '(Có 30 sản phẩm phù hợp)',
                            style: TextStyleApp.textStyle4.copyWith(
                              color: AppColor.color12,
                            ),
                          ),
                          Row(
                            children: [
                              Image.asset(AssetsPath.shortIcon),
                              SizedBox(
                                width: 16,
                              ),
                              Image.asset(AssetsPath.filterIcon),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  MainMargin(
                    child: StaggeredGridView.count(
                      staggeredTiles: state.listProduct
                          .map<StaggeredTile>((_) => StaggeredTile.fit(1))
                          .toList(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.0,
                      mainAxisSpacing: 15.0,
                      children: state.listProduct
                          .map(
                            (e) => ProductGridTile(model: e),
                      )
                          .toList(),
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is LoadingProductState) {
            return ShimmerLoadingList();
          }

          return Container();
        },
      ),
    );
  }
}
