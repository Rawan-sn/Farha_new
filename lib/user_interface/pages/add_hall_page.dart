import 'dart:io';

import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/beauty_center_create_bloc.dart';
import 'package:farha_app/bloc/hall_create_bloc.dart';
import 'package:farha_app/bloc/upload_image_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/app_constants.dart';
import 'package:farha_app/models/beauty_section_model.dart';
import 'package:farha_app/models/create_model/hall_create_model.dart';
import 'package:farha_app/models/hall_food_details.dart';
import 'package:farha_app/models/hall_venues_model.dart';
import 'package:farha_app/models/upload_image_model.dart';
import 'package:farha_app/user_interface/dialogs/show_dialogs.dart';
import 'package:farha_app/user_interface/pages/general/add_media_page.dart';
import 'package:farha_app/user_interface/widgets/text_field_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddHallPage extends StatefulWidget {
  @override
  _AddHallPageState createState() => _AddHallPageState();
}

class _AddHallPageState extends State<AddHallPage> {
  bool show = false;
  String type = AppConstants.allService[0];
  TimeOfDay fromTime;
  TimeOfDay toTime;
  String type1;
  List<HallFoodDetails> list = new List<HallFoodDetails>();
  List<VenusModel> venus = new List<VenusModel>();

  UploadImageBloc _uploadImageBloc = new UploadImageBloc();
  CreateHallBloc bloc = CreateHallBloc();
  //List files = [];
  var _image;
  File _image1;
  bool checkedValue = false;
  bool checkedValue1 = false;
  bool checkedValue2 = false;
  List<dynamic> files = [];
  List<String> filesName = [];

  // _pickImageFromGallery() async {
  //   File image = await ImagePicker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50);
  //   if (image != null) {
  //     _uploadImageBloc.file = image;
  //     _uploadImageBloc.uploadImage(context);
  //   }
  //   setState(() {
  //     _image = image;
  //     print(_image);
  //   });
  // }


//  _pickImageFromGalleryForLogo() async {
//    File image = await ImagePicker.pickImage(
//        source: ImageSource.gallery, imageQuality: 50);
//    if (image != null) {
//      _uploadImageBloc.file = image;
//      _uploadImageBloc.uploadImage(context);
//    }
//    setState(() {
//      _image1 = image;
//      print(_image1);
//    });
//  }

  _pickImageFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);
    if (image != null) {
      // _uploadImageBloc.file = image;
      // _uploadImageBloc.uploadImage(context);
      files.add(image);
    }
    setState(() {
      _image = image;
      print(_image);
    });
  }
  addService() async {
    for (var i = 0; i < files.length; i++) {
      var file = files[i];
      this._uploadImageBloc.file = file;
      var response = await _uploadImageBloc.uploadImage(context,"Hall");
      var res = UploadImageModel.fromMap(response.data);
      // Stream<UploadImageModel> stream =
      //     await _uploadImageBloc.uploadImageStream;
      // var res = await stream.listen((event) {});
      this.filesName.add(res.image);
      print("uploaded image " + i.toString() + " is " + res.image);
      // Stream<UploadImageModel> stream = _uploadImageBloc.uploadImageStream;
      // stream.listen((event) {
      //   this.filesName.add(event.image);
      // });
    }

    //TODO add service
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("add_hall"),
            style: TextStyle(
              fontSize: TextSizes.text,
            ),
          ),
          flexibleSpace: Container(
            color: AppColors.purple,
          ),
          elevation: 2,
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisSize:MainAxisSize.min,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.0),
                            width: MediaQuery.of(context).size.width / 5,
                            height: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              border:
                              Border.all(color: Colors.white, width: 5),
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:_image1==null?AssetImage('assets/images/logo.png')
                                :Image.network(_image1.path),

                              ),
                            ),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 50.0, top: 40),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.black54,
                              child: IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                onPressed: () {
                              //    _pickImageFromGalleryForLogo();
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(AppLocalizations.of(context).trans("logo"),
                          style: TextStyle(
                            letterSpacing: 2,
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(
                      name: "service_name",
                      onChange:(name){
                       bloc.model.name=name;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(name: "service_address",
                      onChange:(name){
                        bloc.model.address=name;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(name: "service_description",
                      onChange:(name){
                        bloc.model.description=name;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(name: "phone",
                      onChange:(name){
                        bloc.model.phone=name;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFieldWidget(name: "facebook",
                      onChange:(name){
                        bloc.model.facebook=name;
                      },
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 4,
                        shadowColor: Color(0x99492D72),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                                top: 15.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          fromTime != null
                                              ? fromTime.toString()
                                              : AppLocalizations.of(context)
                                              .trans("from_time"),
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Material(
                                            elevation: 4,
                                            shadowColor: Color(0x99492D72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),
                                              child:
                                              Icon(Icons.access_time),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 1, minute: 0),
                      ).then((time) {
                        setState(() {
                          fromTime = time;
                          bloc.model.startTime = fromTime.hour
                              .toString()
                              .padLeft(2, "0") +
                              ":" +
                              fromTime.minute
                                  .toString()
                                  .padLeft(2, "0");
                          if (toTime != null) {
                            if ((toTime.hour + toTime.minute / 60.0) <
                                (fromTime.hour + fromTime.minute / 60.0)) {
                              toTime = time;
                              bloc.model.endTime = toTime.hour
                                  .toString()
                                  .padLeft(2, "0") +
                                  ":" +
                                  toTime.minute
                                      .toString()
                                      .padLeft(2, "0");
                            }
                          }
                        });
                      });
                    },
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 4,
                        shadowColor: Color(0x99492D72),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                                top: 15.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          toTime != null
                                              ? toTime.toString()
                                              : AppLocalizations.of(context)
                                              .trans("to_time"),
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Material(
                                            elevation: 4,
                                            shadowColor: Color(0x99492D72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),
                                              child:
                                              Icon(Icons.access_time),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay(hour: 1, minute: 0),
                      ).then((time) {
                        setState(() {
                          toTime = time;
                          bloc.model.endTime =
                              toTime.hour.toString().padLeft(2, "0") +
                                  ":" +
                                  toTime.minute
                                      .toString()
                                      .padLeft(2, "0");
                          if (fromTime != null) {
                            if ((toTime.hour + toTime.minute / 60.0) <
                                (fromTime.hour + fromTime.minute / 60.0)) {
                              setState(() {
                                fromTime = time;
                                bloc.model.startTime = fromTime.hour
                                    .toString()
                                    .padLeft(2, "0") +
                                    ":" +
                                    fromTime.minute
                                        .toString()
                                        .padLeft(2, "0");
                              });
                            }
                          }
                        });
                      });
                    },
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                width: Checkbox.width,
                                height: Checkbox.width,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black38,
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(5),
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor:
                                          Colors.transparent,
                                    ),
                                    child: Checkbox(
                                      value: checkedValue,
                                      onChanged: (state) => setState(() =>
                                          checkedValue = !checkedValue),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0),
                              child: Text(
                                "wedding_car",
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                width: Checkbox.width,
                                height: Checkbox.width,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black38,
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(5),
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor:
                                          Colors.transparent,
                                    ),
                                    child: Checkbox(
                                      value: checkedValue1,
                                      onChanged: (state) => setState(() =>
                                          checkedValue1 = !checkedValue1),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0),
                              child: Text(
                                "Dj",
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
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              clipBehavior: Clip.hardEdge,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                width: Checkbox.width,
                                height: Checkbox.width,
                                child: Container(
                                  decoration: new BoxDecoration(
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.black38,
                                    ),
                                    borderRadius:
                                        new BorderRadius.circular(5),
                                  ),
                                  child: Theme(
                                    data: ThemeData(
                                      unselectedWidgetColor:
                                          Colors.transparent,
                                    ),
                                    child: Checkbox(
                                      value: checkedValue2,
                                      onChanged: (state) => setState(() =>
                                          checkedValue2 = !checkedValue2),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 3.0),
                              child: Text(
                                "photography",
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
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      elevation: 4,
                      shadowColor: Color(0x99492D72),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        height: show ? 200 : 60,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, bottom: 8.0, top: 15.0),
                          child: Center(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "photo",
                                        style: TextStyle(
                                            letterSpacing: 2,
                                            color: AppColors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Material(
                                          elevation: 4,
                                          shadowColor: Color(0x99492D72),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding:
                                            const EdgeInsets.all(5.0),
                                            child: InkWell(
                                              onTap: () {
                                                show=true;
                                                _pickImageFromGallery();
                                              },
                                              child: Icon(
                                                  Icons.camera_alt_outlined),
                                            ),
                                          )),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: Visibility(
                                    visible: show,
                                    child: Container(
                                      width:
                                      MediaQuery.of(context).size.width,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Column(
                                          children: [
                                            Text(
                                              AppLocalizations.of(context)
                                                  .trans('service_photos'),
                                              style: TextStyle(
                                                  color: AppColors.purple),
                                            ),
                                            // Visibility(
                                            //   visible: _image != null,
                                            //   child: Container(
                                            //     height: 150,
                                            //     child: Image.file(_image),
                                            //   ),
                                            // )
                                            Visibility(
                                              visible: files.length!=0,
                                              child: GridView.builder(
                                                  gridDelegate:
                                                  SliverGridDelegateWithMaxCrossAxisExtent(
                                                      maxCrossAxisExtent: 200,
                                                      childAspectRatio: 1,
                                                      crossAxisSpacing: 2,
                                                      mainAxisSpacing: 10),
                                                  shrinkWrap: true,
                                                  itemCount: files.length,
                                                  itemBuilder: (context, index) {
                                                    var file = files[index];
                                                    return Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.all(8.0),
                                                          width:
                                                          MediaQuery.of(context).size.width / 3.3,
                                                          height:
                                                          MediaQuery.of(context).size.width / 3,
                                                          decoration: BoxDecoration(
                                                            border: Border.all(
                                                                color: Colors.white, width: 5),
                                                            shape: BoxShape.rectangle,
                                                            color: Colors.white,
                                                            image: DecorationImage(
                                                              fit: BoxFit.cover,
                                                              image: FileImage(
                                                                  File(file.path)), //(_image1.path),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  }),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 4,
                        shadowColor: Color(0x99492D72),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                                top: 15.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .trans("add_section"),
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Material(
                                            elevation: 4,
                                            shadowColor: Color(0x99492D72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Icon(Icons.add),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        list.add(new HallFoodDetails());
                      });
                    },
                  ),
                  Visibility(
                    visible: list != null,
                    child: Container(
                      height: MediaQuery.of(context).size.height/8,
                      child: ListView.builder(
                        shrinkWrap: true,
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldWidget(
                                    name: "venus_name",
                                    onChange: (name) {
                                      list.last.name = name;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldWidget(
                                    name: "venus_description",
                                    onChange: (name) {
                                      list.last.description = name;
                                    },
                                  ),
                                ),
                                Divider(
                                  thickness: 3,
                                ),
                              ],
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Material(
                        elevation: 4,
                        shadowColor: Color(0x99492D72),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white10,
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                bottom: 8.0,
                                top: 15.0),
                            child: Center(
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          AppLocalizations.of(context)
                                              .trans("add_venus"),
                                          style: TextStyle(
                                              letterSpacing: 2,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15.0),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0),
                                        child: Material(
                                            elevation: 4,
                                            shadowColor: Color(0x99492D72),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(8),
                                            ),
                                            child: Padding(
                                              padding:
                                              const EdgeInsets.all(5.0),
                                              child: Icon(Icons.add),
                                            )),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      setState(() {
                        ShowDialogs.createVenusDialog(context,
                           )
                            .then((value) {

                          if (value!=null)
                            {
                              venus.add(value);
                            }
                        });
                      });
                    },
                  ),
                  SizedBox(height: 10,),
                  Visibility(
                    visible: venus != null,
                    child: Container(
                      height: MediaQuery.of(context).size.height/8,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: venus.length,
                          itemBuilder: (BuildContext context, index) {
                            return Container(
                              child: Center(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(venus[index].name)
                                    ),
                                    Divider(
                                      thickness: 3,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  SizedBox(height: 10,),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 5),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                // color: Colors.white,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    bloc.model.hallDetails = list;
                    bloc.model.venus=venus;
                    bloc.model.weddingCar= checkedValue;
                    bloc.model.dj=checkedValue1;
                    bloc.model.photography=checkedValue2;
                    bloc.model.logo="totam";
                    this.addService();
                    bloc.create(context);
                  },
                  child: Text(
                    AppLocalizations.of(context).trans("add_hall"),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
