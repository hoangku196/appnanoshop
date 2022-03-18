import 'dart:convert';

class ProductResponse {
  String? id;
  String? attributeSetId;
  String? name;
  String? code;
  String? barcode;
  String? slogan;
  String? color;
  String? price;
  String? priceMarket;
  String? priceSell;
  String? includeVat;
  String? quantity;
  String? status;
  String? state;
  String? position;
  String? productSortdescBk;
  String? productDescBk;
  String? avatarPath;
  String? avatarName;
  String? iconPath;
  String? iconName;
  String? avatarWtPath;
  String? avatarWtName;
  String? currency;
  String? avatarId;
  String? siteId;
  String? parentId;
  String? createdUser;
  String? modifiedUser;
  String? createdTime;
  String? modifiedTime;
  String? metaKeywords;
  String? metaDescription;
  String? metaTitle;
  String? listProductRelate;
  String? productCategoryId;
  String? categoryTrack;
  String? ishot;
  String? issale;
  String? ispriceday;
  String? alias;
  String? viewed;
  String? isnew;
  String? isselling;
  String? iswaitting;
  String? manufacturerId;
  String? manufacturerCategoryId;
  String? manufacturerCategoryTrack;
  String? typeProduct;
  String? weight;
  String? capacity;
  String? isConfigurable;
  String? bonusPoint;
  String? donate;
  String? provinceId;
  String? storeIds;
  String? membersOnly;
  String? seasonId;
  String? urlTo;
  String? unmarked;
  String? guarantee;
  String? proAttributes;
  String? unit;
  String? proAttributeSearchs;
  String? synId;
  String? deletesave;
  String? productInfo;
  String? shopStore;
  String? specifications;
  String? totalSell;
  String? rateInfo;
  String? rate;
  String? rateCount;
  String? discountHas;
  String? discountInfo;
  String? discountPercent;
  String? productSortdesc;
  String? productDesc;
  String? link;
  String? priceText;
  String? priceMarketText;
  String? priceSaveText;
  List<ImageDetailProduct> listImage = [];
  int total = 0;

  ProductResponse({
    this.id,
    this.attributeSetId,
    this.name,
    this.code,
    this.barcode,
    this.slogan,
    this.color,
    this.price,
    this.priceMarket,
    this.priceSell,
    this.includeVat,
    this.quantity,
    this.status,
    this.state,
    this.position,
    this.productSortdescBk,
    this.productDescBk,
    this.avatarPath,
    this.avatarName,
    this.iconPath,
    this.iconName,
    this.avatarWtPath,
    this.avatarWtName,
    this.currency,
    this.avatarId,
    this.siteId,
    this.parentId,
    this.createdUser,
    this.modifiedUser,
    this.createdTime,
    this.modifiedTime,
    this.metaKeywords,
    this.metaDescription,
    this.metaTitle,
    this.listProductRelate,
    this.productCategoryId,
    this.categoryTrack,
    this.ishot,
    this.issale,
    this.ispriceday,
    this.alias,
    this.viewed,
    this.isnew,
    this.isselling,
    this.iswaitting,
    this.manufacturerId,
    this.manufacturerCategoryId,
    this.manufacturerCategoryTrack,
    this.typeProduct,
    this.weight,
    this.capacity,
    this.isConfigurable,
    this.bonusPoint,
    this.donate,
    this.provinceId,
    this.storeIds,
    this.membersOnly,
    this.seasonId,
    this.urlTo,
    this.unmarked,
    this.guarantee,
    this.proAttributes,
    this.unit,
    this.proAttributeSearchs,
    this.synId,
    this.deletesave,
    this.productInfo,
    this.shopStore,
    this.specifications,
    this.totalSell,
    this.rateInfo,
    this.rate,
    this.rateCount,
    this.discountHas,
    this.discountInfo,
    this.discountPercent,
    this.productSortdesc,
    this.productDesc,
    this.link,
    this.priceText,
    this.priceMarketText,
    this.priceSaveText,
    required this.total,
    required this.listImage,
  });

  ProductResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attributeSetId = json['attribute_set_id'];
    name = json['name'];
    code = json['code'];
    barcode = json['barcode'];
    slogan = json['slogan'];
    color = json['color'];
    price = json['price'];
    priceMarket = json['price_market'];
    priceSell = json['price_sell'];
    includeVat = json['include_vat'];
    quantity = json['quantity'];
    status = json['status'];
    state = json['state'];
    position = json['position'];
    productSortdescBk = json['product_sortdesc_bk'];
    productDescBk = json['product_desc_bk'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    iconPath = json['icon_path'];
    iconName = json['icon_name'];
    avatarWtPath = json['avatar_wt_path'];
    avatarWtName = json['avatar_wt_name'];
    currency = json['currency'];
    avatarId = json['avatar_id'];
    siteId = json['site_id'];
    parentId = json['parent_id'];
    createdUser = json['created_user'];
    modifiedUser = json['modified_user'];
    createdTime = json['created_time'];
    modifiedTime = json['modified_time'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    metaTitle = json['meta_title'];
    listProductRelate = json['list_product_relate'];
    productCategoryId = json['product_category_id'];
    categoryTrack = json['category_track'];
    ishot = json['ishot'];
    issale = json['issale'];
    ispriceday = json['ispriceday'];
    alias = json['alias'];
    viewed = json['viewed'];
    isnew = json['isnew'];
    isselling = json['isselling'];
    iswaitting = json['iswaitting'];
    manufacturerId = json['manufacturer_id'];
    manufacturerCategoryId = json['manufacturer_category_id'];
    manufacturerCategoryTrack = json['manufacturer_category_track'];
    typeProduct = json['type_product'];
    weight = json['weight'];
    capacity = json['capacity'];
    isConfigurable = json['is_configurable'];
    bonusPoint = json['bonus_point'];
    donate = json['donate'];
    provinceId = json['province_id'];
    storeIds = json['store_ids'];
    membersOnly = json['members_only'];
    seasonId = json['season_id'];
    urlTo = json['url_to'];
    unmarked = json['unmarked'];
    guarantee = json['guarantee'];
    proAttributes = json['pro_attributes'];
    unit = json['unit'];
    proAttributeSearchs = json['pro_attribute_searchs'];
    synId = json['syn_id'];
    deletesave = json['deletesave'];
    productInfo = json['product_info'];
    shopStore = json['shop_store'];
    specifications = json['specifications'];
    totalSell = json['total_sell'];
    rateInfo = json['rate_info'];
    rate = json['rate'];
    rateCount = json['rate_count'];
    discountHas = json['discount_has'];
    discountInfo = json['discount_info'];
    discountPercent = json['discount_percent'] ?? '0';
    productSortdesc = json['product_sortdesc'];
    productDesc = json['product_desc'];
    link = json['link'];
    priceText = json['price_text'];
    priceMarketText = json['price_market_text'];
    priceSaveText = json['price_save_text'];
    if (json['total'] != null) total = json['total'];
    try {
      var _mapData = json['images'] as Map<String, dynamic>;

      _mapData.values.forEach(
            (element) {
          listImage.add(ImageDetailProduct.fromJson(element));
        },
      );
    } catch (e) {}
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['attribute_set_id'] = this.attributeSetId;
    data['name'] = this.name;
    data['code'] = this.code;
    data['barcode'] = this.barcode;
    data['slogan'] = this.slogan;
    data['color'] = this.color;
    data['price'] = this.price;
    data['price_market'] = this.priceMarket;
    data['price_sell'] = this.priceSell;
    data['include_vat'] = this.includeVat;
    data['quantity'] = this.quantity;
    data['status'] = this.status;
    data['state'] = this.state;
    data['position'] = this.position;
    data['product_sortdesc_bk'] = this.productSortdescBk;
    data['product_desc_bk'] = this.productDescBk;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['icon_path'] = this.iconPath;
    data['icon_name'] = this.iconName;
    data['avatar_wt_path'] = this.avatarWtPath;
    data['avatar_wt_name'] = this.avatarWtName;
    data['currency'] = this.currency;
    data['avatar_id'] = this.avatarId;
    data['site_id'] = this.siteId;
    data['parent_id'] = this.parentId;
    data['created_user'] = this.createdUser;
    data['modified_user'] = this.modifiedUser;
    data['created_time'] = this.createdTime;
    data['modified_time'] = this.modifiedTime;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['meta_title'] = this.metaTitle;
    data['list_product_relate'] = this.listProductRelate;
    data['product_category_id'] = this.productCategoryId;
    data['category_track'] = this.categoryTrack;
    data['ishot'] = this.ishot;
    data['issale'] = this.issale;
    data['ispriceday'] = this.ispriceday;
    data['alias'] = this.alias;
    data['viewed'] = this.viewed;
    data['isnew'] = this.isnew;
    data['isselling'] = this.isselling;
    data['iswaitting'] = this.iswaitting;
    data['manufacturer_id'] = this.manufacturerId;
    data['manufacturer_category_id'] = this.manufacturerCategoryId;
    data['manufacturer_category_track'] = this.manufacturerCategoryTrack;
    data['type_product'] = this.typeProduct;
    data['weight'] = this.weight;
    data['capacity'] = this.capacity;
    data['is_configurable'] = this.isConfigurable;
    data['bonus_point'] = this.bonusPoint;
    data['donate'] = this.donate;
    data['province_id'] = this.provinceId;
    data['store_ids'] = this.storeIds;
    data['members_only'] = this.membersOnly;
    data['season_id'] = this.seasonId;
    data['url_to'] = this.urlTo;
    data['unmarked'] = this.unmarked;
    data['guarantee'] = this.guarantee;
    data['pro_attributes'] = this.proAttributes;
    data['unit'] = this.unit;
    data['pro_attribute_searchs'] = this.proAttributeSearchs;
    data['syn_id'] = this.synId;
    data['deletesave'] = this.deletesave;
    data['product_info'] = this.productInfo;
    data['shop_store'] = this.shopStore;
    data['specifications'] = this.specifications;
    data['total_sell'] = this.totalSell;
    data['rate_info'] = this.rateInfo;
    data['rate'] = this.rate;
    data['rate_count'] = this.rateCount;
    data['discount_has'] = this.discountHas;
    data['discount_info'] = this.discountInfo;
    data['discount_percent'] = this.discountPercent;
    data['product_sortdesc'] = this.productSortdesc;
    data['product_desc'] = this.productDesc;
    data['link'] = this.link;
    data['price_text'] = this.priceText;
    data['price_market_text'] = this.priceMarketText;
    data['price_save_text'] = this.priceSaveText;
    data['total'] = this.total;
    return data;
  }

  static String encode(List<ProductResponse> products) => json.encode(
    products.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
  );

  static List<ProductResponse> decode(String products) =>
      (json.decode(products) as List<dynamic>)
          .map<ProductResponse>((item) => ProductResponse.fromJson(item))
          .toList();

  Map<String, dynamic> toJsonPayment() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['qty'] = this.total;

    return data;
  }
}

class ImageDetailProduct {
  String? imgId;
  String? productId;
  String? name;
  String? path;
  String? displayName;
  String? description;
  String? alias;
  String? siteId;
  String? userId;
  String? height;
  String? width;
  String? createdTime;
  String? modifiedTime;
  String? resizes;
  String? order;
  String? groupImg;
  String? isWt;

  ImageDetailProduct(
      {this.imgId,
        this.productId,
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
        this.groupImg,
        this.isWt});

  ImageDetailProduct.fromJson(Map<String, dynamic> json) {
    imgId = json['img_id'];
    productId = json['product_id'];
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
    groupImg = json['group_img'];
    isWt = json['is_wt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['img_id'] = this.imgId;
    data['product_id'] = this.productId;
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
    data['group_img'] = this.groupImg;
    data['is_wt'] = this.isWt;
    return data;
  }
}
