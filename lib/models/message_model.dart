import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class MessageModel {
  final String id;
  final String from;
  final String roomId;
  final String text;
  final int sentAt;
  final dynamic timestamp;
  final dynamic content;

  MessageModel({
    required this.id,
    required this.from,
    required this.roomId,
    required this.text,
    required this.sentAt,
    required this.timestamp,
    required this.content,
  });

  int getTimesTampMillis() {
    return (timestamp as Timestamp).microsecondsSinceEpoch;
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
