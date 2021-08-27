import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/provider/delete_from_cart_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class DeleteFromCartBloc {
  String cart;

  bool _checkIsValid(BuildContext context) {
    if ((cart ?? "").isEmpty) {
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans("please_add_name"));
      return false;
    }
    return true;
  }

  createBranch(BuildContext context, String notes) {
    if (_checkIsValid(context)) {
      ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
      progressDialog.show().then((value) {
        ApiDeleteFromCart(context).deleteFromCart(cart).then((value) {
          progressDialog.hide();
          if (value != null) {
            Fluttertoast.showToast(
                msg: AppLocalizations.of(context).trans("success"));
            Navigator.pop(context, true);
          }
        });
      });
    }
  }
}
