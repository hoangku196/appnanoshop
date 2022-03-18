import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as FlutterBloc;

import 'package:nanoshop_app/app/logic/blocs/comment_bloc/send_comment_bloc.dart';
import 'package:nanoshop_app/app/logic/event/comment_event/send_comment_event.dart';
import 'package:nanoshop_app/app/logic/state/comment_state/send_comment_state.dart';
import 'package:nanoshop_app/app/shared_components/widgets/app_bar/page_app_bar.dart';
import 'package:nanoshop_app/app/shared_components/widgets/margins/main_margin.dart';
import 'package:nanoshop_app/app/shared_components/widgets/remove_focus_widget/remove_focus_widget.dart';
import 'package:nanoshop_app/app/utils/repository/comment_repository/comment_repository.dart';
import 'package:nanoshop_app/app/utils/style/app_color.dart';
import 'package:nanoshop_app/app/utils/style/text_style_app.dart';
import 'package:provider/provider.dart';

import '../../../shared_components/widgets/bottom_nav/bottom_nav_text.dart';
import '../../../shared_components/widgets/dialog/loading_dialog.dart';
import '../../../shared_components/widgets/text_field/textfield_with_icon.dart';
import '../../providers/comment_provider.dart';

class SendCommentScreen extends StatefulWidget {
  final dynamic arguments;

  const SendCommentScreen({
    Key? key,
    required this.arguments,
  }) : super(key: key);

  @override
  State<SendCommentScreen> createState() => _SendCommentScreenState();
}

class _SendCommentScreenState extends State<SendCommentScreen> {
  late SendCommentBloc _sendCommentBloc;

  @override
  void initState() {
    super.initState();
    _sendCommentBloc = SendCommentBloc(
      commentRepository: CommentRepository(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterBloc.BlocBuilder<SendCommentBloc, SendCommentState>(
      bloc: _sendCommentBloc,
      builder: (context, SendCommentState state) {
        if (state is Sending) {
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
              LoadingDialog.createLoadingDialog(
                context: context,
              );
            },
          );
        }

        if (state is SendSuccess) {
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
              Get.back();
              LoadingDialog.createFailedDialog(
                context: context,
                error: "Gửi bình luận thành công",
              ).then(
                (value) {},
              );
            },
          );
        }

        if (state is SendFailure) {
          SchedulerBinding.instance?.addPostFrameCallback(
            (_) {
              Get.back();
              LoadingDialog.createFailedDialog(
                context: context,
                error: state.error,
              ).then(
                (value) {
                  _sendCommentBloc.add(CloseSendFailureDialog());
                },
              );
            },
          );
        }

        return ChangeNotifierProvider(
          create: (context) => CommentProvider(),
          child: RemoveFocusWidget(
            child: Scaffold(
              appBar: const PageAppBar(title: "Viết bình luận"),
              body: MainMargin(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Vui lòng gửi phản hồi của bạn về sản phẩm cho chúng tôi được biết',
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color12,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      const SendRating<CommentProvider>(),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Nhập tên của bạn',
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<CommentProvider>(
                        builder: (context, model, child) => TextFieldWithIcon(
                          hint: 'Nhập tên/ biệt danh của bạn',
                          radiusBorder: 5,
                          // controller: _noteController,
                          showIcon: false,
                          backgroundColor: AppColor.color28,
                          onChange: model.setName,
                          maxLine: 6,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Email/ Số điện thoại',
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<CommentProvider>(
                        builder: (context, model, child) => TextFieldWithIcon(
                          hint: 'Nhập email/ số điện thoại của bạn',
                          // controller: _noteController,
                          radiusBorder: 5,
                          onChange: model.setEmail,
                          showIcon: false,
                          backgroundColor: AppColor.color28,
                          maxLine: 6,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Bình luận của bạn',
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<CommentProvider>(
                        builder: (context, model, child) => TextFieldWithIcon(
                          hint: 'Nhập đánh giá của bạn',
                          radiusBorder: 5,
                          // controller: _noteController,
                          onChange: model.setComment,
                          showIcon: false,
                          backgroundColor: AppColor.color28,
                          maxLine: 6,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Thêm ảnh/Video',
                        style: TextStyleApp.textStyle2.copyWith(
                          color: AppColor.color12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Consumer<CommentProvider>(
                        builder: (context, model, child) => AddImageAndVideo(
                          model: model,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: Consumer<CommentProvider>(
                builder: (context, _model, child) => BottomNavText(
                  title: 'Gửi',
                  onTap: () {
                    _sendCommentBloc.add(
                      Send(
                        objectId: widget.arguments.id,
                        name: _model.name,
                        type: "1",
                        content: _model.comment,
                        emailPhone: _model.email,
                        countRate: _model.rating,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class SendRating<T extends ChangeNotifier> extends StatefulWidget {
  const SendRating({Key? key}) : super(key: key);

  @override
  _SendRatingState<T> createState() => _SendRatingState<T>();
}

class _SendRatingState<T extends ChangeNotifier> extends State<SendRating<T>> {
  var _rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, model, child) => Row(
        children: [
          RatingBar.builder(
            initialRating: 3,
            minRating: 0.5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: 32,
            itemPadding: const EdgeInsets.only(right: 5),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: AppColor.color21,
            ),
            unratedColor: AppColor.color28,
            onRatingUpdate: (newValue) {
              if (model is CommentProvider) {
                model.setRating(newValue);
              } else {
                _rating = newValue;
                setState(() {});
              }
            },
          ),
          SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            (model is CommentProvider
                    ? model.rating.toString()
                    : _rating.toString()) +
                '/5',
            style: TextStyleApp.textStyle2.copyWith(
              color: AppColor.color12,
            ),
          ),
        ],
      ),
    );
  }
}

class AddImageAndVideo extends StatefulWidget {
  final model;

  const AddImageAndVideo({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  _AddImageAndVideoState createState() => _AddImageAndVideoState();
}

class _AddImageAndVideoState extends State<AddImageAndVideo> {
  final ImagePicker _picker = ImagePicker();

  // List<File> imageFiles = [];

  _getFromGallery() async {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          color: Colors.white,
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                InkWell(
                  onTap: () async {
                    Get.back();
                    XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (pickedFile != null) {
                      File imageFile = File(pickedFile.path);
                      widget.model.addImage(imageFile);
                      // setState(() {});
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera_alt,
                          color: AppColor.color13,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Máy ảnh",
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(),
                InkWell(
                  onTap: () async {
                    Navigator.pop(context);
                    XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      File imageFile = File(pickedFile.path);
                      widget.model.addImage(imageFile);
                      // setState(() {});
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          color: AppColor.color13,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Thư viện",
                          style: TextStyleApp.textStyle2.copyWith(
                            color: AppColor.color12,
                          ),
                        ),
                      ],
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

  List<Widget> _buildRowImage(BuildContext context) {
    const marginRight = 15.0;
    final double widthBox =
        MediaQuery.of(context).size.width - 20 - (marginRight * 3);

    Widget picker = InkWell(
      onTap: _getFromGallery,
      child: Container(
        width: widthBox / 4,
        height: widthBox / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColor.color10,
            width: 1,
          ),
        ),
        child: Center(
          child: Icon(
            Icons.add,
            size: 32,
            color: AppColor.color10,
          ),
        ),
      ),
    );

    int numberRow = 0;

    List<Widget> rowsImages = [];

    if ((widget.model.imageFiles.length + 1) % 4 == 0) {
      numberRow = (widget.model.imageFiles.length + 1) ~/ 4;
    } else {
      numberRow = (widget.model.imageFiles.length + 1) ~/ 4 + 1;
    }

    int lastIndex = 0;

    if (widget.model.imageFiles.isNotEmpty) {
      outerLoop:
      for (int i = 1; i <= numberRow; i++) {
        List<File> items = [];
        innerLoop:
        for (int k = lastIndex; k < widget.model.imageFiles.length; k++) {
          lastIndex++;
          items.add(widget.model.imageFiles[k]);

          if (lastIndex % 4 == 0) {
            break innerLoop;
          }
        }

        List<Widget> widgets = [];

        if (items.isNotEmpty) {
          for (int j = 0; j < items.length; j++) {
            widgets.add(
              Row(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          width: widthBox / 4,
                          height: widthBox / 4,
                          child: Image.file(
                            items[j],
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 3,
                        right: 3,
                        child: InkWell(
                          onTap: () {
                            widget.model.removeImage(items[j]);
                            // setState(() {});
                          },
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.close,
                              size: widthBox / 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  j != 3
                      ? const SizedBox(
                          width: marginRight,
                        )
                      : Container(),
                ],
              ),
            );
          }
        }

        if (i == numberRow) {
          widgets.add(picker);
        }

        rowsImages.add(
          Column(
            children: [
              Row(
                children: widgets,
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      }
    } else {
      rowsImages.add(picker);
    }

    return rowsImages;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: _buildRowImage(context),
    );
  }
}
