import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;

import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/features/screens/starter_screen/widgets/circle_indicator_page_view.dart';
import 'package:nanoshop_app/app/shared_components/animations/ease_out_from_left_animation.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/error_widget/error_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/loading_widget/loading_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/utils/repository/auth_repository/auth_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../logic/blocs/auth_bloc/auth_bloc.dart';
import '../../../logic/event/auth_event/auth_event.dart';
import '../../../logic/state/auth_state/auth_state.dart';

class StarterScreen extends StatefulWidget {
  const StarterScreen({Key? key}) : super(key: key);

  @override
  _StarterScreenState createState() => _StarterScreenState();
}

class _StarterScreenState extends State<StarterScreen>
    with TickerProviderStateMixin {
  late PageController _pageController;

  late AuthBloc _authBloc;

  final _initialPage = 0;

  final List<Widget> _page = [
    DummyPageView(),
    DummyPageView(),
    DummyPageView(),
    DummyPageView(),
  ];

  late int _indexPage;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _initialPage,
      keepPage: true,
    );
    _indexPage = _initialPage;
    _authBloc = AuthBloc(
      authRepository: AuthRepository(),
    );
    _authBloc.add(Authentication());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterBloc.BlocBuilder<AuthBloc, AuthState>(
        bloc: _authBloc,
        builder: (context, AuthState state) => Stack(
          children: [
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: BackgroundApp(),
            ),

            Positioned(
              top: 0,
              left: 0,
              bottom: 0,
              right: 0,
              child: EaseOutFromLeftAnimation(
                delay: 0,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (page) {
                          _indexPage = page;
                          setState(() {});
                        },
                        children: _page,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          _page.length,
                          (index) {
                            return CircleIndicatorPageView(
                              isActive: index == _indexPage ? true : false,
                              onTap: () {
                                if (_indexPage != index) {
                                  _pageController.animateToPage(index,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.fastOutSlowIn);
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                if (_indexPage < _page.length - 1)
                                  _pageController.animateToPage(++_indexPage,
                                      duration: Duration(milliseconds: 400),
                                      curve: Curves.fastOutSlowIn);
                                else
                                  Get.offAndToNamed(
                                      RouterApp.beforeLoginScreen);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColor.color21,
                                      AppColor.color33.withOpacity(0.35),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MarginRight10(
                                      child: Text(
                                        'Bắt đầu',
                                        style: TextStyleApp.textStyle2.copyWith(
                                          color: AppColor.color11,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Get.offAndToNamed(RouterApp.beforeLoginScreen);
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 14),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Bỏ qua',
                                      style: TextStyleApp.textStyle2.copyWith(
                                        color: AppColor.color13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (state is AuthLoading)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: LoadingWidget(),
              ),
            if (state is AuthFailed)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: LoadingFailed(
                  error: state.error,
                  onTap: () {
                    _authBloc.add(Authentication());
                  },
                ),
              ),
            // Positioned(
            //   left: 0,
            //   bottom: 10,
            //   right: 0,
            //   child: EaseOutFromRightAnimation(
            //     child: Stack(
            //       children: [
            //         Container(
            //           height: 50,
            //           child: Row(
            //             mainAxisAlignment: MainAxisAlignment.center,
            //             children: List.generate(
            //               _page.length,
            //               (index) {
            //                 return CircleIndicatorPageView(
            //                   isActive: index == _indexPage ? true : false,
            //                   onTap: () {
            //                     if (_indexPage != index) {
            //                       _pageController.animateToPage(index,
            //                           duration: Duration(milliseconds: 1000),
            //                           curve: Curves.fastOutSlowIn);
            //                     }
            //                   },
            //                 );
            //               },
            //             ),
            //           ),
            //         ),
            //         Positioned(
            //           top: 0,
            //           right: 10,
            //           bottom: 0,
            //           child: InkWell(
            //             onTap: () {
            //               Get.offAndToNamed(RouterApp.beforeLoginScreen);
            //             },
            //             child: Container(
            //               padding: const EdgeInsets.all(8),
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 border: Border.all(
            //                   color: color1,
            //                   width: 1,
            //                 ),
            //               ),
            //               child: Icon(
            //                 Icons.arrow_forward,
            //                 color: color1,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class DummyPageView extends StatelessWidget {
  const DummyPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.only(
            bottom: 30,
          ),
          child: Image.asset(
            AssetsPath.dummyImageStarter,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Image.asset(
            AssetsPath.nameCompanyIcon,
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Một thương hiệu dược phẩm uy tín, lựa chọn tin cậy của mọi nhà. Giàu kinh nghiệp trong nghiên cứu và phân phối các sản phẩm thuốc uy tín cho thị trường Việt Name.',
            style: TextStyleApp.textStyle2.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
