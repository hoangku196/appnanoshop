import 'package:flutter/material.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/images/load_image_from_network.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

class NewListTile extends StatelessWidget {
  final dynamic model;

  final Function()? onTap;

  const NewListTile({
    Key? key,
    this.model,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: MarginBottom10(
            child: LoadImageFromNetwork(
              url: model.imagePath + model.imageName,
            ),
          ),
        ),
        MarginBottom10(
          child: MainMargin(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MarginBottom10(
                  child: InkWell(
                    onTap: onTap,
                    child: Text(
                      model.newsTitle,
                      style: TextStyleApp.textStyle3.copyWith(
                        color: AppColor.color11,
                      ),
                    ),
                  ),
                ),
                MarginBottom10(
                  child: InkWell(
                    onTap: onTap,
                    child: Text(
                      model.newsSortdesc,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyleApp.textStyle2.copyWith(
                        color: AppColor.color12,
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: _buildToolBar(
                        title: '22/11/2021',
                        iconSource: AssetsPath.clockIcon,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildToolBar(
                            title: 'Likes',
                            iconSource: AssetsPath.favouriteIcon,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildToolBar(
                            title: 'Comment',
                            iconSource: AssetsPath.messageIcon,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          _buildToolBar(
                            title: 'Share',
                            iconSource: AssetsPath.shareIcon,
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
          style: TextStyleApp.textStyle2.copyWith(
            color: AppColor.color13,
          ),
        ),
      ],
    );
  }
}
