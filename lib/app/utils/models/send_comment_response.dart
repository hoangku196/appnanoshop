class SendCommentResponse {
  String? type;
  int? objectId;
  int? createdTime;
  int? modifiedTime;
  int? status;
  String? liked;
  int? viewed;
  String? emailPhone;
  int? userType;
  String? name;
  int? rate;
  int? userId;
  String? content;
  String? siteId;
  String? id;
  String? userLikes;
  String? verifyCode;
  String? orderId;

  SendCommentResponse(
      {this.type,
        this.objectId,
        this.createdTime,
        this.modifiedTime,
        this.status,
        this.liked,
        this.viewed,
        this.emailPhone,
        this.userType,
        this.name,
        this.rate,
        this.userId,
        this.content,
        this.siteId,
        this.id,
        this.userLikes,
        this.verifyCode,
        this.orderId});

  SendCommentResponse.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    objectId = json['object_id'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    status = json['status'];
    liked = json['liked'];
    viewed = json['viewed'];
    emailPhone = json['email_phone'];
    userType = json['user_type'];
    name = json['name'];
    rate = json['rate'];
    userId = json['user_id'];
    content = json['content'];
    siteId = json['site_id'];
    id = json['id'];
    userLikes = json['user_likes'];
    verifyCode = json['verifyCode'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['object_id'] = this.objectId;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['status'] = this.status;
    data['liked'] = this.liked;
    data['viewed'] = this.viewed;
    data['email_phone'] = this.emailPhone;
    data['user_type'] = this.userType;
    data['name'] = this.name;
    data['rate'] = this.rate;
    data['user_id'] = this.userId;
    data['content'] = this.content;
    data['site_id'] = this.siteId;
    data['id'] = this.id;
    data['user_likes'] = this.userLikes;
    data['verifyCode'] = this.verifyCode;
    data['order_id'] = this.orderId;
    return data;
  }
}