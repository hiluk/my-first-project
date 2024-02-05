import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_user.freezed.dart';
part 'my_user.g.dart';

@freezed
class MyUser with _$MyUser {
  factory MyUser({
    required String email,
    required String password,
    required String uid,
    required String createdAt,
    @Default('') String name,
    @Default('') String bio,
    @Default('') String phoneNumber,
    @Default(<int>[]) List<int> favoriteIds,
  }) = _MyUser;

  factory MyUser.fromJson(Map<String, dynamic> json) => _$MyUserFromJson(json);
}
