// import 'package:flutter/material.dart';
// import 'package:nanoshop_app/animations/ease_out_from_right_animation.dart';
// import 'package:nanoshop_app/screens/home_screen/page/home_page/fragment/home_fragment.dart';
// import 'package:nanoshop_app/screens/starter_screen/widgets/indicator_page_view.dart';
// import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
// import 'package:nanoshop_app/utils/dummy_data/dummy_category.dart';
// import 'package:nanoshop_app/utils/dummy_data/dummy_product.dart';
// import 'package:nanoshop_app/utils/style/app_color.dart';
// import 'package:nanoshop_app/utils/style/text_style_app.dart';
// import 'package:nanoshop_app/widgets/buttons/button_with_center_title.dart';
// import 'package:nanoshop_app/widgets/margins/main_margin.dart';
// import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
// import 'package:nanoshop_app/widgets/margins/margin_bottom20.dart';
// import 'package:nanoshop_app/widgets/slider_image/main_slider_image.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
// import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
//
// class HomeFragment extends StatelessWidget {
//   const HomeFragment({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: HomePageAppBar(),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             MarginBottom10(
//               child: MainSliderImage(),
//             ),
//             MarginBottom10(
//               child: CategoryFragment(),
//             ),
//             MarginBottom10(
//               child: HotProductFragment(),
//             ),
//             MarginBottom10(
//               child: MainMargin(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.asset(
//                     AssetsSource.bannerHomePage,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//             MarginBottom10(
//               child: ProductFragment(),
//             ),
//             MarginBottom10(
//               child: MainMargin(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   child: Image.asset(
//                     AssetsSource.bannerHomePage,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
// // Danh mục
// class CategoryFragment extends StatelessWidget {
//   const CategoryFragment({Key? key}) : super(key: key);
//
//   Widget _itemCategory(dynamic model) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
//       decoration: BoxDecoration(
//         border: Border(
//           top: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
//           bottom: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
//           left: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           MarginBottom20(
//             child: Stack(
//               children: [
//                 Center(
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: color1.withOpacity(0.15),
//                       shape: BoxShape.circle,
//                     ),
//                     width: 57,
//                     height: 57,
//                   ),
//                 ),
//                 Center(
//                   child: Container(
//                     width: 57,
//                     height: 57,
//                     child: Container(
//                       width: 44,
//                       height: 38,
//                       alignment: Alignment.bottomCenter,
//                       child: Image.asset(
//                         model.url,
//                         fit: BoxFit.fill,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             width: 57,
//             child: Center(
//               child: Text(
//                 model.title,
//                 style: textStyle4,
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MainMargin(
//           child: MarginBottom10(
//             child: TitleWithRouteContainer(
//               route: '',
//               title: 'Danh mục',
//             ),
//           ),
//         ),
//         EaseOutFromRightAnimation(
//           child: SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             physics: BouncingScrollPhysics(),
//             child: Row(
//               children: [
//                 SizedBox(
//                   width: 10,
//                 ),
//                 Row(
//                   children: dummyCategory
//                       .map(
//                         (e) => _itemCategory(e),
//                   )
//                       .toList(),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// // Sản phẩm mới
// class HotProductFragment extends StatelessWidget {
//   const HotProductFragment({Key? key}) : super(key: key);
//
//   Widget containerTitle({required BuildContext context}) {
//     return Stack(
//       children: [
//         Container(
//           child: Image.asset(
//             AssetsSource.containerHotItem,
//             fit: BoxFit.cover,
//             width: MediaQuery.of(context).size.width,
//             height: 70,
//           ),
//         ),
//         Positioned(
//           top: 0,
//           bottom: 0,
//           left: 20,
//           right: 20,
//           child: Container(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             decoration: BoxDecoration(
//               color: color5,
//               borderRadius: BorderRadius.circular(50),
//               border: Border.all(
//                 color: color9,
//                 width: 10,
//               ),
//             ),
//             child: Center(
//               child: Text(
//                 'Sản phẩm mới'.toUpperCase(),
//                 style: textStyle5,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 500,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 33,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Container(
//               color: color5,
//             ),
//           ),
//           containerTitle(context: context),
//           Positioned(
//             top: 100,
//             left: 0,
//             right: 0,
//             bottom: 0,
//             child: Column(
//               children: [
//                 Container(
//                   height: 350,
//                   child: ListView.builder(
//                     physics: BouncingScrollPhysics(),
//                     itemCount: dummyProduct.getRange(0, 5).length,
//                     scrollDirection: Axis.horizontal,
//                     itemBuilder: (context, index) {
//                       return EaseOutFromRightAnimation(
//                         delay: 0.5,
//                         child: HotItemProductListTile(
//                           model: dummyProduct[index],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: List.generate(
//                       3,
//                           (index) {
//                         return IndicatorPageView(
//                           height: 4,
//                           isActive: false,
//                           onTap: () {
//                             // if (_indexPage != index) {
//                             //   // _pageController.animateToPage(index,
//                             //   //     duration: Duration(milliseconds: 1000),
//                             //   //     curve: Curves.fastOutSlowIn);
//                             // }
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// // Sản phẩm
// class ProductFragment extends StatelessWidget {
//   const ProductFragment({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MainMargin(
//           child: MarginBottom10(
//             child: TitleWithRouteContainer(
//               route: '',
//               title: 'Sản phẩm',
//             ),
//           ),
//         ),
//         MarginBottom10(
//           child: MainMargin(
//             child: StaggeredGridView.count(
//               staggeredTiles: dummyProduct
//                   .map<StaggeredTile>((_) => StaggeredTile.fit(1))
//                   .toList(),
//               shrinkWrap: true,
//               physics: NeverScrollableScrollPhysics(),
//               crossAxisCount: 2,
//               crossAxisSpacing: 15.0,
//               mainAxisSpacing: 15.0,
//               children: dummyProduct
//                   .map(
//                     (e) => ProductGridTile(model: e),
//               )
//                   .toList(),
//             ),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(
//               horizontal: MediaQuery.of(context).size.width / 4),
//           child: ButtonWithCenterTitle(title: 'Xem thêm'),
//         ),
//       ],
//     );
//   }
// }
