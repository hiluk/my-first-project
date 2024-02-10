import 'package:cloud_firestore/cloud_firestore.dart';

class MyUser {
  final String email;
  final String password;
  final String uid;
  final String createdAt;
  final String? name;
  final String? bio;
  final String? phoneNumber;
  final List<dynamic>? favoriteIds;
  MyUser({
    required this.email,
    required this.password,
    required this.uid,
    required this.createdAt,
    this.name,
    this.bio,
    this.phoneNumber,
    this.favoriteIds,
  });

  factory MyUser.fromFireStore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return MyUser(
      email: data?['email'],
      password: data?['password'],
      uid: data?['uid'],
      createdAt: data?['createdAt'],
      name: data?['name'],
      bio: data?['bio'],
      phoneNumber: data?['phoneNumber'],
      favoriteIds: data?['favoriteIds'] is Iterable
          ? List.from(data?['favoriteIds'])
          : null,
    );
  }

  MyUser.fromJson(Map<String, dynamic> json)
      : email = json['email'] as String,
        password = json['password'] as String,
        uid = json['uid'] as String,
        createdAt = json['createdAt'] as String,
        name = json['name'] as String?,
        bio = json['bio'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        favoriteIds = json['favoriteIds'] as List<dynamic>?;

  MyUser copyWith({
    String? email,
    String? password,
    String? uid,
    String? createdAt,
    String? name,
    String? bio,
    String? phoneNumber,
    List<dynamic>? favoriteIds,
  }) {
    return MyUser(
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      favoriteIds: favoriteIds ?? this.favoriteIds,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) 'email': email,
      if (name != null) 'password': password,
      if (name != null) 'uid': uid,
      if (name != null) 'createdAt': createdAt,
      if (name != null) 'name': name,
      if (name != null) 'bio': bio,
      if (name != null) 'phoneNumber': phoneNumber,
      if (name != null) 'favoriteIds': favoriteIds,
    };
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
        'uid': uid,
        'createdAt': createdAt,
        'name': name,
        'bio': bio,
        'phoneNumber': phoneNumber,
        'favoriteIds': favoriteIds,
      };
}
