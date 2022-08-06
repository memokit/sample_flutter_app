part of '../layout.dart';

class CustomAppbar extends GetView {
  final Widget? title;
  final Widget? leading;
  final String? routeLeading;
  final Widget? actions;
  final double height;
  final Widget? child;
  final bool enableLeading;

  StreamController<void> onBuildController = StreamController<void>.broadcast();

  CustomAppbar({
    this.title,
    this.leading,
    this.routeLeading,
    this.actions,
    this.height = 120,
    this.child,
    this.enableLeading = true,
  });

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return ExtendedSliverAppbar(
      onBuild: (
        BuildContext context,
        double shrinkOffset,
        double? minExtent,
        double maxExtent,
        bool overlapsContent,
      ) {
        if (shrinkOffset > 0) {
          onBuildController.sink.add(null);
        }
        overlapsContent = false;
      },
      title: title ?? const SizedBox(),
      toolBarColor: Palette.primary,
      leading: enableLeading
          ? leading ??
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Palette.white,
                    ),
                    onPressed: () {
                      routeLeading != null ? Get.toNamed(routeLeading!) : Get.back();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              )
          : const SizedBox(),
      background: DefaultTextStyle(
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        child: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Image.asset(
                ImageAssets.headerBackground,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: kToolbarHeight, //+ statusBarHeight,
                bottom: 20,
              ),
              child: SizedBox(
                height: height,
                width: double.infinity,
                child: child,
              ),
            ),
            Positioned(
              bottom: -1,
              left: 0,
              right: 0,
              child: Container(
                height: 30,
                decoration: const BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: Padding(
        padding: const EdgeInsets.all(10.0),
        child: actions ?? const SizedBox(),
      ),
    );
  }
}
