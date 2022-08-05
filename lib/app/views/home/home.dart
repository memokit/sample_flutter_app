import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_place/google_place.dart';

class HomeVieew extends StatefulWidget {
  const HomeVieew({Key? key}) : super(key: key);

  @override
  State<HomeVieew> createState() => _HomeVieewState();
}

class _HomeVieewState extends State<HomeVieew> {
  @override
  Widget build(BuildContext context) {
    var googlePlace = GooglePlace("Your-Key");
    // var result = googlePlace.search.getFindPlaceJson("", InputType.TextQuery, locationbias: Locationbias(circular: Circular()));
    // var result = googlePlace.search.getNearBySearchJson();
    return Text("");
  }
}
