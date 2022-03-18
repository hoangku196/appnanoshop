class CommentResponse {
  String? id;
  String? type;
  String? objectId;
  String? content;
  String? createdTime;
  String? modifiedTime;
  String? status;
  String? liked;
  String? userLikes;
  String? userId;
  String? siteId;
  String? viewed;
  String? emailPhone;
  String? userType;
  String? name;
  String? verifyCode;
  String? rate;
  String? orderId;

  CommentResponse(
      {this.id,
        this.type,
        this.objectId,
        this.content,
        this.createdTime,
        this.modifiedTime,
        this.status,
        this.liked,
        this.userLikes,
        this.userId,
        this.siteId,
        this.viewed,
        this.emailPhone,
        this.userType,
        this.name,
        this.verifyCode,
        this.rate,
        this.orderId});

  CommentResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    objectId = json['object_id'];
    content = json['content'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    status = json['status'];
    liked = json['liked'];
    userLikes = json['user_likes'];
    userId = json['user_id'];
    siteId = json['site_id'];
    viewed = json['viewed'];
    emailPhone = json['email_phone'];
    userType = json['user_type'];
    name = json['name'];
    verifyCode = json['verifyCode'];
    rate = json['rate'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['object_id'] = this.objectId;
    data['content'] = this.content;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['status'] = this.status;
    data['liked'] = this.liked;
    data['user_likes'] = this.userLikes;
    data['user_id'] = this.userId;
    data['site_id'] = this.siteId;
    data['viewed'] = this.viewed;
    data['email_phone'] = this.emailPhone;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['verifyCode'] = this.verifyCode;
    data['rate'] = this.rate;
    data['order_id'] = this.orderId;
    return data;
  }
}