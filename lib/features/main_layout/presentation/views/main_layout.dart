import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/features/family_group/presentation/_presentaion.dart';
import 'package:akukom/features/main_layout/__main_layout.dart';
import 'package:akukom/features/profile/__profile.dart';
import 'package:akukom/features/story/__story.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainLayout extends StatefulWidget {
  static const String routeName = '/main_layout';

  const MainLayout({
    Key? key,
  }) : super(key: key);

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  @override
  void initState() {
    final BottomNavCubit bottomNavCubit = getIt<BottomNavCubit>();
    bottomNavCubit.reset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavCubit bottomNavCubit = getIt<BottomNavCubit>();

    return Scaffold(
      extendBody: true,
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        bloc: bottomNavCubit,
        builder: (context, state) {
          final index = state.index;
          return buildBody(index);
        },
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }

  Widget buildBody(int index) {
    String labelText;
    switch (index) {
      case 0:
        return const HomeView();
      case 1:
        labelText = 'Index 1 Content';
        break;
      case 2:
        // return const FamilyGroupScreen();
        return const FamilyView();
      case 3:
        return const ProfileView();
      default:
        labelText = 'Default Content';
    }

    return Container(
      alignment: Alignment.center,
      child: Text(labelText, style: const TextStyle(fontSize: 20)),
    );
  }
}
