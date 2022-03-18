import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_account.dart';
import 'package:nanoshop_app/app/utils/dummy_data/dummy_acount_list.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';


import 'widgets/icon_with_text_widget.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PageAppBar(
        title: "Tài khoản",
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: MainMargin(
              child: InformationHeader(
                model: dummyProfile,
              ),
            ),
          ),
          Expanded(
            child: MainMargin(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      dummyAccountList.length,
                          (index) => ListAccountPageTile(
                        onTap: (){
                          switch(dummyAccountList.keys.elementAt(index)){
                            case AssetsPath.accountPageIconBell:
                              Get.toNamed(RouterApp.notificationScreen);
                          }
                        },
                        title: dummyAccountList.values.elementAt(index),
                        urlIcon: dummyAccountList.keys.elementAt(index),
                        radius: index == 0
                            ? BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        )
                            : index + 1 == dummyAccountList.length
                            ? BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )
                            : BorderRadius.all(
                          Radius.circular(0),
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
        ],
      ),
    );
  }
}

class ListAccountPageTile extends StatelessWidget {
  final String urlIcon;
  final String title;
  final BorderRadius radius;
  final Function()? onTap;

  const ListAccountPageTile({
    Key? key,
    this.onTap,
    required this.urlIcon,
    required this.title,
    required this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.only(
                right: 20,
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColor.color27,
                border: Border.all(
                  color: AppColor.color27,
                  width: 0,
                ),
                borderRadius: radius,
              ),
              child: Image.asset(
                urlIcon,
                width: 18,
                height: 18,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1, color: AppColor.color27),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                          ),
                          child: Text(
                            title,
                            style: TextStyleApp.textStyle1.copyWith(
                              color: AppColor.color27,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.color27.withOpacity(0.6),
                          ),
                          child: Text(
                            '1',
                            style: TextStyleApp.textStyle2.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InformationHeader extends StatelessWidget {
  final dynamic model;

  const InformationHeader({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 96,
            height: 96,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColor.color27,
                width: 5,
              ),
              image: DecorationImage(
                image: AssetImage(
                  AssetsPath.dummyImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    model.name,
                    style: TextStyleApp.textStyle1.copyWith(
                      color: AppColor.color27,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconWithText(
                        iconData: Icons.phone,
                        title: model.phone,
                      ),
                      IconWithText(
                        iconData: Icons.email_outlined,
                        title: model.email,
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

// class InformationHeader extends StatelessWidget {
//   final dynamic model;
//
//   const InformationHeader({
//     Key? key,
//     required this.model,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: color5,
//       child: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: 0,
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Container(
//                 color: color5,
//                 child: Image.asset(
//                   AssetsSource.subtractAccountImage,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             MainMargin(
//               child: IntrinsicHeight(
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 100,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(
//                           color: Colors.white,
//                           width: 5,
//                         ),
//                         image: DecorationImage(
//                           image: AssetImage(
//                             AssetsSource.dummyImage,
//                           ),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(vertical: 20),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             model.name,
//                             textAlign: TextAlign.start,
//                             style: textStyle1.copyWith(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                           Text(
//                             model.location,
//                             textAlign: TextAlign.start,
//                             style: textStyle1.copyWith(
//                               // color: color5,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
