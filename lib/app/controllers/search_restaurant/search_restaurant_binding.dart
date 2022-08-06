import 'package:get/get.dart';

import 'search_restaurant_controller.dart';

class SearchRestaurantBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchRestaurantController>(
      () => SearchRestaurantController(),
    );
  }
}
