part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const AUTHEN = _Paths.AUTHEN;
  static const RESTAURANT_DETAIL = _Paths.RESTAURANT_DETAIL;
}

abstract class _Paths {
  _Paths._();
  static const AUTHEN = '/authen';
  static const HOME = '/home';
  static const RESTAURANT_DETAIL = '/restaurant_detail';
}
