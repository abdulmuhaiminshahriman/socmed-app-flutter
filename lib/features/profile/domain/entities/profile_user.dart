import 'package:socmed_app_flutter/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required super.uuid,
    required super.email,
    required super.name,
    required this.bio,
    required this.profileImageUrl,
  });

  ProfileUser copyWith({ String? newBio, String? newProfileImageUrl }) {
    return ProfileUser(
      uuid: uuid,
      email: email,
      name: name,
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl ?? profileImageUrl,
    );
  }

  // convert profile user to json
  @override
  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'email': email,
    'name': name,
    'bio': bio,
    'profileImageUrl': profileImageUrl,
  };

  // convert json to profile user
  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
    uuid: json['uuid'],
    email: json['email'],
    name: json['name'],
    bio: json['bio'] ?? '',
    profileImageUrl: json['profileImageUrl'] ?? '',
  );
}