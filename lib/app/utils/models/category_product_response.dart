class CategoryProductResponse {
  String? id;
  String? catId;
  String? code;
  String? attributeSetId;
  String? siteId;
  String? catParent;
  String? catName;
  String? alias;
  String? catOrder;
  String? catDescription;
  String? catCountchild;
  String? imagePath;
  String? imageName;
  String? status;
  String? createdTime;
  String? modifiedTime;
  String? showinhome;
  String? metaKeywords;
  String? metaDescription;
  String? metaTitle;
  String? iconPath;
  String? iconName;
  String? layoutAction;
  String? viewAction;
  String? sizeChartPath;
  String? sizeChartName;
  String? shortDescription;
  String? newsCategoryId;
  String? catKiotvietId;
  String? newUpdate;
  String? link;
  bool? active;
  List<CategoryProductResponse>? children;

  CategoryProductResponse({
    this.id,
    this.catId,
    this.code,
    this.attributeSetId,
    this.siteId,
    this.catParent,
    this.catName,
    this.alias,
    this.catOrder,
    this.catDescription,
    this.catCountchild,
    this.imagePath,
    this.imageName,
    this.status,
    this.createdTime,
    this.modifiedTime,
    this.showinhome,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    this.iconPath,
    this.iconName,
    this.layoutAction,
    this.viewAction,
    this.sizeChartPath,
    this.sizeChartName,
    this.shortDescription,
    this.newsCategoryId,
    this.catKiotvietId,
    this.newUpdate,
    this.link,
    this.active,
    this.children,
  });

  CategoryProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    catId = json['cat_id'];
    code = json['code'];
    attributeSetId = json['attribute_set_id'];
    siteId = json['site_id'];
    catParent = json['cat_parent'];
    catName = json['cat_name'];
    alias = json['alias'];
    catOrder = json['cat_order'];
    catDescription = json['cat_description'];
    catCountchild = json['cat_countchild'];
    imagePath = json['image_path'];
    imageName = json['image_name'];
    status = json['status'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    showinhome = json['showinhome'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    iconPath = json['icon_path'];
    iconName = json['icon_name'];
    layoutAction = json['layout_action'];
    viewAction = json['view_action'];
    sizeChartPath = json['size_chart_path'];
    sizeChartName = json['size_chart_name'];
    shortDescription = json['short_description'];
    newsCategoryId = json['news_category_id'];
    catKiotvietId = json['cat_kiotviet_id'];
    newUpdate = json['new_update'];
    link = json['link'];
    active = json['active'];
    if (json['children'] != null) {
      children = [];
      try {
        var _mapChildren = json['children'] as Map<String, dynamic>;
        _mapChildren.values.forEach(
              (element) {
            children!.add(CategoryProductResponse.fromJson(element));
          },
        );
      } catch (e) {
        print(e);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cat_id'] = this.catId;
    data['code'] = this.code;
    data['attribute_set_id'] = this.attributeSetId;
    data['site_id'] = this.siteId;
    data['cat_parent'] = this.catParent;
    data['cat_name'] = this.catName;
    data['alias'] = this.alias;
    data['cat_order'] = this.catOrder;
    data['cat_description'] = this.catDescription;
    data['cat_countchild'] = this.catCountchild;
    data['image_path'] = this.imagePath;
    data['image_name'] = this.imageName;
    data['status'] = this.status;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['showinhome'] = this.showinhome;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['icon_path'] = this.iconPath;
    data['icon_name'] = this.iconName;
    data['layout_action'] = this.layoutAction;
    data['view_action'] = this.viewAction;
    data['size_chart_path'] = this.sizeChartPath;
    data['size_chart_name'] = this.sizeChartName;
    data['short_description'] = this.shortDescription;
    data['news_category_id'] = this.newsCategoryId;
    data['cat_kiotviet_id'] = this.catKiotvietId;
    data['new_update'] = this.newUpdate;
    data['link'] = this.link;
    data['active'] = this.active;
    return data;
  }
}
