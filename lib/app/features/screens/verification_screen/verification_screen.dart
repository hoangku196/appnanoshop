import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;
import 'package:get/get.dart';
import 'package:nanoshop_app/app/config/router/router_app.dart';
import 'package:nanoshop_app/app/logic/state/verification_state/verification_state.dart';

import 'package:nanoshop_app/app/shared_components/widgets/margins/margin_bottom10.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../constants/assets_source/assets_path.dart';
import '../../../logic/blocs/verification_bloc/verification_bloc.dart';
import '../../../logic/event/verification_event/verification_event.dart';
import '../../../shared_components/widgets/background_app/background_app.dart';
import '../../../shared_components/widgets/buttons/button_with_center_title.dart';
import '../../../shared_components/widgets/dialog/loading_dialog.dart';
import '../../../shared_components/widgets/margins/main_margin.dart';
import '../../../shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import '../../../shared_components/widgets/text/title_text.dart';
import '../../../utils/style/app_color.dart';

class VerificationScreen extends StatefulWidget {
  final dynamic argument;

  const VerificationScreen({
    Key? key,
    required this.argument,
  }) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  late final VerificationBloc _verificationBloc;

  final TextEditingController _codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _verificationBloc = VerificationBloc()
      ..add(
        CreateVerification(phoneNumber: widget.argument.phone),
      );
  }

  @override
  Widget build(BuildContext context) {
    return RemoveFocusWidget(
      child: Scaffold(
        body: FlutterBloc.BlocBuilder<VerificationBloc, VerificationState>(
          bloc: _verificationBloc,
          builder: (context, VerificationState state) {
            if (state is VerificationFailed) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) async {
                  await LoadingDialog.createFailedDialog(
                    context: context,
                    error: state.error,
                  ).then(
                    (value) {
                      _verificationBloc.add(CloseVerificationFailedDialog());
                    },
                  );
                },
              );
            }

            if (state is Verified) {
              SchedulerBinding.instance?.addPostFrameCallback(
                (_) async {
                  await LoadingDialog.createFailedDialog(
                    context: context,
                    error: "Thành công",
                  ).then(
                    (value) {
                      _verificationBloc.add(CloseVerificationFailedDialog());
                      Get.toNamed(RouterApp.rePasswordScreen);
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
                              title: 'xác thực mã otp',
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "Điền mã OTP đã được gửi đến số điện thoại của bạn.",
                              textAlign: TextAlign.center,
                              style: TextStyleApp.textStyle2.copyWith(
                                color: AppColor.color38.withOpacity(0.6),
                              ),
                            ),
                          ),
                          MarginBottom10(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColor.color20,
                                    AppColor.color21,
                                  ],
                                ).createShader(bounds);
                              },
                              child: PinCodeTextField(
                                autoFocus: true,
                                controller: _codeController,
                                appContext: context,
                                showCursor: false,
                                length: 6,
                                obscureText: false,
                                hintCharacter: '_',
                                textStyle: TextStyleApp.textStyle2.copyWith(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                                blinkWhenObscuring: false,

                                pinTheme: PinTheme(
                                  inactiveColor:
                                      Color.fromRGBO(229, 245, 239, 1),
                                  selectedColor:
                                      Color.fromRGBO(229, 245, 239, 1),
                                  activeFillColor: Colors.transparent,
                                  activeColor: Color.fromRGBO(229, 245, 239, 1),
                                  disabledColor:
                                      Color.fromRGBO(229, 245, 239, 1),
                                  borderWidth: 1,
                                  inactiveFillColor: Colors.transparent,
                                  selectedFillColor: Colors.transparent,
                                  shape: PinCodeFieldShape.box,
                                  borderRadius: BorderRadius.circular(12),
                                  fieldHeight: 50,
                                  fieldWidth: 50,
                                  // activeFillColor:
                                  //     hasError ? Colors.blue.shade100 : Colors.white,
                                ),
                                cursorColor: Colors.white,
                                animationDuration: Duration(milliseconds: 300),
                                enableActiveFill: true,
                                // errorAnimationController: errorController,
                                // controller: textEditingController,
                                keyboardType: TextInputType.number,
                                onCompleted: (v) {},

                                onChanged: (value) {
                                  setState(() {});
                                },
                                beforeTextPaste: (text) {
                                  return true;
                                },
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 80),
                            margin: const EdgeInsets.only(bottom: 20),
                            child: ButtonWithCenterTitle(
                              onTap: () {
                                _verificationBloc.add(
                                    ConfirmCode(code: _codeController.text));
                              },
                              gradient: LinearGradient(
                                colors: [
                                  AppColor.color20,
                                  AppColor.color33,
                                ],
                              ),
                              title: 'Xác nhận',
                              borderColor: AppColor.color1,
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Không nhận được mã OTP? ",
                                  style: TextStyleApp.textStyle2.copyWith(
                                    color: AppColor.color13,
                                  ),
                                ),
                                TextSpan(
                                  text: "Gửi lại.",
                                  style: TextStyleApp.textStyle2.copyWith(
                                    color: AppColor.color21,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
