import 'package:akukom/cores/components/components.dart';
import 'package:akukom/cores/utils/sizer_utils.dart';
import 'package:akukom/opening_account_screen.dart';
import 'package:flutter/material.dart';

import 'cores/constants/__constants.dart';
import 'cores/navigator/navigator.dart';

class OpeningScreen extends StatefulWidget {
  static const String routeName = '/opening-screen';
  const OpeningScreen({super.key});

  @override
  State<OpeningScreen> createState() => _OpeningScreenState();
}

class _OpeningScreenState extends State<OpeningScreen> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < 3; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      height: 8.0,
      width: isActive ? 8.0 : 8.0,
      decoration: BoxDecoration(
        color: isActive ? kcPrimaryColor : Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NormalScaffoldWidget(
      useSingleScroll: false,
      useSafeArea: false,
      usePadding: false,
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: <Widget>[
              _buildContentWidget('assets/image1.jpg'),
              _buildContentWidget('assets/image2.jpg'),
              _buildContentWidget('assets/image3.jpg'),
            ],
          ),
          Positioned(
            bottom: sp(80.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                width: sp(342),
                height: sp(80),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        horizontalSpace(33),
                        ..._buildPageIndicator(),
                        SizedBox(
                          width: sp(250),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Visibility(
                                visible: !(_currentPage == 0),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.arrow_back,
                                    size: sp(50),
                                    color: kcWhite,
                                  ),
                                  onPressed: () {
                                    _pageController.previousPage(
                                      duration:
                                          const Duration(milliseconds: 400),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                ),
                              ),
                              Visibility(
                                visible: !(_currentPage == 2),
                                child: Container(
                                  height: sp(50),
                                  width: sp(50),
                                  decoration: const BoxDecoration(
                                    color:
                                        kcWhite, // Background color of the circle
                                    shape: BoxShape
                                        .circle, // Makes the container circular
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward, // Icon data
                                      size: sp(35), // Icon size
                                      color: kcTextColor, // Icon color
                                    ),
                                    onPressed: () {
                                      _pageController.nextPage(
                                        duration:
                                            const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: _currentPage == 2,
                                child: SizedBox(
                                  height: sp(40),
                                  width: sp(104),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      AppRouter.instance.navigateToAndReplace(
                                        OpeningAccountScreen.routeName,
                                      );
                                    },
                                    child: TextWidget(
                                      AppStrings.getStarted,
                                      fontSize: sp(kfsVeryTiny),
                                      textColor: kcTextColor,
                                      fontWeight: FontWeight.w600,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContentWidget(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, kcBlack],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TwoSpanTextWidget(
                AppStrings.comeAlongWith,
                AppStrings.us,
                fontSize: sp(kfsLarge),
                fontSize2: sp(kfsLarge),
                textColor: kcWhite,
                textColor2: kcWhite,
                fontWeight: FontWeight.w500,
                fontWeight2: FontWeight.w800,
                textAlign: TextAlign.center,
              ),
              verticalSpace(16),
              TextWidget(
                AppStrings.bookARide,
                fontSize: sp(kfsLarge),
                textColor: kcWhite,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.left,
              ),
              verticalSpace(150),
            ],
          ),
        ),
      ),
    );
  }
}
