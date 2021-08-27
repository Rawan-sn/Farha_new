import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/models/list_service_beauty_center_model.dart';
import 'package:flutter/material.dart';

import 'cart_dialog_box.dart';
import 'venues_dialog_box.dart';


class ShowDialogs {
  static showAlert(
      BuildContext context, String title, String content, Function() pressed) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(15)),
          actions: <Widget>[
            TextButton(
              child: Text(
                AppLocalizations.of(context).trans('yes'),
                style: TextStyle(color: Colors.grey[900]),
              ),
              onPressed: () {
                pressed();
              },
            ),
            TextButton(
              child: Text(
                AppLocalizations.of(context).trans('no'),
                style: TextStyle(color: Colors.grey[900]),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static createVenusDialog(BuildContext context, ) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return VenuesDialogBox();
      },
    );
  }
  static createCartDialog(BuildContext context, List<Details> details, ) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return CartDialogBox(details);
      },
    );
  }


}
