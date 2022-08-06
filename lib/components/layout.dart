import 'dart:async';

import 'package:extended_sliver/extended_sliver.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_app/constants/image_assets.dart';
import 'package:sample_app/constants/palette.dart';

part './appbar/appbar.dart';
part './appbar/custom_appbar.dart';
part './appbar/overlap_appbar.dart';

enum HeaderEnum { CUSTOM, OVERLAP, IMAGE_SLIDE, DEFAULT }

class Layout extends GetView {
  final appBar;
  final List<Widget> children;
  final Widget? bottomNavigationBar;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? floatingActionButton;
  final Widget? bottomSheet;
  final RefreshCallback? onRefresh;

  GlobalKey _refresherKey = GlobalKey();
  StreamController<bool> followButtonController = StreamController<bool>();
  int listlength = 100;
  double maxDragOffset = 100;

  Layout({
    Key? key,
    this.appBar,
    required this.children,
    this.bottomNavigationBar,
    this.floatingActionButtonLocation,
    this.floatingActionButton,
    this.bottomSheet,
    this.onRefresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (appBar != null) children.insert(0, appBar);

    return Scaffold(
      backgroundColor: Palette.backgroundColor,
      floatingActionButton: floatingActionButton,
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButtonLocation: floatingActionButtonLocation,
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: children,
        ),
      ),
    );
  }
}

class ContainerBox extends GetView {
  final Widget child;

  const ContainerBox({required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: child,
    );
  }
}

class ListBox extends GetView {
  final Widget? Function(BuildContext, int) builder;
  final int childCount;

  const ListBox(this.builder, {required this.childCount});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        builder,
        childCount: childCount,
      ),
    );
  }
}
