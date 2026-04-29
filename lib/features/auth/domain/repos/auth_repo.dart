import 'package:socmed_app_flutter/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailAndPassword(String email, String password);
  Future<AppUser?> registerWithEmailAndPassword(String name, String email, String password);
  Future<AppUser?> logout();
  Future<AppUser?> getCurrentUser();
}