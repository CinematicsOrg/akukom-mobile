import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NormalScaffoldWidget extends StatelessWidget {
  const NormalScaffoldWidget({
    Key? key,
    required this.body,
    this.appBar,
    this.usePadding = true,
    this.useSingleScroll = true,
    this.bg,
    this.scaffoldKey,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.scrollController,
    this.useSafeArea = true, // Add this line
  }) : super(key: key);

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final AppBar? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? scrollController;
  final bool useSafeArea; // Add this line

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: Colors.black,
      ),
    );

    final EdgeInsets edgeInsets =
        EdgeInsets.symmetric(horizontal: usePadding ? 20 : 0);

    Widget content = SizedBox(
      height: double.infinity,
      child: useSingleScroll
          ? SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              controller: scrollController,
              child: Padding(padding: edgeInsets, child: body),
            )
          : Padding(padding: edgeInsets, child: body),
    );

    // Wrap the content with SafeArea if useSafeArea is true
    if (useSafeArea) {
      content = SafeArea(child: content);
    }

    return Scaffold(
      key: scaffoldKey,
      appBar: appBar,
      backgroundColor: bg ?? Theme.of(context).scaffoldBackgroundColor,
      body: content,
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
    );
  }
}
