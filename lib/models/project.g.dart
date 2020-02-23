// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) {
  return Project()
    ..id = json['id'] as num
    ..code = json['code'] as String
    ..name = json['name'] as String
    ..regionId = json['regionId'] as num
    ..regionName = json['regionName'] as String
    ..categories = (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..stage = json['stage'] as String
    ..area = json['area'] as num
    ..scale = json['scale'] as num
    ..address = json['address'] as String
    ..memo = json['memo'] as String
    ..pics = (json['pics'] as List)
        ?.map((e) => e == null ? null : Pic.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..budget = json['budget'] as num
    ..builderId = json['builderId'] as num
    ..builderName = json['builderName'] as String
    ..builderPic = json['builderPic'] as String
    ..buildTime = json['buildTime'] as String
    ..locked = json['locked'] as bool
    ..archived = json['archived'] as bool
    ..isFavorite = json['isFavorite'] as bool;
}

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'regionId': instance.regionId,
      'regionName': instance.regionName,
      'categories': instance.categories,
      'stage': instance.stage,
      'area': instance.area,
      'scale': instance.scale,
      'address': instance.address,
      'memo': instance.memo,
      'pics': instance.pics,
      'budget': instance.budget,
      'builderId': instance.builderId,
      'builderName': instance.builderName,
      'builderPic': instance.builderPic,
      'buildTime': instance.buildTime,
      'locked': instance.locked,
      'archived': instance.archived,
      'isFavorite': instance.isFavorite
    };
