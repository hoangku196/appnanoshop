import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/features/screens/verification_screen/arguments/verification_argument_screen.dart';

import '../../../constants/assets_source/assets_path.dart';
import '../../../shared_components/animations/ease_out_from_right_animation.dart';
import '../../../shared_components/widgets/background_app/background_app.dart';
import '../../../shared_components/widgets/buttons/button_with_center_title.dart';
import '../../../shared_components/widgets/margins/main_margin.dart';
import '../../../shared_components/widgets/margins/margin_bottom20.dart';
import '../../../shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import '../../../shared_components/widgets/text_field/textfield_with_icon.dart';
import '../../../utils/style/app_color.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        body: Stack(
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
                      MarginBottom20(
                        child: TextFieldWithIcon(
                          controller: _phoneController,
                          iconData: Icons.phone,
                          hint: "Số điện thoại",
                        ),
                      ),
                      ButtonWithCenterTitle(
                        onTap: () {
                          Get.toNamed(
                            RouterApp.verificationScreen,
                            arguments: VerificationArgumentScreen(
                              phone: _phoneController.text,
                            ),
                          );
                        },
                        gradient: LinearGradient(
                          colors: [
                            AppColor.color20,
                            AppColor.color33,
                          ],
                        ),
                        title: 'Gửi',
                        borderColor: AppColor.color1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
