import 'dart:io';

import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/beauty_center_create_bloc.dart';
import 'package:farha_app/bloc/upload_image_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/app_constants.dart';
import 'package:farha_app/models/beauty_section_model.dart';
import 'package:farha_app/user_interface/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AddBeautyCenterPage extends StatefulWidget {
  @override
  _AddBeautyCenterPageState createState() => _AddBeautyCenterPageState();
}

class _AddBeautyCenterPageState extends State<AddBeautyCenterPage> {
  final ImagePicker _picker = ImagePicker();
  bool show = false;
  String type = AppConstants.allService[0];
  TimeOfDay fromTime;
  TimeOfDay toTime;
  String type1;
  List<BeautySectionModel> list = new List<BeautySectionModel>();
  UploadImageBloc _uploadImageBloc = new UploadImageBloc();
  CreateBeautyCenterBloc bloc=CreateBeautyCenterBloc();
  List files = [];
  File _image;
  File _image1;

  // _pickImageFromGallery() async {
  //   File image = (await _picker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50)) as File;
  //   if (image != null) {
  //     _uploadImageBloc.file = image;
  //     _uploadImageBloc.uploadImage(context,"BeautyCenter");
  //   }
  //   setState(() {
  //     _image = image;
  //     print(_image);
  //   });
  // }
  // _pickImageFromGalleryForLogo() async {
  //   File image = (await _picker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50)) as File;
  //   if (image != null) {
  //     _uploadImageBloc.file = image;
  //     _uploadImageBloc.uploadImage(context,"BeautyCenter");
  //   }
  //   setState(() {
  //     _image1 = image;
  //     print(_image1);
  //   });
  // }

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
            AppLocalizations.of(context).trans("add_service"),
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
                children: [
                  Column(
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
                                    :Image.network(
                                         _image1.path),

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
                                    //  _pickImageFromGalleryForLogo();
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
                                            type1 ??
                                                AppLocalizations.of(context)
                                                    .trans("type"),
                                            style: TextStyle(
                                                letterSpacing: 2,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15.0),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                          const EdgeInsets.only(right: 8.0),
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                            child: Center(
                                              child: Material(
                                                elevation: 4,
                                                shadowColor: Color(0x99492D72),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                  BorderRadius.circular(5),
                                                ),
                                                child: PopupMenuButton(
                                                  icon: Icon(Icons
                                                      .arrow_drop_down_sharp),
                                                  enabled: true,
                                                  onSelected: (value) {
                                                    setState(() {
                                                      type1 = value;
                                                      bloc.model.type=type1;
                                                    });
                                                  },
                                                  itemBuilder:
                                                      (BuildContext context) {
                                                    return [
                                                      PopupMenuItem(
                                                        value: "mens",
                                                        child: Text(
                                                            AppLocalizations.of(
                                                                context)
                                                                .trans('mens')),
                                                      ),
                                                      PopupMenuItem(
                                                        value: "ladies",
                                                        child: Text(
                                                            AppLocalizations.of(
                                                                context)
                                                                .trans(
                                                                "ladies")),
                                                      )
                                                    ];
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
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
                                           //         _pickImageFromGallery();
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
                            list.add(new BeautySectionModel());
                          });
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: list != null,
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: list.length,
                          itemBuilder: (BuildContext context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldWidget(name: "section_name"
                                  ,onChange: (name)
                                    {
                                      list.last.name=name;
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldWidget(name: "service_price",onChange: (name){
                                    list.last.price=name;
                                  },),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: TextFieldWidget(
                                      name: "section_description",
                                  onChange: (name){
                                        list.last.description=name;
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
                  SizedBox(
                    height: 50,
                  ),
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
                    bloc.model.details=list;


                  },
                  child: Text(
                    AppLocalizations.of(context).trans("add_service"),
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
/*
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
                          color:Colors.white10,
                          borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      height: show ? 200 : 60,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0, top: 15.0),
                        child: Center(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(type,
                                    style: TextStyle(
                                      letterSpacing: 2,
                                      color: AppColors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0
                                    ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_drop_down_sharp),
                                ],
                              ),
                              Expanded(
                                child: Visibility(
                                  visible: show,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: [
                                          Divider(),
                                          Expanded(
                                            child: ListView.builder(
                                                itemCount: AppConstants
                                                    .allService.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return ListTile(
                                                      title: Text(AppConstants
                                                          .allService[index],style: TextStyle(
                                                        color: type == AppConstants
                                                            .allService[index]?Colors.purple:Colors.black

                                                      ),),
                                                      onTap: () {
                                                        setState(() {
                                                          type = AppConstants
                                                              .allService[index];
                                                          show=!show;
                                                        });
                                                      });
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
                onTap: () {
                  setState(() {
                    show = !show;
                  });
                },
              ),
 */
