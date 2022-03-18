import 'dart:io';

abstract class SendCommentEvent {}

class Send extends SendCommentEvent {
  final String objectId, name, type, content, emailPhone;
  final double countRate;

  final List<File>? listImage;

  Send({
    required this.objectId,
    required this.name,
    required this.type,
    required this.content,
    required this.emailPhone,
    required this.countRate,
    this.listImage,
  });
}

class CloseSendFailureDialog extends SendCommentEvent{

}
