import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:get/get.dart';

import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/logic/event/sign_up_event/sign_up_event.dart';
import 'package:nanoshop_app/app/logic/state/sign_up_state/sign_up_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/app/shared_components/widgets/check_box/circle_check_box.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/text_field/textfield_with_icon.dart';
import 'package:nanoshop_app/app/utils/repository/login_repository/login_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import '../../../config/router/router_app.dart';
import '../../../logic/blocs/sign_up_bloc/sign_up_bloc.dart';
import '../../../shared_components/widgets/background_app/background_app.dart';
import '../../../shared_components/widgets/dialog/loading_dialog.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _checkConfirm = false;

  TextEditingController _accountController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordConfirmController = TextEditingController();

  SignUpBloc _signUpBloc = SignUpBloc(loginRepository: LoginRepository());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.BlocBuilder<SignUpBloc, SignUpState>(
      bloc: _signUpBloc,
      builder: (context, SignUpState state) {
        if (state is Uploading) {
          SchedulerBinding.instance?.addPostFrameCallback(
                (_) {
              LoadingDialog.createLoadingDialog(
                context: context,
              );
            },
          );
        }

        if (state is UploadSuccess) {
          SchedulerBinding.instance?.addPostFrameCallback(
                (_) async {
              Get.back();
              await LoadingDialog.createFailedDialog(
                context: context,
                error: "Đăng ký thành công",
              ).then(
                    (value) {
                  _signUpBloc.add(CloseSignUpFailureDialog());
                  Get.toNamed(RouterApp.loginScreen);
                },
              );
            },
          );
        }

        if (state is UploadFailure) {
          SchedulerBinding.instance?.addPostFrameCallback(
                (_) async {
              Get.back();
              await LoadingDialog.createFailedDialog(
                context: context,
                error: state.error,
              ).then(
                    (value) {
                  _signUpBloc.add(CloseSignUpFailureDialog());
                },
              );
            },
          );
        }

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
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
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
                              controller: _accountController,
                              iconData: Icons.person,
                              hint: "Tên tài khoản",
                            ),
                          ),
                          MarginBottom20(
                            child: TextFieldWithIcon(
                              controller: _nameController,
                              iconData: Icons.account_box,
                              hint: "Họ và tên",
                            ),
                          ),
                          MarginBottom20(
                            child: TextFieldWithIcon(
                              controller: _passwordController,
                              iconData: Icons.lock,
                              hint: "Mật khẩu",
                              obscureText: true,
                            ),
                          ),
                          MarginBottom20(
                            child: TextFieldWithIcon(
                              controller: _passwordConfirmController,
                              iconData: Icons.lock,
                              hint: "Nhập lại mật khẩu",
                              obscureText: true,
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
                                        style: TextStyleApp.textStyle2.copyWith(
                                          color: AppColor.color13,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "điều khoản && chính sách ",
                                        style: TextStyleApp.textStyle2.copyWith(
                                          color: AppColor.color27,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "của Nanoshop.",
                                        style: TextStyleApp.textStyle2.copyWith(
                                          color: AppColor.color13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ButtonWithCenterTitle(
                            onTap: () {
                              if (_checkConfirm) {
                                _signUpBloc.add(
                                  SignUp(
                                    passwordConfirm:
                                    _passwordConfirmController.text,
                                    name: _nameController.text,
                                    account: _accountController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              }
                            },
                            gradient: LinearGradient(
                              colors: [
                                AppColor.color20,
                                AppColor.color33,
                              ],
                            ),
                            title: 'Đăng ký',
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
      },
    );
  }
}
