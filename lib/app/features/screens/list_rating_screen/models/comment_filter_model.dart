import 'package:equatable/equatable.dart';

List<CommentFilterModel> dummyCommentFilterModel = [
  CommentFilterModel(
    title: 'Mới nhất',
  ),
  CommentFilterModel(
    title: 'Có hình ảnh',
  ),
  CommentFilterModel(
    title: 'Đã mua hàng',
  ),
  ...List.generate(
    5,
    (index) => CommentFilterModel(
      title: '${(index + 1).toString()}',
      hasIcon: true,
    ),
  ),
];

class CommentFilterModel extends Equatable {
  final String title;
  final bool hasIcon;

  const CommentFilterModel({
    required this.title,
    this.hasIcon = false,
  });

  @override
  List<Object?> get props => [
        title,
      ];
}
