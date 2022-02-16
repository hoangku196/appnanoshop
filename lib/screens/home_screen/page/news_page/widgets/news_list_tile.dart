import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';

class NewListTile extends StatelessWidget {
  final dynamic model;

  const NewListTile({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MarginBottom10(
          child: Image.asset(
            model.url,
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
          ),
        ),
        MarginBottom10(
          child: MainMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarginBottom10(
                  child: Text(
                    model.title,
                    style: textStyle3.copyWith(
                      color: color11,
                    ),
                  ),
                ),
                MarginBottom10(
                  child: Text(
                    model.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: textStyle2.copyWith(
                      color: color12,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildToolBar(
                        title: '22/11/2021',
                        iconSource: AssetsSource.clockIcon,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildToolBar(
                            title: 'Likes',
                            iconSource: AssetsSource.favouriteIcon,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildToolBar(
                            title: 'Comment',
                            iconSource: AssetsSource.messageIcon,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildToolBar(
                            title: 'Share',
                            iconSource: AssetsSource.shareIcon,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToolBar({
    required String iconSource,
    required String title,
    Function()? onTap,
  }) {
    return Row(
      children: [
        Image.asset(iconSource),
        SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: textStyle2.copyWith(
            color: color13,
          ),
        ),
      ],
    );
  }
}
