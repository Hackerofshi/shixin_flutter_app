import 'package:json_annotation/json_annotation.dart';

part 'projectofnet.g.dart';

@JsonSerializable()
class Projectofnet {
    Projectofnet();

    num courseId;
    num id;
    String name;
    num order;
    num parentChapterId;
    bool userControlSetTop;
    num visible;
    
    factory Projectofnet.fromJson(Map<String,dynamic> json) => _$ProjectofnetFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectofnetToJson(this);
}
