// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projectofnet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Projectofnet _$ProjectofnetFromJson(Map<String, dynamic> json) {
  return Projectofnet()
    ..courseId = json['courseId'] as num
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..order = json['order'] as num
    ..parentChapterId = json['parentChapterId'] as num
    ..userControlSetTop = json['userControlSetTop'] as bool
    ..visible = json['visible'] as num;
}

Map<String, dynamic> _$ProjectofnetToJson(Projectofnet instance) =>
    <String, dynamic>{
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
