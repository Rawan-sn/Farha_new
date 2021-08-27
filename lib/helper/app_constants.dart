import 'package:intl/intl.dart';
import 'data_store.dart';

class AppConstants {
  static var ads = [
    "assets/images/ad.jpg",
    "assets/images/ad1.jpg",
    "assets/images/ad2.jpg",
  ];
  static List<String> allService = [
    "hall",
    "food",
    "beautySalons",
  ];
  static DateFormat dateFormat1 = DateFormat("dd-MM-yyyy");
  DateFormat dateFormat2 = DateFormat("MMM d, yyyy", dataStore.lang);
  DateFormat dateFormat3 = DateFormat("EEE dd-MM-yyyy", dataStore.lang);
  // AppConstants
//                                       .dateFormat1
//                                       .format(widget.data.serviceDetails.startTime)
}
