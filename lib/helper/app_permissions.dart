import 'data_store.dart';

class AppPermissions {
  static bool isServiceProvider() {
    if (dataStore.authUser.user.type == "provider") return true;
    return false;
  }

  static bool isLogged() => dataStore.authUser != null;
}
