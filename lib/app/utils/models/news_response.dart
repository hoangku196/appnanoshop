class NewsResponse {
  String? newsId;
  String? siteId;
  String? newsCategoryId;
  String? newsTitle;
  String? newsSortdesc;
  String? newsDesc;
  String? alias;
  String? status;
  String? metaKeywords;
  String? metaDescription;
  String? metaTitle;
  String? userId;
  String? imagePath;
  String? imageName;
  String? createdTime;
  String? modifiedTime;
  String? modifiedBy;
  String? newsHot;
  String? newsSource;
  String? poster;
  String? publicdate;
  String? completedTime;
  String? storeIds;
  String? viewed;
  String? categoryTrack;
  Null? videoLinks;
  String? viewedFake;
  String? useAvatarInDetail;
  String? coverPath;
  String? coverName;
  String? coverId;
  Null? fileId;
  String? listCategory;
  String? listCategoryAll;
  String? avatar;
  List<Images>? images;

  NewsResponse(
      {this.newsId,
        this.siteId,
        this.newsCategoryId,
        this.newsTitle,
        this.newsSortdesc,
        this.newsDesc,
        this.alias,
        this.status,
        this.metaKeywords,
        this.metaDescription,
        this.metaTitle,
        this.userId,
        this.imagePath,
        this.imageName,
        this.createdTime,
        this.modifiedTime,
        this.modifiedBy,
        this.newsHot,
        this.newsSource,
        this.poster,
        this.publicdate,
        this.completedTime,
        this.storeIds,
        this.viewed,
        this.categoryTrack,
        this.videoLinks,
        this.viewedFake,
        this.useAvatarInDetail,
        this.coverPath,
        this.coverName,
        this.coverId,
        this.fileId,
        this.listCategory,
        this.listCategoryAll,
        this.avatar,
        this.images});

  NewsResponse.fromJson(Map<String, dynamic> json) {
    newsId = json['news_id'];
    siteId = json['site_id'];
    newsCategoryId = json['news_category_id'];
    newsTitle = json['news_title'];
    newsSortdesc = json['news_sortdesc'];
    newsDesc = json['news_desc'];
    alias = json['alias'];
    status = json['status'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    userId = json['user_id'];
    imagePath = json['image_path'];
    imageName = json['image_name'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    modifiedBy = json['modified_by'];
    newsHot = json['news_hot'];
    newsSource = json['news_source'];
    poster = json['poster'];
    publicdate = json['publicdate'];
    completedTime = json['completed_time'];
    storeIds = json['store_ids'];
    viewed = json['viewed'];
    categoryTrack = json['category_track'];
    videoLinks = json['video_links'];
    viewedFake = json['viewed_fake'];
    useAvatarInDetail = json['use_avatar_in_detail'];
    coverPath = json['cover_path'];
    coverName = json['cover_name'];
    coverId = json['cover_id'];
    fileId = json['file_id'];
    listCategory = json['list_category'];
    listCategoryAll = json['list_category_all'];
    avatar = json['avatar'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['news_id'] = this.newsId;
    data['site_id'] = this.siteId;
    data['news_category_id'] = this.newsCategoryId;
    data['news_title'] = this.newsTitle;
    data['news_sortdesc'] = this.newsSortdesc;
    data['news_desc'] = this.newsDesc;
    data['alias'] = this.alias;
    data['status'] = this.status;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['user_id'] = this.userId;
    data['image_path'] = this.imagePath;
    data['image_name'] = this.imageName;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['modified_by'] = this.modifiedBy;
    data['news_hot'] = this.newsHot;
    data['news_source'] = this.newsSource;
    data['poster'] = this.poster;
    data['publicdate'] = this.publicdate;
    data['completed_time'] = this.completedTime;
    data['store_ids'] = this.storeIds;
    data['viewed'] = this.viewed;
    data['category_track'] = this.categoryTrack;
    data['video_links'] = this.videoLinks;
    data['viewed_fake'] = this.viewedFake;
    data['use_avatar_in_detail'] = this.useAvatarInDetail;
    data['cover_path'] = this.coverPath;
    data['cover_name'] = this.coverName;
    data['cover_id'] = this.coverId;
    data['file_id'] = this.fileId;
    data['list_category'] = this.listCategory;
    data['list_category_all'] = this.listCategoryAll;
    data['avatar'] = this.avatar;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imgId;
  String? id;
  String? name;
  String? path;
  String? displayName;
  String? description;
  String? alias;
  String? siteId;
  Null? userId;
  String? height;
  String? width;
  String? createdTime;
  String? modifiedTime;
  String? resizes;
  String? order;
  String? type;

  Images(
      {this.imgId,
        this.id,
        this.name,
        this.path,
        this.displayName,
        this.description,
        this.alias,
        this.siteId,
        this.userId,
        this.height,
        this.width,
        this.createdTime,
        this.modifiedTime,
        this.resizes,
        this.order,
        this.type});

  Images.fromJson(Map<String, dynamic> json) {
    imgId = json['img_id'];
    id = json['id'];
    name = json['name'];
    path = json['path'];
    displayName = json['display_name'];
    description = json['description'];
    alias = json['alias'];
    siteId = json['site_id'];
    userId = json['user_id'];
    height = json['height'];
    width = json['width'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    resizes = json['resizes'];
    order = json['order'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_id'] = this.imgId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['path'] = this.path;
    data['display_name'] = this.displayName;
    data['description'] = this.description;
    data['alias'] = this.alias;
    data['site_id'] = this.siteId;
    data['user_id'] = this.userId;
    data['height'] = this.height;
    data['width'] = this.width;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['resizes'] = this.resizes;
    data['order'] = this.order;
    data['type'] = this.type;
    return data;
  }
}