// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MyUserImpl _$$MyUserImplFromJson(Map<String, dynamic> json) => _$MyUserImpl(
      email: json['email'] as String,
      password: json['password'] as String,
      uid: json['uid'] as String,
      createdAt: json['createdAt'] as String?,
      name: json['name'] as String?,
      bio: json['bio'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      favoriteIds: (json['favoriteIds'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );

Map<String, dynamic> _$$MyUserImplToJson(_$MyUserImpl instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'uid': instance.uid,
      'createdAt': instance.createdAt,
      'name': instance.name,
      'bio': instance.bio,
      'phoneNumber': instance.phoneNumber,
      'favoriteIds': instance.favoriteIds,
    };
