import 'package:socmed_app_flutter/features/profile/domain/repos/profile_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:socmed_app_flutter/features/profile/domain/entities/profile_user.dart';

class FirebaseProfileRepo implements ProfileRepo {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<ProfileUser?> fetchUserProfile(String uuid) async {
    try {
      final userDoc = await firebaseFirestore
          .collection('users')
          .doc(uuid)
          .get();
      if (userDoc.exists) {
        final userData = userDoc.data();

        if (userData != null) {
          return ProfileUser(
            uuid: uuid,
            email: userData['email'],
            name: userData['name'],
            bio: userData['bio'],
            profileImageUrl: userData['profileImageUrl'].toString(),
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(updatedProfile.uuid)
          .update({
            'bio': updatedProfile.bio,
            'profileImageUrl': updatedProfile.profileImageUrl,
          });
    } catch (e) {
      throw Exception(e);
    }
  }
}
