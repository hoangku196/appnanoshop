class UserResponse {
  String? userId;
  String? siteId;
  String? name;
  String? email;
  String? password;
  Null? salt;
  String? sex;
  String? birthday;
  String? address;
  String? status;
  String? phone;
  String? provinceId;
  String? districtId;
  String? wardId;
  String? active;
  String? createdTime;
  String? modifiedTime;
  String? identityCard;
  String? createdIdentityCard;
  String? addressIdentityCard;
  String? frontIdentityCard;
  String? backIdentityCard;
  String? bankId;
  String? bankName;
  String? bankBranch;
  String? userIntroduceId;
  String? phoneIntroduce;
  String? type;
  String? verifiedEmail;
  String? verifiedCode;
  String? fbid;
  String? googleId;
  String? avatarPath;
  String? avatarName;
  String? bonusPoint;
  String? donate;
  String? country;
  String? companyName;
  String? zipcode;
  String? state;
  String? city;
  Null? facebookUrl;
  String? firstName;
  String? typeUser;
  String? saleUserId;
  String? tokenApp;

  UserResponse(
      {this.userId,
        this.siteId,
        this.name,
        this.email,
        this.password,
        this.salt,
        this.sex,
        this.birthday,
        this.address,
        this.status,
        this.phone,
        this.provinceId,
        this.districtId,
        this.wardId,
        this.active,
        this.createdTime,
        this.modifiedTime,
        this.identityCard,
        this.createdIdentityCard,
        this.addressIdentityCard,
        this.frontIdentityCard,
        this.backIdentityCard,
        this.bankId,
        this.bankName,
        this.bankBranch,
        this.userIntroduceId,
        this.phoneIntroduce,
        this.type,
        this.verifiedEmail,
        this.verifiedCode,
        this.fbid,
        this.googleId,
        this.avatarPath,
        this.avatarName,
        this.bonusPoint,
        this.donate,
        this.country,
        this.companyName,
        this.zipcode,
        this.state,
        this.city,
        this.facebookUrl,
        this.firstName,
        this.typeUser,
        this.saleUserId,
        this.tokenApp});

  UserResponse.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    siteId = json['site_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    salt = json['salt'];
    sex = json['sex'];
    birthday = json['birthday'];
    address = json['address'];
    status = json['status'];
    phone = json['phone'];
    provinceId = json['province_id'];
    districtId = json['district_id'];
    wardId = json['ward_id'];
    active = json['active'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    identityCard = json['identity_card'];
    createdIdentityCard = json['created_identity_card'];
    addressIdentityCard = json['address_identity_card'];
    frontIdentityCard = json['front_identity_card'];
    backIdentityCard = json['back_identity_card'];
    bankId = json['bank_id'];
    bankName = json['bank_name'];
    bankBranch = json['bank_branch'];
    userIntroduceId = json['user_introduce_id'];
    phoneIntroduce = json['phone_introduce'];
    type = json['type'];
    verifiedEmail = json['verified_email'];
    verifiedCode = json['verified_code'];
    fbid = json['fbid'];
    googleId = json['google_id'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    bonusPoint = json['bonus_point'];
    donate = json['donate'];
    country = json['country'];
    companyName = json['company_name'];
    zipcode = json['zipcode'];
    state = json['state'];
    city = json['city'];
    facebookUrl = json['facebook_url'];
    firstName = json['first_name'];
    typeUser = json['type_user'];
    saleUserId = json['sale_user_id'];
    tokenApp = json['token_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['site_id'] = this.siteId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['salt'] = this.salt;
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['address'] = this.address;
    data['status'] = this.status;
    data['phone'] = this.phone;
    data['province_id'] = this.provinceId;
    data['district_id'] = this.districtId;
    data['ward_id'] = this.wardId;
    data['active'] = this.active;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['identity_card'] = this.identityCard;
    data['created_identity_card'] = this.createdIdentityCard;
    data['address_identity_card'] = this.addressIdentityCard;
    data['front_identity_card'] = this.frontIdentityCard;
    data['back_identity_card'] = this.backIdentityCard;
    data['bank_id'] = this.bankId;
    data['bank_name'] = this.bankName;
    data['bank_branch'] = this.bankBranch;
    data['user_introduce_id'] = this.userIntroduceId;
    data['phone_introduce'] = this.phoneIntroduce;
    data['type'] = this.type;
    data['verified_email'] = this.verifiedEmail;
    data['verified_code'] = this.verifiedCode;
    data['fbid'] = this.fbid;
    data['google_id'] = this.googleId;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['bonus_point'] = this.bonusPoint;
    data['donate'] = this.donate;
    data['country'] = this.country;
    data['company_name'] = this.companyName;
    data['zipcode'] = this.zipcode;
    data['state'] = this.state;
    data['city'] = this.city;
    data['facebook_url'] = this.facebookUrl;
    data['first_name'] = this.firstName;
    data['type_user'] = this.typeUser;
    data['sale_user_id'] = this.saleUserId;
    data['token_app'] = this.tokenApp;
    return data;
  }
}