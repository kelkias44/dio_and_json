// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_users_respo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) =>
    ListUsersResponse(
      users: (json['data'] as List<dynamic>)
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int,
      perPage: json['per_page'] as int,
      total: json['total'] as int,
      totalPages: json['total_pages'] as int,
    );

Map<String, dynamic> _$ListUsersResponseToJson(ListUsersResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total': instance.total,
      'total_pages': instance.totalPages,
      'data': instance.users,
    };
