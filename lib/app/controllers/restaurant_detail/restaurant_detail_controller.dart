import 'package:get/get.dart';
import 'package:google_place/google_place.dart';
import 'package:sample_app/constants/app_data.dart';

class RestaurantDetailController extends GetxController with StateMixin<DetailsResult> {
  dynamic params = Get.arguments;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    getData();
  }

  @override
  void onClose() {}

  Future<void> getData() async {
    String placeId = params["placeId"];
    print(placeId);
    var googlePlace = GooglePlace(AppData.googleApiKey);

    DetailsResponse? result = await googlePlace.details.get(
      placeId,
      // fields: "name,rating,formatted_phone_number,reviews",
      language: "th",
    );

    change(result!.result, status: RxStatus.success());

    //   if (text != null && text != "") {
    //     await EasyLoading.show();
    //     NearBySearchResponse? result = await googlePlace.search.getNearBySearch(
    //       Location(lat: 13.736717, lng: 100.523186),
    //       250000,
    //       type: "restaurant",
    //       keyword: text,
    //       name: text,
    //       language: "th",
    //     );
    //     if (result != null && result.results != null && result.results!.length > 0) {
    //       change(result.results, status: RxStatus.success());
    //     } else {
    //       change([], status: RxStatus.empty());
    //     }
    //     await EasyLoading.dismiss();
    //   }
  }
}
