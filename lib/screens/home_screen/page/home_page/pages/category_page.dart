import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/dummy_data/dummy_category.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/dash/dash.dart';
import 'package:nanoshop_app/widgets/expanded_section/expanded_section.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Danh mục sản phẩm",
          style: textStyle1.copyWith(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: color5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: dummyCategory
              .map(
                (e) => ItemCategory(
                  model: e,
                ),
              )
              .toList(),
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
            color: color1.withOpacity(0.1),
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
                    color: color1,
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
                      widget.model.url,
                      fit: BoxFit.fill,
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
                        widget.model.title.toString().toUpperCase(),
                        style: textStyle1.copyWith(
                          color: color5,
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
                            color: _showChildren ? color1.withOpacity(0.2) : color10.withOpacity(0.2),
                          ),
                          child: Icon(
                           _showChildren ? Icons.keyboard_arrow_down : Icons.keyboard_arrow_right,
                            color: _showChildren ? color1 : color10,
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
                        color: color1.withOpacity(0.3),
                      ),
                      ...List.generate(
                        widget.model.children.length,
                        (index) => Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.model.children[index],
                                style: textStyle2.copyWith(
                                  color: color11,
                                ),
                              ),
                              Text(
                                "(25)",
                                style: textStyle2.copyWith(
                                  color: color5,
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
