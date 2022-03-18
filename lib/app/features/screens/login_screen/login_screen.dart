import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/constants/assets_source/assets_path.dart';
import 'package:nanoshop_app/app/logic/blocs/login_bloc/login_bloc.dart';
import 'package:nanoshop_app/app/logic/state/login_state/login_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/background_app/background_app.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_icon_with_title.dart';
import 'package:nanoshop_app/app/shared_components/widgets/buttons/button_with_center_title.dart';
import 'package:nanoshop_app/app/shared_components/widgets/check_box/circle_check_box.dart';
import 'package:nanoshop_app/app/shared_components/widgets/dialog/loading_dialog.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom20.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_right10.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/app/shared_components/widgets/text_field/textfield_with_icon.dart';
import 'package:nanoshop_app/app/utils/repository/login_repository/login_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';

import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:nanoshop_app/app/utils/validator/validator.dart';

import '../../../logic/event/login_event/login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc(
      loginRepository: LoginRepository(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        body: FlutterBloc.BlocBuilder<LoginBloc, LoginState>(
          bloc: _loginBloc,
          builder: (context, LoginState state) {
            if (state is LoginLoading) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) {
                  LoadingDialog.createLoadingDialog(
                    context: context,
                  );
                },
              );
            }

            if (state is LoginSuccess) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) {
                  Get.offAllNamed(RouterApp.homeScreen);
                },
              );
            }

            if (state is LoginFailure) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) {
                  Get.back();
                  LoadingDialog.createFailedDialog(
                    context: context,
                    error: state.error,
                  ).then(
                    (value) {
                      _loginBloc.add(CloseFailureDialog());
                    },
                  );
                },
              );
            }

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
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: 70, top: 150),
                              child: Image.asset(
                                AssetsPath.appIcon,
                                fit: BoxFit.cover,
                              ),
                            ),
                            MarginBottom10(
                              child: TextFieldWithIcon(
                                controller: _accountController,
                                iconData: Icons.person_outline,
                                hint: "Tài khoản",
                                validate: Validator().validatePassword,
                              ),
                            ),
                            MarginBottom10(
                              child: TextFieldWithIcon(
                                controller: _passwordController,
                                iconData: Icons.lock,
                                hint: "Mật khẩu",
                                obscureText: true,
                                validate: Validator().validatePassword,
                              ),
                            ),
                            MarginBottom10(
                              child: InkWell(
                                onTap: (){
                                  Get.toNamed(RouterApp.forgotPasswordScreen);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.end,
                                  children: [
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.end,
                                    //   children: [
                                    //     // MarginRight10(
                                    //     //   child: CircleCheckBox(
                                    //     //     onTap: () {
                                    //     //       _rememberMe = !_rememberMe;
                                    //     //       setState(() {});
                                    //     //     },
                                    //     //     isSelected: _rememberMe,
                                    //     //   ),
                                    //     // ),
                                    //     Text(
                                    //       "Ghi nhớ mật khẩu",
                                    //       style: TextStyleApp.textStyle2.copyWith(
                                    //         color: AppColor.color13,
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    Text(
                                      "Quên mật khẩu?",
                                      style: TextStyleApp.textStyle2.copyWith(
                                        color: AppColor.color21,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            MarginBottom20(
                              child: ButtonWithCenterTitle(
                                onTap: () {
                                  if (_formKey.currentState!.validate())
                                    _loginBloc.add(
                                      SignInUser(
                                        account: _accountController.text,
                                        password: _passwordController.text,
                                      ),
                                    );
                                },
                                title: 'Đăng nhập',
                                gradient: LinearGradient(
                                  colors: [
                                    AppColor.color20,
                                    AppColor.color33,
                                  ],
                                ),
                              ),
                            ),
                            MarginBottom20(
                              child: Text(
                                "Hoặc đăng nhập với",
                                style: TextStyleApp.textStyle2.copyWith(
                                  color: AppColor.color13,
                                ),
                              ),
                            ),
                            MarginBottom10(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ButtonIconWithTitle(
                                      onTap: () {
                                        _loginBloc.add(SignInGoogle());
                                      },
                                      assetsSource: AssetsPath.googleIcon,
                                      title: 'Google',
                                      borderColor: AppColor.color13,
                                      backgroundColor: Colors.transparent,
                                      textColor: AppColor.color13,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: ButtonIconWithTitle(
                                      onTap: () {
                                        _loginBloc.add(SignInFaceBook());
                                      },
                                      assetsSource: AssetsPath.facebookIcon,
                                      title: 'Facebook',
                                      borderColor: AppColor.color13,
                                      backgroundColor: Colors.transparent,
                                      textColor: AppColor.color13,
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
                                      style: TextStyleApp.textStyle2.copyWith(
                                        color: AppColor.color13,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Đăng ký ngay.",
                                      style: TextStyleApp.textStyle2.copyWith(
                                        color: AppColor.color21,
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
              ],
            );
          },
        ),
      ),
    );
  }
}
