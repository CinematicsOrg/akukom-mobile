import 'package:akukom/app/locator.dart';
import 'package:akukom/cores/components/__components.dart';
import 'package:akukom/cores/constants/__constants.dart';
import 'package:akukom/features/main_layout/__main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key});

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  final BottomNavCubit _bottomNavCubit = getIt<BottomNavCubit>();

  int _currentIndex = 0;

  Widget navBarItem(NavBarType item) {
    final isActive = AppConstants.navbarItems.indexOf(item) == _currentIndex;

    return GestureDetector(
      onTap: () {
        final index = AppConstants.navbarItems.indexOf(item);
        _onItemTapped(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          // color: isActive ? kcPrimaryColor : Colors.transparent,
        ),
        child: _IconButton(item: item, isActive: isActive),
      ),
    );
  }

  void _onItemTapped(
    int index,
  ) {
    _bottomNavCubit.updateIndex(index);
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 35.h,
      ),
      child: Container(
        height: 75.h,
        decoration: BoxDecoration(
          color: kcWhite,
          borderRadius: BorderRadius.circular(40),
          boxShadow: const [
            BoxShadow(
              color: kcGrey100,
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: AppConstants.navbarItems
              .map(
                (item) => navBarItem(
                  item,
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  const _IconButton({
    required this.item,
    required this.isActive,
  });

  final NavBarType item;
  final bool isActive;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Stack(
      children: [
        Transform.scale(
          scale: 0.95,
          child: Svg(
            path: isActive ? item.selectedImage : item.image,
            color: isActive ? kcPrimaryColor : kcGrey600,
            fit: BoxFit.scaleDown,
          ),
        ),
        Positioned(
          top: 2.h,
          right: 2.w,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 8.w,
            width: 8.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}
