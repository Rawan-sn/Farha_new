import 'dart:ui';
import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/general_func.dart';
import 'package:farha_app/models/hall_venues_model.dart';
import 'package:farha_app/models/list_service_beauty_center_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartDialogBox extends StatefulWidget {
  const CartDialogBox(this.details);
  final List<Details> details;
  @override
  _CartDialogBoxState createState() => _CartDialogBoxState();
}

class _CartDialogBoxState extends State<CartDialogBox> {
  TextEditingController controllerLatinName;
  TextEditingController controllerLocalName;
  bool checkedValue = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false,
      pilgrimage = false,
      speech = false,
      Graduation = false,
      Birth = false,
      marriage = false;
  DateTime startDate;
  TimeOfDay fromTime;

  VenusModel model = new VenusModel();

  @override
  void initState() {
    super.initState();
    controllerLatinName = TextEditingController();
    controllerLocalName = TextEditingController();
    model.forMen = false;
    model.forWomen = false;
    model.forMex=false;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
          side: BorderSide(color: AppColors.purple)),
      elevation: 0,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 10, left: 10, bottom: 8),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    AppLocalizations.of(context).trans("add_to_cart"),
                    style: TextStyle(
                        color: AppColors.purple,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: AppColors.purple,
                  thickness: 2,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: kElevationToShadow[1],
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            AppLocalizations.of(context).trans("note"),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      TextFormField(
                        controller: controllerLocalName,
                        cursorColor: Colors.black,
                        //onChanged: (text) {model.=text;},
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:
                            AppLocalizations.of(context).trans("note"),
                            hintStyle: TextStyle(fontSize: 15)),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: kElevationToShadow[1],
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                    child: Column(
                      children: [
                        Align(
                            alignment:Alignment.topLeft,
                            child: Text(
                                AppLocalizations.of(context).trans("booking_date"),
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: controllerLatinName,
                          cursorColor: Colors.black,
                          onChanged: (text) {model.capacity=int.parse(text);},
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: AppLocalizations.of(context)
                                  .trans("capacity"),
                              hintStyle: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: kElevationToShadow[1],
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).trans("from_date"),
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2010),
                                    lastDate: DateTime(2100))
                                .then((date) {
                              if (date != null) {
                                setState(() {});
                              }
                            });
                          },
                          child: Card(
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    startDate == null
                                        ? AppLocalizations.of(context)
                                            .trans("not_set")
                                        : GeneralFanc.dateformatedFromDate(
                                            startDate),
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(height: 25, thickness: 2),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: kElevationToShadow[1],
                    color: Colors.white,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        AppLocalizations.of(context).trans("from_time"),
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay(hour: 1, minute: 0),
                            ).then((time) {
                              setState(() {
                                fromTime = time;
                              });
                            });
                          },
                          child: Card(
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    (fromTime == null)
                                        ? AppLocalizations.of(context)
                                            .trans("not_set")
                                        : fromTime.format(context),
                                    style: TextStyle(color: Colors.grey[700]),
                                  ),
                                  Icon(Icons.keyboard_arrow_down)
                                ],
                              ),
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.details.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 5),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                width: Checkbox.width,
                                height: Checkbox.width,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black38,
                                    ),
                                    borderRadius: new BorderRadius.circular(5),
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor: Colors.transparent,
                                    ),
                                    child: Checkbox(
                                      value: checkedValue2,
                                      onChanged: (state) {

                                        setState(() {
                                          checkedValue2 = !checkedValue2;
                                          model.forMex=checkedValue2;
                                        });},
                                      activeColor: Colors.white,
                                      checkColor: Color(0xe6d2578b),
                                      materialTapTargetSize:
                                      MaterialTapTargetSize.padded,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Text(
                                widget.details[index].name,
                                style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.purple,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),


                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pop(model);
                    },
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(top: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1.5),
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [AppColors.purple, AppColors.purple]),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          AppLocalizations.of(context).trans("ok"),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: TextSizes.smallText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
