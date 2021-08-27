import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/provider/check_out_cart_api.dart';
import 'package:farha_app/user_interface/widgets/general_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class CheckOutFromCartBloc {
  createBranch(BuildContext context, String notes) {
    Map<dynamic, dynamic> body = {"notes": notes};
    ProgressDialog progressDialog = GeneralWidget.progressDialog(context);
    progressDialog.show().then((value) {
      ApiCheckOutCart(context).checkOut(body).then((value) {
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
