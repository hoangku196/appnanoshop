List dummyComment = [
  DummyComment(
    name: "Hoàng Lê",
    rate: 4.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
    listComment: [
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
    ],
  ),
  DummyComment(
    name: "Duy Minh",
    rate: 3.5,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
  ),
  DummyComment(
    name: "Hạnh Đỗ",
    rate: 0,
    comment: "Sản phẩm quá chán.",
    listComment: [
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
    ],
  ),
  DummyComment(
    name: "Hoàng Lê",
    rate: 5.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
  ),
  DummyComment(
    name: "Hoàng Lê",
    rate: 4.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
    listComment: [
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
    ],
  ),
  DummyComment(
    name: "Hoàng Lê",
    rate: 4.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
    listComment: [
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
      DummyComment(name: "Hoàng Lê", rate: 1.0, comment: "haha"),
    ],
  ),
  DummyComment(
    name: "Hoàng Lê",
    rate: 4.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
  ),
  DummyComment(
    name: "Hoàng Lê",
    rate: 4.0,
    comment:
        "Sản phẩm rất tốt, thích hợp cho mọi đối tượng. Đặc biệt là người lớn tuổi suy giảm sức khỏe, giúp hồi phục sức khỏe sau thời kì thai sản.",
  ),
];

class DummyComment {
  final String name;
  final double rate;
  final String comment;
  final List<DummyComment>? listComment;

  DummyComment({
    required this.name,
    required this.rate,
    required this.comment,
    this.listComment,
  });
}
