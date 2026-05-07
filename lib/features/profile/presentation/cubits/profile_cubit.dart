import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socmed_app_flutter/features/profile/presentation/cubits/profile_states.dart';
import 'package:socmed_app_flutter/features/profile/domain/repos/profile_repo.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  // fetch user profile using repo
  Future<void> fetchUserProfile(String uuid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uuid);

      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError('User not found'));
      }
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({required String uuid, String? newBio}) async {
    try {
      emit(ProfileLoading());
      final currentUser = await profileRepo.fetchUserProfile(uuid);

      if (currentUser == null) {
        emit(ProfileError('User not found'));
        return;
      }

      // profile picture update

      // update new profile
      final updatedProfile = currentUser.copyWith(newBio: newBio ?? currentUser.bio);
      await profileRepo.updateProfile(updatedProfile);

      // re-fetch the updated profile
      await fetchUserProfile(uuid);
    } on Exception catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}