import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/dash/dash.dart';
import 'package:nanoshop_app/app/shared_components/widgets/expanded_section/expanded_section.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_category.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class CategoryPage extends StatelessWidget {
  final dynamic arguments;

  const CategoryPage({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PageAppBar(
        title: "Danh mục sản phẩm",
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            ...List.generate(
              (arguments.categories as List).length,
              (index) => ItemCategory(
                model: (arguments.categories as List)[index],
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
          // children: (arguments.categories as List)
          //     .map(
          //       (e) => ItemCategory(
          //         model: e,
          //       ),
          //     )
          //     .toList(),
        ),
      ),
    );
  }
}

class ItemCategory extends StatefulWidget {
  final dynamic model;

  const ItemCategory({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  _ItemCategoryState createState() => _ItemCategoryState();
}

class _ItemCategoryState extends State<ItemCategory> {
  bool _showChildren = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 5,
            color: AppColor.color1.withOpacity(0.1),
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.color1,
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
                    child: LoadImageFromNetwork(
                      url: widget.model.imagePath + widget.model.imageName,
                      kHeightErrorIcon: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.model.catName.toString().toUpperCase(),
                        style: TextStyleApp.textStyle1.copyWith(
                          color: AppColor.color5,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showChildren = !_showChildren;
                          setState(() {});
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _showChildren
                                ? AppColor.color1.withOpacity(0.2)
                                : AppColor.color10.withOpacity(0.2),
                          ),
                          child: Icon(
                            _showChildren
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            color: _showChildren
                                ? AppColor.color1
                                : AppColor.color10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ExpandedSection(
                  isSelected: _showChildren,
                  child: Column(
                    children: [
                      Dash(
                        color: AppColor.color1.withOpacity(0.3),
                      ),
                      ...List.generate(
                        widget.model.children.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.model.children[index].catName,
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: AppColor.color11,
                                ),
                              ),
                              Text(
                                "(25)",
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: AppColor.color5,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
