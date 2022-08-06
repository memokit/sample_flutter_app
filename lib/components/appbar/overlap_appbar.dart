part of '../layout.dart';

class OverlapAppbar extends GetView {
  final Widget? title;
  final Widget? leading;
  final String? routeLeading;
  final Widget? actions;
  final double height;
  final Widget? child;
  final Widget? overlapChild;
  final double overlapTop;
  final bool enableLeading;

  OverlapAppbar({
    this.title,
    this.leading,
    this.routeLeading,
    this.actions,
    this.height = 120,
    this.child,
    this.overlapChild,
    this.overlapTop = 0,
    this.enableLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      delegate: CustomOverlapAppbar(
        title: title,
        leading: leading,
        routeLeading: routeLeading,
        actions: actions,
        enableLeading: enableLeading,
        expandedHeight: height,
        child: DefaultTextStyle(style: const TextStyle(color: Colors.white), child: child ?? const SizedBox()),
        overlapChild: overlapChild,
        overlapTop: overlapTop,
      ),
      pinned: true,
    );
  }
}

class CustomOverlapAppbar extends SliverPersistentHeaderDelegate {
  final Widget? title;
  final Widget? leading;
  final String? routeLeading;
  final Widget? actions;
  final Widget? child;
  final Widget? overlapChild;
  final double overlapTop;
  final double expandedHeight;
  final bool enableLeading;

  CustomOverlapAppbar({
    this.title,
    this.leading,
    this.routeLeading,
    this.actions,
    this.expandedHeight = 120,
    this.child,
    this.overlapChild,
    this.overlapTop = 0,
    this.enableLeading = true,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          ImageAssets.headerBackground,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              enableLeading
                  ? leading ??
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                color: Palette.white,
                              ),
                              onPressed: () {
                                routeLeading != null ? Get.toNamed(routeLeading!) : Get.back();
                              },
                              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                            ),
                          );
                        },
                      )
                  : const SizedBox(),
              Expanded(
                child: Center(
                  child: Opacity(
                    opacity: shrinkOffset / expandedHeight,
                    child: title ?? const SizedBox(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: actions ?? const SizedBox(),
              ),
            ],
          ),
        ),
        Opacity(
          opacity: 1 - (shrinkOffset / expandedHeight),
          child: (1 - (shrinkOffset / expandedHeight) < 0.9) ? const SizedBox() : child ?? const SizedBox(),
        ),
        Positioned(
          top: (expandedHeight - shrinkOffset - 25) - overlapTop,
          child: Opacity(
            opacity: 1 - (shrinkOffset / expandedHeight),
            child: overlapChild,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
