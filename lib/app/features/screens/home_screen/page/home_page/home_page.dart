import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;

import 'package:nanoshop_app/app/config/router/home_page_router.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/features/screens/detail_product_screen/arguments/detail_product_argument_screen.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/pages/models/category_argument_screen.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/widgets/hot_item_product_list_tile.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/widgets/product_grid_tile.dart';
import 'package:nanoshop_app/app/features/screens/home_screen/page/home_page/widgets/title_with_route_container.dart';
import 'package:nanoshop_app/app/features/screens/list_product_screen/arguments/list_product_argument_screen.dart';
import 'package:nanoshop_app/app/features/screens/starter_screen/widgets/indicator_page_view.dart';
import 'package:nanoshop_app/app/logic/blocs/banner_bloc/banner_bloc.dart';
import 'package:nanoshop_app/app/logic/blocs/category_bloc/category_bloc.dart';
import 'package:nanoshop_app/app/logic/blocs/product_bloc/product_bloc.dart';
import 'package:nanoshop_app/app/logic/event/banner_event/banner_event.dart';
import 'package:nanoshop_app/app/logic/event/category_event/category_event.dart';
import 'package:nanoshop_app/app/logic/event/product_event/product_event.dart';
import 'package:nanoshop_app/app/logic/state/banner_state/banner_state.dart';
import 'package:nanoshop_app/app/logic/state/category_state/category_state.dart';
import 'package:nanoshop_app/app/shared_components/animations/ease_out_from_right_animation.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/loading_widget/shimmer_loading_list.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/app/shared_components/widgets/slider_image/main_slider_image.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_product.dart';
import 'package:nanoshop_app/app/utils/global_key/global_key_app.dart';
import 'package:nanoshop_app/app/utils/repository/banner_respository/banner_repository.dart';
import 'package:nanoshop_app/app/utils/repository/product_repository/product_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../../../../logic/state/product_state/product_state.dart';
import '../../../../../shared_components/widgets/loading_widget/shimmer_slider.dart';
import '../../../../providers/shopping_cart_provider.dart';
import 'widgets/home_page_app_bar.dart';

class HomePage extends StatefulWidget {
  final dynamic idRoute;

  const HomePage({
    Key? key,
    required this.idRoute,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BannerBloc _bannerBloc = BannerBloc(
    bannerRepository: BannerRepository(),
  )..add(
      BannerEvent(),
    );

  CategoryBloc _categoryBloc = CategoryBloc(
    productRepository: ProductRepository(),
  )..add(
      CategoryEvent(),
    );

  ProductBloc _newProductBloc = ProductBloc(
    productRepository: ProductRepository(),
  )..add(
      InitialProductEvent(
        isNew: '1',
      ),
    );

  ProductBloc _productBloc = ProductBloc(
    productRepository: ProductRepository(),
  )..add(
      InitialProductEvent(),
    );

  Future<void> _onRefresh() async {
    // _bannerBloc.add(
    //   BannerEvent(),
    // );

    await _bannerBloc.refreshBanner();
    await _categoryBloc.refreshCategory();
    await _newProductBloc.refreshList();
    await _productBloc.refreshList();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.MultiBlocProvider(
      providers: [
        FlutterBloc.BlocProvider(
          create: (_) => _bannerBloc,
        ),
        FlutterBloc.BlocProvider(
          create: (_) => _categoryBloc,
        ),
        FlutterBloc.BlocProvider(
          create: (_) => _newProductBloc,
        ),
        FlutterBloc.BlocProvider(
          create: (_) => _productBloc,
        ),
      ],
      child: Scaffold(
        appBar: HomePageAppBar(),
        body: RefreshIndicator(
          onRefresh: _onRefresh,
          child: SingleChildScrollView(
            child: Column(
              children: [
                CategoryFragment(),
                MarginBottom10(
                  child: HotProductFragment(
                    idRoute: widget.idRoute,
                    newProduct: _newProductBloc,
                  ),
                ),
                MarginBottom10(
                  child: MainMargin(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        AssetsPath.bannerHomePage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                MarginBottom10(
                  child: ProductFragment(
                    productBloc: _productBloc,
                  ),
                ),
                MarginBottom10(
                  child: MainMargin(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        AssetsPath.bannerHomePage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Danh mục
class CategoryFragment extends StatelessWidget {
  const CategoryFragment({Key? key}) : super(key: key);

  Widget _itemCategory(dynamic model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      // decoration: BoxDecoration(
      //   border: Border(
      //     top: BorderSide(width: 0.48, color: AppColor.color8.withOpacity(0.3)),
      //     bottom:
      //         BorderSide(width: 0.48, color: AppColor.color8.withOpacity(0.3)),
      //     left:
      //         BorderSide(width: 0.48, color: AppColor.color8.withOpacity(0.3)),
      //   ),
      // ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MarginBottom20(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.color1.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    width: 57,
                    height: 57,
                  ),
                ),
                Center(
                  child: Container(
                    width: 57,
                    height: 57,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: AppColor.color20,
                      ),
                    ),
                    child: Container(
                      width: 44,
                      height: 38,
                      alignment: Alignment.bottomCenter,
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LoadImageFromNetwork(
                          url: model.imagePath + model.imageName,
                          kHeightErrorIcon: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 57,
            child: Center(
              child: Text(
                model.catName,
                style: TextStyleApp.textStyle4.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) => Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: BackgroundApp(),
          ),
          Column(
            children: [
              FlutterBloc.BlocBuilder<BannerBloc, BannerState>(
                builder: (context, BannerState state) {
                  if (state is LoadingBanner) {
                    return ShimmerSlider();
                  }
                  if (state is LoadedBanner) {
                    return MainSliderImage(
                      images: state.images,
                      borderRadius: BorderRadius.circular(8),
                    );
                  }

                  return Container();
                },
              ),
              MainMargin(
                child: MarginBottom10(
                  child: TitleWithRouteContainer(
                    callbackScreen: state is LoadedCategory
                        ? () {
                            Get.toNamed(
                              HomePageRouter.category,
                              id: GlobalKeyApp.idHomeAppNav,
                              arguments: CategoryArgumentScreen(
                                categories: state.categories,
                              ),
                            );
                          }
                        : () {},
                    title: 'Danh mục',
                  ),
                ),
              ),
              if (state is LoadedCategory)
                EaseOutFromRightAnimation(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: state.categories
                                .map(
                                  (e) => _itemCategory(e),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

// Sản phẩm mới
class HotProductFragment extends StatefulWidget {
  final dynamic idRoute;

  final ProductBloc newProduct;

  const HotProductFragment({
    Key? key,
    this.idRoute,
    required this.newProduct,
  }) : super(key: key);

  @override
  State<HotProductFragment> createState() => _HotProductFragmentState();
}

class _HotProductFragmentState extends State<HotProductFragment> {
  var _currentIndex = 0;

  Widget containerTitle({required BuildContext context}) {
    return Stack(
      children: [
        Container(
          child: Image.asset(
            AssetsPath.flashSaleDecor,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AssetsPath.flashSaleText),
            ],
          ),
        ),
        // Positioned(
        //   top: 0,
        //   bottom: 0,
        //   left: 20,
        //   right: 20,
        //   child: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 10),
        //     decoration: BoxDecoration(
        //       color: AppColor.color5,
        //       borderRadius: BorderRadius.circular(50),
        //       border: Border.all(
        //         color: AppColor.color9,
        //         width: 10,
        //       ),
        //     ),
        //     child: Center(
        //       child: Text(
        //         'Sản phẩm mới'.toUpperCase(),
        //         style: TextStyleApp.textStyle5,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.BlocBuilder(
      bloc: widget.newProduct,
      builder: (context, ProductState state) {
        if (state is LoadedProductState) {
          return Container(
            height: 520,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Image.asset(
                    AssetsPath.flashSaleBackground,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: containerTitle(context: context),
                ),
                Positioned(
                  top: 120,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Column(
                    children: [
                      Container(
                        height: 350,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.listProduct.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return EaseOutFromRightAnimation(
                              delay: 0.5,
                              child: HotItemProductListTile(
                                model: state.listProduct[index],
                                onTap: () {
                                  Get.toNamed(
                                    RouterApp.detailProductScreen,
                                    // id: GlobalKeyApp.idMainAppNav,
                                    arguments: DetailProductArgumentScreen(
                                      model: state.listProduct[index],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                      // Expanded(
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: List.generate(
                      //       state.listProduct.length,
                      //       (index) {
                      //         return IndicatorPageView(
                      //           height: 4,
                      //           isActive: _currentIndex == index ? true : false,
                      //           onTap: () {
                      //             // if (_indexPage != index) {
                      //             //   // _pageController.animateToPage(index,
                      //             //   //     duration: Duration(milliseconds: 1000),
                      //             //   //     curve: Curves.fastOutSlowIn);
                      //             // }
                      //           },
                      //         );
                      //       },
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        if (state is LoadingProductState) {
          return ShimmerSlider();
        }

        return Container();
      },
    );
  }
}

class ProductFragment extends StatelessWidget {
  final ProductBloc productBloc;

  const ProductFragment({
    Key? key,
    required this.productBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MainMargin(
          child: MarginBottom10(
            child: TitleWithRouteContainer(
              callbackScreen: () {
                Get.toNamed(
                  RouterApp.listProductScreen,
                  arguments: ListProductArgumentScreen(
                    title: "Sản phẩm",
                  ),
                );
              },
              title: 'Sản phẩm',
              textColor: AppColor.color11,
            ),
          ),
        ),
        FlutterBloc.BlocBuilder(
          bloc: productBloc,
          builder: (context, ProductState state) {
            if (state is LoadedProductState) {
              return Column(
                children: [
                  Container(
                    child: MainMargin(
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
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 4),
                    child: ButtonWithCenterTitle(
                      title: 'Xem thêm',
                      gradient: LinearGradient(
                        colors: [
                          AppColor.color20,
                          AppColor.color33,
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            if (state is LoadingProductState) {
              return ShimmerLoadingList();
            }
            return Container();
          },
        ),
      ],
    );
  }
}
