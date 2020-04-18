import 'package:json_annotation/json_annotation.dart';

part 'bannerdata.g.dart';

@JsonSerializable()
class Bannerdata {
    Bannerdata();

    String desc;
    num id;
    String imagePath;
    num isVisible;
    num order;
    String title;
    num type;
    String url;
    
    factory Bannerdata.fromJson(Map<String,dynamic> json) => _$BannerdataFromJson(json);
    Map<String, dynamic> toJson() => _$BannerdataToJson(this);
}
