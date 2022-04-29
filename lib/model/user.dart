import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';


@JsonSerializable()
class User {
  @JsonKey(name : 'id')
  int id;

  @JsonKey(name : 'email')
  String email;

  @JsonKey(name : 'first_name')
  String firstname;

  @JsonKey(name : 'last_name')
  String lastname;

  @JsonKey(name : 'avatar')
  String avatar;

  User(
    {
    required this.id,
    required this.email,
    required this.firstname,
    required this.lastname,
    required this.avatar,
  }
  );

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
  

   

 

