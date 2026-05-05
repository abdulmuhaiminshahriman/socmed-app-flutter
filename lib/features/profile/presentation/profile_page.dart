import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socmed_app_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socmed_app_flutter/features/auth/domain/entities/app_user.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authCubit = context.read<AuthCubit>();

  late AppUser? currentUser = authCubit.getCurrentUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(currentUser?.email ?? 'Profile'),
      ),
    );
  }
}