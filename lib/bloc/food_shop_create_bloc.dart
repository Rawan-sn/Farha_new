import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/create_model/beauty_center_create_model.dart';
import 'package:farha_app/models/create_model/food_shop_create_model.dart';
import 'package:farha_app/provider/create_beauty_api.dart';
import 'package:farha_app/provider/create_foodShop_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CreateFoodShopBloc {
  CreateFoodShopModel model = new CreateFoodShopModel();

  bool _checkIsValid(BuildContext context) {
    if ((model.name ?? "").isEmpty ) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_name"));
      return false;
    }
    if ((model.address ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_address"));
      return false;
    }
    if ((model.phone ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_phone"));
      return false;
    }
    if ((model.type ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_type"));
      return false;
    }
    if ((model.startTime ?? "").isEmpty ||(model.endTime ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_time"));
      return false;
    }
    if ((model.description ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_description"));
      return false;
    }
    return true;
  }

  create(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiCreateFoodShop(context).create(model.toMap()).then((res) {
          progressDialog.hide();
          if (res != null) {
            Fluttertoast.showToast(msg: "success");
            Navigator.pop(context);
          }
        });
      });
    }
  }

}
