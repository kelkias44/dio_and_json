import 'package:json_annotation/json_annotation.dart';
import 'package:dio_and_json/model/user.dart';

part 'list_users_respo.g.dart';



@JsonSerializable()
class ListUsersResponse{

  @JsonKey(name :'page' )
  int page;

  @JsonKey(name :'per_page' )
  int perPage;

  @JsonKey(name :'total' )
  int total;

  @JsonKey(name :'total_pages' )
  int totalPages;

  @JsonKey(name: 'data')
  List<User> users;

  ListUsersResponse({
    required this.users, required this.page, required this.perPage, required this.total, required this.totalPages
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) => _$ListUsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListUsersResponseToJson(this);

}