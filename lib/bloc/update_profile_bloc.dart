import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/create_model/update_profile_model.dart';
import 'package:farha_app/provider/update_profile_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class UpdateProfileBloc {
  UpdateProfileModel model = new UpdateProfileModel();

  bool _checkIsValid(BuildContext context) {
    if ((model.firstName ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_first_name"));
      return false;
    }
    if((model.lastName ?? "").isEmpty){
      Fluttertoast.showToast(
          msg:AppLocalizations.of(context).trans("please_add_last_name") );
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
    if ((model.gender ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_gender"));
      return false;
    }
    return true;
  }

  updateProfile(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiUpdateProfile(context).getUpdateProfile(model.toMap()).then((res) {
          progressDialog.hide();
          if (res != null) {
            Fluttertoast.showToast(
                msg: AppLocalizations.of(context).trans("success"));
          }
        });
      });
    }
  }

}
