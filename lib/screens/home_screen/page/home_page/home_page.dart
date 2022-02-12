import 'package:flutter/material.dart';
import 'package:nanoshop_app/animations/ease_out_from_bottom_animation.dart';
import 'package:nanoshop_app/animations/ease_out_from_left_animation.dart';
import 'package:nanoshop_app/animations/ease_out_from_right_animation.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/widget/home_page_app_bar.dart';
import 'package:nanoshop_app/screens/home_screen/page/home_page/widget/title_with_route_container.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_category.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/widgets/slider_image/main_slider_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomePageAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MarginBottom10(
              child: MainSliderImage(),
            ),
            CategoryFragment(),
          ],
        ),
      ),
    );
  }
}

class CategoryFragment extends StatelessWidget {
  const CategoryFragment({Key? key}) : super(key: key);

  Widget _itemCategory(dynamic model) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
          bottom: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
          left: BorderSide(width: 0.48, color: color8.withOpacity(0.3)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MarginBottom20(
            child: Stack(
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: color1.withOpacity(0.15),
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
                    child: Container(
                      width: 44,
                      height: 38,
                      alignment: Alignment.bottomCenter,
                      child: Image.asset(
                        model.url,
                        fit: BoxFit.fill,
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
                model.title,
                style: textStyle4,
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
    return Column(
      children: [
        MainMargin(
          child: MarginBottom10(
            child: TitleWithRouteContainer(
              route: '',
              title: 'Danh mục',
            ),
          ),
        ),
        EaseOutFromRightAnimation(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            child: Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Row(
                  children: dummyCategory
                      .map(
                        (e) => _itemCategory(e),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
