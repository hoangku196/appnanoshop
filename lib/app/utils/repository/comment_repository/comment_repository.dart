import '../../../constants/api_path/api_path.dart';
import '../../../constants/shared_prefs_path/shared_prefs_path.dart';
import '../../models/comment_response.dart';
import '../../networking/api_provider.dart';
import '../../shared_prefs/shared_prefs.dart';
import 'package:image_picker/image_picker.dart';

class CommentRepository {
  // type 1 -> sản phẩm 2 -> tin tức
  // objectId -> id sản phẩm
  getListComment({
    required String type,
    required String objectId,
    required int page,
    required int limit,
    String? order,
  }) async {
    List<CommentResponse> _listComment = [];
    Map<String, dynamic> body = new Map<String, dynamic>();

    body['type'] = type;
    body['object_id'] = objectId;
    body['page'] = page;
    body['limit'] = limit;

    if (order != null) body['order'] = order;

    var response = await apiShoppingProvider.post(
      url: ApiPath.getComment,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: body,
    );

    (response as List).forEach(
      (e) {
        _listComment.add(CommentResponse.fromJson(e));
      },
    );

    return _listComment;
  }

  sendComment({
    required double countRate,
    required String objectId,
    required String name,
    required String type,
    required String content,
    required String emailPhone,
    List<XFile>? listImage,
  }) async {
    Map<String, dynamic> body = new Map<String, dynamic>();

    body['user_id'] = (await SharedPrefs.read(SharedPrefsPath.user) as Map)['user_id'];
    body['count_rate'] = countRate;
    body['object_id'] = objectId;
    body['Comment'] = {
      'name': name,
      'type': type,
      'content': content,
      'email_phone': emailPhone,
    };

    return await apiShoppingProvider.post(
      url: ApiPath.sendComment,
      headers: {
        "token": await SharedPrefs.read(SharedPrefsPath.token),
      },
      body: body,
    );
  }
}
