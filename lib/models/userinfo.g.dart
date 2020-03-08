// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userinfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Userinfo _$UserinfoFromJson(Map<String, dynamic> json) {
  return Userinfo()
    ..login = json['login'] as String
    ..id = json['id'] as num
    ..name = json['name'] as String
    ..pic = json['pic'] as String
    ..mobile = json['mobile'] as String
    ..tel = json['tel'] as String
    ..agent = json['agent'] as String
    ..job = json['job'] as String
    ..roles = (json['roles'] as List)
        ?.map(
            (e) => e == null ? null : Role.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..email = json['email'] as String
    ..hideTrends = json['hideTrends'] as bool;
}

Map<String, dynamic> _$UserinfoToJson(Userinfo instance) => <String, dynamic>{
      'login': instance.login,
      'id': instance.id,
      'name': instance.name,
      'pic': instance.pic,
      'mobile': instance.mobile,
      'tel': instance.tel,
      'agent': instance.agent,
      'job': instance.job,
      'roles': instance.roles,
      'email': instance.email,
      'hideTrends': instance.hideTrends
    };
