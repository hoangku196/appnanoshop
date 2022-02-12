import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/animations/ease_out_from_bottom_animation.dart';
import 'package:nanoshop_app/animations/ease_out_from_right_animation.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/router/router_app.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/buttons/button_icon_with_title.dart';
import 'package:nanoshop_app/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/widgets/check_box/circle_check_box.dart';
import 'package:nanoshop_app/widgets/dialog/loading_dialog.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/widgets/text_field/textfield_with_icon.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: MainMargin(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 70, top: 150),
                    child: Image.asset(
                      AssetsSource.appIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  MarginBottom10(
                    child: TextFieldWithIcon(
                      iconData: Icons.phone,
                      hint: "Số điện thoại",
                    ),
                  ),
                  MarginBottom10(
                    child: TextFieldWithIcon(
                      iconData: Icons.lock,
                      hint: "Mật khẩu",
                    ),
                  ),
                  MarginBottom10(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            MarginRight10(
                              child: CircleCheckBox(
                                onTap: () {
                                  _rememberMe = !_rememberMe;
                                  setState(() {});
                                },
                                isSelected: _rememberMe,
                              ),
                            ),
                            Text(
                              "Ghi nhớ mật khẩu",
                              style: textStyle2.copyWith(
                                color: color5,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          "Quên mật khẩu?",
                          style: textStyle2.copyWith(
                            color: color1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MarginBottom20(
                    child: ButtonWithCenterTitle(
                      onTap: () async {
                        await LoadingDialog.createLoadingDialog(
                          context: context,
                          future: Future.delayed(Duration(seconds: 5)),
                        );

                        Get.offAllNamed(RouterApp.homeScreen);
                      },
                      title: 'Đăng nhập',
                      borderColor: color1,
                    ),
                  ),
                  MarginBottom20(
                    child: Text(
                      "Hoặc đăng nhập với",
                      style: textStyle2.copyWith(
                        color: color5,
                      ),
                    ),
                  ),
                  MarginBottom10(
                    child: Row(
                      children: [
                        Expanded(
                          child: ButtonIconWithTitle(
                            assetsSource: AssetsSource.googleIcon,
                            title: 'Google',
                            borderColor: color6,
                            backgroundColor: Colors.white,
                            textColor: color6,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: ButtonIconWithTitle(
                            assetsSource: AssetsSource.facebookIcon,
                            title: 'Google',
                            borderColor: color6,
                            backgroundColor: Colors.white,
                            textColor: color6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      Get.toNamed(RouterApp.signInScreen);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Bạn chưa có tài khoản ? ",
                            style: textStyle2.copyWith(
                              color: color1,
                            ),
                          ),
                          TextSpan(
                            text: "Đăng ký ngay.",
                            style: textStyle2.copyWith(
                              color: color5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
