import 'package:json_annotation/json_annotation.dart';
import "role.dart";
part 'userinfo.g.dart';

@JsonSerializable()
class Userinfo {
    Userinfo();

    String login;
    num id;
    String name;
    String pic;
    String mobile;
    String tel;
    String agent;
    String job;
    List<Role> roles;
    String email;
    bool hideTrends;
    
    factory Userinfo.fromJson(Map<String,dynamic> json) => _$UserinfoFromJson(json);
    Map<String, dynamic> toJson() => _$UserinfoToJson(this);
}
