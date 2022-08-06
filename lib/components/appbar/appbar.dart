part of '../layout.dart';

class Appbar extends GetView {
  final Widget? title;
  final Widget? leading;
  final String? routeLeading;
  final List<Widget>? actions;
  final bool centerTitle;
  final bool enableLeading;

  Appbar({
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = false,
    this.enableLeading = true,
    this.routeLeading,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      // expandedHeight: 250.0,
      pinned: true,
      floating: true,
      backgroundColor: Palette.primary,
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
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        title: DefaultTextStyle(
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            child: title ?? const SizedBox()),
        titlePadding: EdgeInsets.only(left: centerTitle ? 0 : 50, bottom: 12),
        centerTitle: centerTitle,
      ),
    );
  }
}
