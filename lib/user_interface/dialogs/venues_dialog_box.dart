import 'dart:ui';
import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/models/hall_venues_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VenuesDialogBox extends StatefulWidget {
  const VenuesDialogBox();

  @override
  _VenuesDialogBoxState createState() => _VenuesDialogBoxState();
}

class _VenuesDialogBoxState extends State<VenuesDialogBox> {
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
 VenusModel model=new VenusModel();
  @override
  void initState() {
    super.initState();
    controllerLatinName = TextEditingController();
    controllerLocalName = TextEditingController();
    model.forMen=false;
    model.forWomen=false;
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
                    AppLocalizations.of(context).trans("add_venues"),
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
                            AppLocalizations.of(context).trans("name"),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      TextFormField(
                        controller: controllerLocalName,
                        cursorColor: Colors.black,
                        onChanged: (text) {model.name=text;},
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText:
                                AppLocalizations.of(context).trans("name"),
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
                                AppLocalizations.of(context).trans("capacity"),
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
                            alignment: Alignment.topLeft,
                            child: Text(
                                AppLocalizations.of(context).trans("price"),
                                style: TextStyle(fontWeight: FontWeight.bold))),
                        TextFormField(
                          controller: controllerLatinName,
                          cursorColor: Colors.black,
                          onChanged: (text) {},
                          decoration: new InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText:
                                  AppLocalizations.of(context).trans("price"),
                              hintStyle: TextStyle(fontSize: 15)),
                        )
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    value: checkedValue1,
                                    onChanged: (state) {

                                      setState(() {
                                        checkedValue1 = !checkedValue1;
                                        model.forMen=checkedValue1;
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "for_men",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    value: checkedValue,
                                    onChanged: (state) {

                                      setState(() {
                                        checkedValue = !checkedValue;
                                        model.forWomen=checkedValue;
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "for_women",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 80, vertical: 5),
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
                          "for_mex",
                          style: TextStyle(
                              fontSize: 16,
                              color: AppColors.purple,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("select_type_of_party"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
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
                                    value: marriage,
                                    onChanged: (state) {
                                        setState(() {
                                          marriage = !marriage;
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "marriage",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    value: Birth,
                                    onChanged: (state) =>
                                        setState(() => Birth = !Birth),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "Birth",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0,left: 22,top: 10),
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
                                    value: Graduation,
                                    onChanged: (state) => setState(
                                        () => Graduation = !Graduation),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "Graduation",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                                    value: speech,
                                    onChanged: (state) =>
                                        setState(() => speech = !speech),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "speech",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
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
                                    value: pilgrimage,
                                    onChanged: (state) => setState(
                                        () => pilgrimage = !pilgrimage),
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "pilgrimage",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColors.purple,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: InkWell(
                    onTap: () {
                      List <int>d=new List<int>();
                      if(marriage)d.add(1);
                      if(Graduation) d.add(3);
                      if(Birth) d.add(5);
                      if(speech) d.add(2);
                      if(pilgrimage) d.add(4);

                      model.partyTypeVenus=d;
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
                          AppLocalizations.of(context).trans("add"),
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
