import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:sample_app/constants/app_data.dart';

class SearchRestaurantController extends GetxController with StateMixin<List<SearchResult>> {
  RxBool isFirstSearch = true.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    change([], status: RxStatus.success());
  }

  @override
  void onClose() {}

  Future<void> onSearch(String text) async {
    isFirstSearch(false);
    var googlePlace = GooglePlace(AppData.googleApiKey);

    if (text != null && text != "") {
      await EasyLoading.show();
      NearBySearchResponse? result = await googlePlace.search.getNearBySearch(
        Location(lat: 13.736717, lng: 100.523186),
        250000,
        type: "restaurant",
        keyword: text,
        name: text,
        language: "th",
      );
      if (result != null && result.results != null && result.results!.length > 0) {
        change(result.results, status: RxStatus.success());
      } else {
        change([], status: RxStatus.empty());
      }
      await EasyLoading.dismiss();
    }
  }
}
