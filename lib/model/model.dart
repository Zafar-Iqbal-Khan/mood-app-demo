// To parse this JSON data, do
//
//     final moodModel = moodModelFromJson(jsonString);

import 'dart:convert';

MoodModel moodModelFromJson(String str) => MoodModel.fromJson(json.decode(str));

String moodModelToJson(MoodModel data) => json.encode(data.toJson());

class MoodModel {
  MoodModel({
    this.count,
    this.msg,
    this.data,
    this.teamMood,
    this.moodalytics,
    this.responseCode,
  });

  int? count;
  String? msg;
  Data? data;
  int? teamMood;
  List<Moodalytic>? moodalytics;
  int? responseCode;

  factory MoodModel.fromJson(Map<String, dynamic> json) => MoodModel(
        count: json["count"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
        teamMood: json["team_mood"],
        moodalytics: List<Moodalytic>.from(
            json["moodalytics"].map((x) => Moodalytic.fromJson(x))),
        responseCode: json["response_code"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "msg": msg,
        "data": data!.toJson(),
        "team_mood": teamMood,
        "moodalytics": List<dynamic>.from(moodalytics!.map((x) => x.toJson())),
        "response_code": responseCode,
      };
}

class Data {
  Data({
    this.managerId,
    this.description,
    this.emojiPoint,
    this.userProfile,
    this.reasonType,
  });

  dynamic managerId;
  String? description;
  dynamic emojiPoint;
  dynamic userProfile;
  dynamic reasonType;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        managerId: json["manager_id"],
        description: json["description"],
        emojiPoint: json["emoji_point"],
        userProfile: json["user_profile"],
        reasonType: json["reason_type"],
      );

  Map<String, dynamic> toJson() => {
        "manager_id": managerId,
        "description": description,
        "emoji_point": emojiPoint,
        "user_profile": userProfile,
        "reason_type": reasonType,
      };
}

class Moodalytic {
  Moodalytic({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.userProfileId,
    this.reasonTypeId,
    this.managerId,
    this.description,
    this.emojiPoint,
  });

  int? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userProfileId;
  int? reasonTypeId;
  int? managerId;
  String? description;
  int? emojiPoint;

  factory Moodalytic.fromJson(Map<String, dynamic> json) => Moodalytic(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userProfileId: json["user_profile_id"],
        reasonTypeId: json["reason_type_id"],
        managerId: json["manager_id"],
        description: json["description"],
        emojiPoint: json["emoji_point"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at":
            "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}",
        "updated_at": updatedAt!.toIso8601String(),
        "user_profile_id": userProfileId,
        "reason_type_id": reasonTypeId,
        "manager_id": managerId,
        "description": description,
        "emoji_point": emojiPoint,
      };
}
