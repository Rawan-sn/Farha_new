import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/profile_bloc.dart';
import 'package:farha_app/bloc/update_profile_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/HelperWidgets.dart';
import 'package:farha_app/models/create_model/update_profile_model.dart';
import 'package:farha_app/models/user_model.dart';
import 'package:farha_app/user_interface/widgets/TextFieldCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:farha_app/helper/app_config.dart' as config;

import 'main_navigation_pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ProfileBloc bloc = ProfileBloc();
  UpdateProfileBloc bloc1 = UpdateProfileBloc();
  bool isEdit = false;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    bloc.getProfile(context);

    bloc.profileStream.listen((event) {
      print('profileStream.listen...');
      firstNameController.text = event.firstName;
      lastNameController.text = event.lastName;
      addressController.text = event.address;
      phoneController.text = event.phone;
      emailController.text = event.email;
      genderController.text = event.gender;


    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF492D72),
        leading: IconButton(
          icon: InkWell(
            onTap: (){ Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MainNavigationPages()),
            );
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          onPressed: () {},
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment:Alignment.bottomCenter,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        //print('text: ${firstNameController.text}');

                        setState(() {
                          isEdit = true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        width: 110,
                        child: helper.mainButton(
                          context: context,
                          title: AppLocalizations.of(context).trans("update"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    InkWell(
                      onTap: () {
                        //print('text: ${firstNameController.text}');
                        bloc1.updateProfile(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 30),
                        width: 110,
                        child: helper.mainButton(
                          context: context,
                          title: AppLocalizations.of(context).trans("save"),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          CustomPaint(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            painter: HeaderCurvedContainer(),
          ),
          Stack(
           // mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Container(
                  //padding: EdgeInsets.all(10.0),
//                  width: MediaQuery.of(context).size.width / 3,
//                  height: MediaQuery.of(context).size.width / 3,
                  //height: 350,
                  //color: AppColors.lilac,
                  // width: double.infinity,
                  margin: EdgeInsets.symmetric(
                    horizontal: 2,
                  ),
                  padding: EdgeInsets.only(top: 120),
                  //width: config.App(context).appHeight(100),
                  height: config.App(context).appHeight(60),
                  child: Form(
                    child: SingleChildScrollView(
                      child: Visibility(
                        visible: !isEdit,
                        child: StreamBuilder<UserModel>(
                            stream: bloc.profileStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                if (snapshot.data != null) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                          labelText: "first_name",
                                          hintText: snapshot.data.firstName,
                                          colorphoto: "assets/images/gray.png",
                                          controller: firstNameController),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                        labelText: 'last_name',
                                        hintText: snapshot.data.lastName,
                                        colorphoto: "assets/images/gray.png",
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                        labelText: 'Email',
                                        hintText: snapshot.data.email,
                                        colorphoto: "assets/images/gray.png",
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                        labelText: 'Phone',
                                        hintText: snapshot.data.phone,
                                        colorphoto: "assets/images/gray.png",
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                          labelText: 'Gender',
                                          hintText: snapshot.data.gender,
                                          colorphoto: "assets/images/gray.png"),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                        labelText: 'Address',
                                        hintText: snapshot.data.address,
                                        colorphoto: "assets/images/gray.png",
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      TextFieldCard(
                                        labelText: 'Type',
                                        hintText: snapshot.data.type,
                                        colorphoto: "assets/images/gray.png",
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: Icon(
                                      Icons.hotel,
                                    ),
                                  );
                                }
                              }
                              return Padding(
                                padding: EdgeInsets.only(top: 20),
                                child: SpinKitFadingCircle(
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: index.isEven
                                            ? Colors.pinkAccent
                                            : Colors.purpleAccent,
                                      ),
                                    );
                                  },
                                ),
                              );
                            }),
                        replacement: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 7,
                            ),
                            TextFieldCard(
                                labelText: "first_name",
                                colorphoto: "assets/images/gray.png",
                                change: (name) {
                                  bloc1.model.firstName = name;
                                },
                                controller: firstNameController),
                            SizedBox(
                              height: 7,
                            ),
                            TextFieldCard(
                                labelText: 'last_name',
                                colorphoto: "assets/images/gray.png",
                                change: (name) {
                                  bloc1.model.lastName = name;
                                },
                                controller: lastNameController),
                            SizedBox(
                              height: 7,
                            ),
                            TextFieldCard(
                                labelText: 'Phone',
                                colorphoto: "assets/images/gray.png",
                                change: (name) {
                                  bloc1.model.phone = name;
                                },
                                controller: phoneController),
                            SizedBox(
                              height: 7,
                            ),
                            TextFieldCard(
                                labelText: 'Gender',
                                colorphoto: "assets/images/gray.png",
                                change: (name) {
                                  bloc1.model.gender = name;
                                },
                                controller: genderController),
                            SizedBox(
                              height: 7,
                            ),
                            TextFieldCard(
                                labelText: 'Address',
                                colorphoto: "assets/images/gray.png",
                                change: (name) {
                                  bloc1.model.address = name;
                                },
                                controller: addressController),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),


            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Your Profile",
                  style: TextStyle(
                    fontSize: 35,
                    letterSpacing: 1.5,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 5),
                  shape: BoxShape.circle,
                  color: Colors.white,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/boss.png'),
                  ),
                ),
              ),
            ],
          ),
//          Padding(
//            padding: EdgeInsets.only(left: 125, bottom: 300),
//            child: CircleAvatar(
//              backgroundColor: Colors.black54,
//              child: IconButton(
//                icon: Icon(
//                  Icons.edit,
//                  color: Colors.white,
//                ),
//                onPressed: () {},
//              ),
//            ),
//          ),
        ],
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Color(0x99492D72);
    Path path = Path()
      ..relativeLineTo(0, 110)
      ..quadraticBezierTo(size.width / 2, 190, size.width, 110)
      ..relativeLineTo(0, -110)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
