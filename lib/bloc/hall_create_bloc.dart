import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/create_model/hall_create_model.dart';
import 'package:farha_app/provider/create_hall_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CreateHallBloc {
  CreateHallModel model = new CreateHallModel();

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
    if(model.hallDetails.isEmpty)
      {
        Fluttertoast.showToast(
            msg: AppLocalizations.of(context).trans("please_add_hall_details"));
        return false;
      }
    if(model.venus.isEmpty)
    {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_venus"));
      return false;
    }

    return true;
  }

  create(context) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiCreateHall(context).create(model.toMap()).then((res) {
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
