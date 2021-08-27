import 'package:farha_app/helper/data_store.dart';

class ApiConstants {
  static String apiSuffix="/api/";
  static String cartSuffix="cart/";
  static String authority = dataStore.baseUrl;
  static String login= apiSuffix+"login";
  static String register=apiSuffix+"register";
  static String getProfile=apiSuffix+"user";
  static String uploadImage=apiSuffix+"upload";
  static String getService=apiSuffix+"service";
  static String getUpdateProfile=apiSuffix+"user";
  static String createBeautyCenter=apiSuffix+"beauty-center";
  static String createHall=apiSuffix+"halls";
  static String createFoodShop=apiSuffix+"food-shops";
  static String checkOutCart=apiSuffix+cartSuffix+"checkout";
  static String addToCart=apiSuffix+"cart";
  static String myCart=apiSuffix+"cart";

  static String deleteFromCart= apiSuffix+cartSuffix+"/";


}
