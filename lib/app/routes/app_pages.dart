import 'package:get/get.dart';
import 'package:sample_app/app/controllers/authen/authen_binding.dart';
import 'package:sample_app/app/controllers/restaurant_detail/restaurant_detail_binding.dart';
import 'package:sample_app/app/controllers/search_restaurant/search_restaurant_binding.dart';
import 'package:sample_app/app/views/authen/authen_view.dart';
import 'package:sample_app/app/views/home/home_view.dart';
import 'package:sample_app/app/views/restaurant/restaurant_detail_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.AUTHEN;

  static final routes = [
    GetPage(
      name: _Paths.AUTHEN,
      page: () => AuthenView(),
      binding: AuthenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: SearchRestaurantBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_DETAIL,
      page: () => RestaurantDetailView(),
      binding: RestaurantDetailBinding(),
    ),
  ];
}
