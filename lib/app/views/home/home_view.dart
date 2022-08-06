import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:get/get.dart';
import 'package:sample_app/app/controllers/search_restaurant/search_restaurant_controller.dart';
import 'package:sample_app/app/routes/app_pages.dart';
import 'package:sample_app/app/widgets/loading.dart';
import 'package:sample_app/app/widgets/not_found.dart';
import 'package:sample_app/components/layout.dart';
import 'package:sample_app/constants/palette.dart';

class HomeView extends GetView<SearchRestaurantController> {
  TextEditingController searchInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Layout(
      appBar: CustomAppbar(
        enableLeading: false,
        child: const Center(
          child: Text(
            "Restaurant App",
            style: TextStyle(
              color: Palette.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      children: [
        ContainerBox(
          child: Container(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            color: Palette.white,
            child: TextFormField(
              controller: searchInput,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
                hintText: "ค้นหาร้านอาหาร",
                suffixIcon: const Icon(Icons.search),
              ),
              onTap: () => searchInput.text = "",
              onFieldSubmitted: (String text) {
                controller.onSearch(text);
              },
            ),
          ),
        ),
        Obx(
          () => controller.isFirstSearch.value
              ? ContainerBox(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    height: 300,
                    color: Palette.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.restaurant_menu,
                          size: 50,
                          color: Palette.greyShade500,
                        ),
                        Text(
                          "ค้นหาร้านอาหารที่ช่องค้นหา",
                          style: TextStyle(
                            color: Palette.greyShade500,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : ContainerBox(
                  child: controller.obx(
                    (state) => Container(
                      padding: const EdgeInsets.all(10),
                      color: Palette.white,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state!.length,
                        itemBuilder: (context, i) {
                          return InkWell(
                            onTap: (() => Get.toNamed(
                                  Routes.RESTAURANT_DETAIL,
                                  arguments: {
                                    "placeId": state[i].placeId,
                                  },
                                )),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 8,
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 50,
                                      child: Image.network(state[i].icon!),
                                    ),
                                    const SizedBox(width: 5),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: Get.width - 105,
                                          child: AutoSizeText(
                                            state[i].name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
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
                                            state[i].vicinity!,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Palette.greyShade500,
                                            ),
                                          ),
                                        ),
                                        RatingStars(
                                          value: state[i].rating!,
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
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    onLoading: const Loading(),
                    onEmpty: Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: const NotFound(),
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
