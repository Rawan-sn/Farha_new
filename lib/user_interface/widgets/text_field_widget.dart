import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    Key key,
    @required this.name,
     this.onChange
  }) : super(key: key);

  final String name;

  
  final Function onChange;
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Color(0x99492D72),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: onChange,
        decoration: InputDecoration(
            hintText: AppLocalizations.of(context).trans(name),
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: AppColors.black,
              fontWeight: FontWeight.bold,
            ),
            fillColor: Colors.white10,
            filled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none)),
      ),
    );
  }
}
