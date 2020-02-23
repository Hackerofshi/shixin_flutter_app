import 'package:json_annotation/json_annotation.dart';

part 'pic.g.dart';

@JsonSerializable()
class Pic {
    Pic();

    String oriname;
    String url;
    
    factory Pic.fromJson(Map<String,dynamic> json) => _$PicFromJson(json);
    Map<String, dynamic> toJson() => _$PicToJson(this);
}
