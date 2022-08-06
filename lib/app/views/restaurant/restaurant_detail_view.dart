import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:sample_app/app/controllers/restaurant_detail/restaurant_detail_controller.dart';
import 'package:sample_app/app/widgets/loading.dart';
import 'package:sample_app/app/widgets/not_found.dart';
import 'package:sample_app/components/layout.dart';
import 'package:sample_app/constants/palette.dart';

class RestaurantDetailView extends GetView<RestaurantDetailController> {
  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: Appbar(
        title: controller.obx(
          (state) => Text(
            state!.name!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          onLoading: const SizedBox(),
          onEmpty: const SizedBox(),
        ),
      ),
      children: [
        ContainerBox(
          child: controller.obx(
            (state) => Card(
              margin: EdgeInsets.zero,
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width,
                      child: AutoSizeText(
                        state!.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Palette.greyShade500,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: Get.width - 105,
                      child: Text(
                        state.vicinity!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Palette.greyShade500,
                        ),
                      ),
                    ),
                    RatingStars(
                      value: state.rating ?? 0,
                      onValueChanged: (v) {},
                      starBuilder: (index, color) => Icon(
                        Typicons.star_filled,
                        color: color,
                      ),
                      starCount: 5,
                      starSize: 20,
                      valueLabelColor: const Color(0xff9b9b9b),
                      valueLabelTextStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                        fontSize: 12,
                      ),
                      valueLabelRadius: 10,
                      maxValue: 5,
                      starSpacing: 2,
                      maxValueVisibility: true,
                      valueLabelVisibility: true,
                      animationDuration: const Duration(milliseconds: 1000),
                      valueLabelPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 8),
                      valueLabelMargin: const EdgeInsets.only(right: 8),
                      starOffColor: const Color(0xffe7e8ea),
                      starColor: Colors.yellow,
                    ),
                  ],
                ),
              ),
            ),
            onLoading: const Loading(),
            onEmpty: Container(
              margin: EdgeInsets.symmetric(vertical: 15),
              child: const NotFound(),
            ),
          ),
        ),
        ContainerBox(
          child: controller.obx(
            (state) => Container(
              padding: EdgeInsets.all(10),
              color: Palette.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.rate_review,
                        color: Palette.primary,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "รีวิว",
                        style: TextStyle(
                          color: Palette.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state!.reviews?.length ?? 0,
                    itemBuilder: (context, i) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 8,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width,
                                child: AutoSizeText(
                                  state.reviews![i].authorName!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Palette.greyShade500,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: Get.width,
                                child: Text(
                                  state.reviews![i].text!,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Palette.greyShade500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            onLoading: const SizedBox(),
            onEmpty: const SizedBox(),
          ),
        ),
      ],
    );
  }
}
