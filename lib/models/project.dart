import 'package:json_annotation/json_annotation.dart';
import "category.dart";
import "pic.dart";
part 'project.g.dart';

@JsonSerializable()
class Project {
    Project();

    num id;
    String code;
    String name;
    num regionId;
    String regionName;
    List<Category> categories;
    String stage;
    num area;
    num scale;
    String address;
    String memo;
    List<Pic> pics;
    num budget;
    num builderId;
    String builderName;
    String builderPic;
    String buildTime;
    bool locked;
    bool archived;
    bool isFavorite;
    
    factory Project.fromJson(Map<String,dynamic> json) => _$ProjectFromJson(json);
    Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
