import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:progress_dialog/progress_dialog.dart';


class GeneralWidget {


  static progressDialog(context) {
    ProgressDialog progressDialog =
        ProgressDialog(context, isDismissible: false,);
    progressDialog.style(
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      progressWidget: listProgressIndicator(),
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      // progressTextStyle: TextStyle(
      //     color: AppColors.Russet, fontSize: 13.0, fontWeight: FontWeight.w400),
      //
    );
    return progressDialog;
  }

  static listProgressIndicator() {
    return Center(
      child: LoadingBouncingGrid.circle(
        borderColor: Colors.purple,
        borderSize: 3.0,
        size: 30.0,
        backgroundColor: Colors.purpleAccent,
        duration: Duration(milliseconds: 500),
      )
    );
  }
}
