import 'package:flutter/material.dart';
import 'package:socmed_app_flutter/features/home/presentation/components/my_drawer_tile.dart';
import 'package:socmed_app_flutter/features/profile/presentation/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socmed_app_flutter/features/auth/presentation/cubits/auth_cubit.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25.0),
                child: Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),

              Divider(color: Theme.of(context).colorScheme.primary),

              // home tile
              MyDrawerTile(
                title: 'H O M E',
                icon: Icons.home,
                onTap: () => Navigator.of(context).pop(),
              ),

              // profile tile
              MyDrawerTile(
                title: 'P R O F I L E',
                icon: Icons.person,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(
                    context, 
                    MaterialPageRoute(
                      builder: (context) => ProfilePage()
                    )
                  );
                },
              ),

              // search tile
              MyDrawerTile(
                title: 'S E A R C H',
                icon: Icons.search,
                onTap: () {},
              ),

              // setting tile
              MyDrawerTile(
                title: 'S E T T I N G S',
                icon: Icons.settings,
                onTap: () {},
              ),

              const Spacer(),

              // logout tile
              MyDrawerTile(
                title: 'L O G O U T',
                icon: Icons.logout,
                onTap: () => context.read<AuthCubit>().logout(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
