import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/data_store.dart';
import 'package:farha_app/models/auth_user_model.dart';
import 'package:farha_app/models/user_model.dart';
import 'package:farha_app/provider/login_api.dart';
import 'package:farha_app/user_interface/pages/main_navigation_pages.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class LoginBloc {
  String password;
  String email;

  bool _checkIsValid(BuildContext context) {
    if ((email ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_email"));
      return false;
    }
    if ((password ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_password"));
      return false;
    }
    return true;
  }

  login(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiLogin(context).login(email, password).then((res) {
          progressDialog.hide();
          if (res != null) {
            dataStore.setAuthUser(AuthUserModel(
              token:res.token, user: UserModel.fromMap(res.data) )
                .toJson())
                .then((isSet){
              if(isSet){
            dataStore.getAuthUser().then((_) {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
            builder: (context) => MainNavigationPages(),
            ));
            });
              }
            });
          }
        });
      });
    }
  }
}
