import 'dart:convert';

import 'package:farha_app/models/auth_user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataStore {
  static final DataStore _dataStore = new DataStore._internal();
  Locale locale;

  factory DataStore() {
    return _dataStore;
  }

  String lang;
  String localLang = 'en';
  String baseUrl = "farha.api.svuir.finjanhost.net";
  AuthUserModel authUser;

  DataStore._internal();

  Future<bool> setLang(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = value;
    return prefs.setString('Lang', value);
  }

  Future<void> getLang() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    lang = prefs.getString('Lang') ?? 'en';
  }

  Future<bool> setAuthUser(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString('user', value);
  }

  Future<AuthUserModel> getAuthUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString("user") == null) {
      this.authUser = null;
      return this.authUser;
    } else {
      var userJson = json.decode(prefs.getString("user"));
      this.authUser = AuthUserModel.fromMap(userJson);
      return this.authUser;
    }
  }
}

final dataStore = DataStore();
