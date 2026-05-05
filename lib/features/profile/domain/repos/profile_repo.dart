import 'package:socmed_app_flutter/features/profile/domain/entities/profile_user.dart';
/*

Profile Repository: for the profile data

*/

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserProfile(String uuid);
  Future<void> updateProfile(ProfileUser updatedProfile);
}