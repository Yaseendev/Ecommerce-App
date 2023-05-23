import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_ecommerce/Account/data/models/user.dart';

class Urls {
  static const String DOMAIN =
      'http://192.168.1.26:8080'; //ipconfig getsummary en0 | grep 192.168.1.
  static const String LOCATION_DOMAIN = 'https://eu1.locationiq.com';
  static const String BASE_API = DOMAIN + '/api/v1';
  static const String LOCATION_BASE_API = LOCATION_DOMAIN + '/v1';
  static const String AUTH_PATH = '/auth';
  static const String PRODUCT_PATH = '/products';
  static const String GET_CATEGORIES = '/categories';
  static const String SEARCH = '$PRODUCT_PATH/search';
  static const String SEARCH_FILTERED = '$PRODUCT_PATH/search-filtered';
  static const String DEAL_OF_DAY = '$PRODUCT_PATH/deal-of-day';
  static const String MOST_POPULAR = '$PRODUCT_PATH/most-popular';
  static const String TOP_RATED = '$PRODUCT_PATH/most-rated';
  static const String NEWLY_ADDED = '$PRODUCT_PATH/newly-added';
  static const String PRODUCTS_ADS = '$PRODUCT_PATH/ads';
  static const String SIGNUP_API = '$AUTH_PATH/register';
  static const String SIGNIN_API = '$AUTH_PATH/signin';
  static const String TOKEN_CHECK_API = '$AUTH_PATH/token-check';
}

const String locationKey = 'pk.0b821f869258d4129c196400ab4927f0';

class Boxes {
  static Future<Box<User>> getUserBox() async {
    if (Hive.isBoxOpen('userBox'))
      return Hive.box<User>('userBox');
    else
      return await Hive.openBox<User>('userBox');
  }

  static Future<Box<String>> getSearchBox() async {
    if (Hive.isBoxOpen('searchHistory'))
      return Hive.box<String>('searchHistory');
    else
      return await Hive.openBox<String>('searchHistory');
  }

  //   static Future<Box<CartItem>> getCartBox() async {
  //   if (Hive.isBoxOpen('cart'))
  //     return Hive.box<CartItem>('cart');
  //   else
  //     return await Hive.openBox<CartItem>('cart');
  // }
}

enum PaymentMethod { cash, creditCard }

enum ViewType { grid, List }

class Images {
  static const String ROOT = 'assets/images';
  static const String DEFAULT_PROFILE = '$ROOT/default_profile.png';
  static const String LOGO = '$ROOT/logo.png';
  static const String LOGO_TRANSPARENT = '$ROOT/logo_transparent.png';
  static const String PLACEHOLDER = '$ROOT/placeholder.jpg';
  static const String NOT_LOGGEDIN = '$ROOT/no_login.jpeg';
  static const String NO_INTERNET = '$ROOT/no-wifi.png';
  static const String WISHLIST = '$ROOT/wishlist.png';
  static const String NO_LOGIN = '$ROOT/login-svg.svg';
}

class AppColors {
  static const Color PRIMARY_COLOR = Color(0xFF374151);
  static const Color BACKGROUND_COLOR = Color(0xFFF7F8F9); //Color(0xFFDEDEDE);
  static const Color SECONDARY_COLOR = Color(0xFFDEDEDE);
  // ignore: non_constant_identifier_names
  static final MaterialColor PRIMARY_SWATCH =
      MaterialColor(AppColors.PRIMARY_COLOR.value, <int, Color>{
    50: PRIMARY_COLOR,
    100: PRIMARY_COLOR,
    200: PRIMARY_COLOR,
    300: PRIMARY_COLOR,
    400: PRIMARY_COLOR,
    500: PRIMARY_COLOR,
    600: PRIMARY_COLOR,
    700: PRIMARY_COLOR,
    800: PRIMARY_COLOR,
    900: PRIMARY_COLOR,
  });
}
