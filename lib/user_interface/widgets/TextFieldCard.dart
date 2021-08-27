import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:flutter/material.dart';


class TextFieldCard extends StatefulWidget {
  String labelText;
  String hintText;
  String colorphoto;
  Function change ;
  TextEditingController controller;

  TextFieldCard(
      {@required this.change,
        @required this.controller,
        this.labelText,
        this.hintText,
        this.colorphoto ,
       });

  @override
  _TextFieldCardState createState() => _TextFieldCardState();
}

class _TextFieldCardState extends State<TextFieldCard> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      shadowColor: Color(0x99492D72),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        onChanged: widget.change,
        controller: widget.controller,
        decoration: InputDecoration(
            suffixIcon: new Image.asset(
              widget.colorphoto,
              height: 35,
              width: 35,
              color: Colors.purple,
            ),
            labelText: AppLocalizations.of(context).trans(widget.labelText),
            labelStyle: TextStyle(
              color: Color(0x99492D72),
              fontWeight: FontWeight.bold,
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
//            hintText: hintText?? "gg" ,
            hintText: '${widget.hintText}'==null?"gg":'${widget.hintText}',
            hintStyle: TextStyle(
              letterSpacing: 2,
              color: AppColors.black,
              //fontWeight: FontWeight.bold,
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
