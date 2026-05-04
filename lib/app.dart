import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socmed_app_flutter/features/auth/presentation/cubits/auth_states.dart';
import 'package:socmed_app_flutter/themes/light_mode.dart';
import 'package:socmed_app_flutter/features/auth/presentation/pages/auth_page.dart';
import 'package:socmed_app_flutter/features/auth/data/firebase_auth_repo.dart';
import 'package:socmed_app_flutter/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:socmed_app_flutter/features/post/presentation/pages/home_page.dart';

/* 

APP - Root Level

----------------

Repositories: for the database
  - firebase

Bloc Providers: for the state management
  - auth
  - profile
  - post
  - search
  - theme

Check Auth State
  - unauthenticated: show auth page (login or register)
  - authenticated: show home page

*/

class MyApp extends StatelessWidget {
  final authRepo = FirebaseAuthRepo();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    // provide cubit
    return BlocProvider(
      create: (context) => AuthCubit(authRepo: authRepo)..checkAuth(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightMode,
        home: BlocConsumer<AuthCubit, AuthState>(
          builder: (context, authState) {
            if (authState is Unauthenticated) {
              return const AuthPage();
            }
            if (authState is Authenticated) {
              return const HomePage();
            }

            else {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

          },
           listener: (context, state) {
            if (state is AuthError) {
              ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)),
              );
            }
           },
        ),
      ),
    );
  }
}
