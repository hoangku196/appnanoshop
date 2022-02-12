import 'package:flutter/material.dart';
import 'package:nanoshop_app/utils/assets_source/assets_source.dart';
import 'package:nanoshop_app/utils/style/app_color.dart';
import 'package:nanoshop_app/utils/style/text_style_app.dart';
import 'package:nanoshop_app/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/widgets/check_box/circle_check_box.dart';
import 'package:nanoshop_app/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/widgets/text_field/textfield_with_icon.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _checkConfirm = false;

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
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 70, top: 150),
                    child: Image.asset(
                      AssetsSource.appIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  MarginBottom20(
                    child: TextFieldWithIcon(
                      iconData: Icons.phone,
                      hint: "Số điện thoại",
                    ),
                  ),
                  MarginBottom20(
                    child: TextFieldWithIcon(
                      iconData: Icons.lock,
                      hint: "Mật khẩu",
                    ),
                  ),
                  MarginBottom20(
                    child: TextFieldWithIcon(
                      iconData: Icons.lock,
                      hint: "Mật khẩu",
                    ),
                  ),
                  MarginBottom20(
                    child: TextFieldWithIcon(
                      iconData: Icons.lock,
                      hint: "Mật khẩu",
                    ),
                  ),
                  MarginBottom20(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MarginRight10(
                          child: CircleCheckBox(
                            onTap: () {
                              _checkConfirm = !_checkConfirm;
                              setState(() {});
                            },
                            isSelected: _checkConfirm,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Đồng ý ",
                                style: textStyle2.copyWith(
                                  color: color5,
                                ),
                              ),
                              TextSpan(
                                text: "điều khoản && chính sách ",
                                style: textStyle2.copyWith(
                                  color: color1,
                                ),
                              ),
                              TextSpan(
                                text: "của Nanoshop.",
                                style: textStyle2.copyWith(
                                  color: color5,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonWithCenterTitle(
                    title: 'Đăng ký',
                    borderColor: color1,
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
