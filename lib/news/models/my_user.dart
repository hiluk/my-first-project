import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@unfreezed
class MyUser with _$MyUser {
  factory MyUser({
    required String email,
    required String password,
    required String uid,
    String? createdAt,
    String? name,
    String? bio,
    String? phoneNumber,
    List<int>? favoriteIds,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
