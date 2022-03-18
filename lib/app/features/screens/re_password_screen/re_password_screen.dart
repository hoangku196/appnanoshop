import 'package:flutter/material.dart';

import '../../../constants/assets_source/assets_path.dart';
import '../../../shared_components/widgets/background_app/background_app.dart';
import '../../../shared_components/widgets/buttons/button_with_center_title.dart';
import '../../../shared_components/widgets/margins/main_margin.dart';
import '../../../shared_components/widgets/margins/margin_bottom10.dart';
import '../../../shared_components/widgets/text/title_text.dart';
import '../../../shared_components/widgets/text_field/textfield_with_icon.dart';
import '../../../utils/style/app_color.dart';
import '../../../utils/validator/validator.dart';

class RePasswordScreen extends StatefulWidget {
  const RePasswordScreen({Key? key}) : super(key: key);

  @override
  _RePasswordScreenState createState() => _RePasswordScreenState();
}

class _RePasswordScreenState extends State<RePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: BackgroundApp(),
        ),
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: MainMargin(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 70, top: 150),
                    child: Image.asset(
                      AssetsPath.appIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: TitleText(
                      title: 'Đổi mật khẩu',
                    ),
                  ),
                  MarginBottom10(
                    child: TextFieldWithIcon(
                      // controller: _passwordController,
                      iconData: Icons.lock,
                      hint: "Mật khẩu",
                      obscureText: true,
                      validate: Validator().validatePassword,
                    ),
                  ),
                  MarginBottom10(
                    child: TextFieldWithIcon(
                      // controller: _passwordController,
                      iconData: Icons.lock,
                      hint: "Nhắc lại mật khẩu",
                      obscureText: true,
                      validate: Validator().validatePassword,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    child: ButtonWithCenterTitle(
                      onTap: () {},
                      gradient: LinearGradient(
                        colors: [
                          AppColor.color20,
                          AppColor.color33,
                        ],
                      ),
                      title: 'Đổi mật khẩu',
                      borderColor: AppColor.color1,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
