import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/create_model/register_model.dart';
import 'package:farha_app/provider/register_api.dart';
import 'package:farha_app/user_interface/pages/main_navigation_pages.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class RegisterBloc {
  RegisterModel model = new RegisterModel();

  bool _checkIsValid(BuildContext context) {
    if ((model.firstName ?? "").isEmpty || (model.lastName ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_name"));
      return false;
    }
    if ((model.address ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_address"));
      return false;
    }
    if ((model.email ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_email"));
      return false;
    }
    if ((model.phone ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_phone"));
      return false;
    }
    if ((model.password ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_password"));
      return false;
    }
    if ((model.gender ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_gender"));
      return false;
    }
    return true;
  }

  register(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiRegister(context).register(model.toMap()).then((res) {
          progressDialog.hide();
          if (res != null) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => MainNavigationPages()));
          }
        });
      });
    }
  }

}
