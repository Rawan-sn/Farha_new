import 'package:flutter/cupertino.dart';

import 'AppColors.dart';

class HelperWidgets {
  mainButton({@required BuildContext context,
    @required String title,
    @required Function onPress,
    Color color = AppColors.purple1,
    double padding = 16.0,
    BoxBorder border,
    String image = '',
    TextStyle textStyle = const TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    double width = -1,
    Color textColors = AppColors.white})
  {
    if (width == -1) {
      width = MediaQuery.of(context).size.width * 0.85;
    }
    return GestureDetector(
      onTap: onPress,
      child: Container(
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            border: border,
            color: color,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Visibility(
                  visible: image?.isNotEmpty ?? false,
                  child: Image.asset(
                    '$image',
                    height: 22.0,
                    width: 22.0,
                  )),
              Padding(
                padding: EdgeInsets.all(padding),
                child:
                Text(title, textAlign: TextAlign.center, style: textStyle),
              ),
            ],
          )),
    );
  }
}
final helper = HelperWidgets();
