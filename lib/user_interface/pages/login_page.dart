import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/login_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/user_interface/pages/register_page.dart';
import 'package:farha_app/user_interface/widgets/AnimationScaleWidget.dart';
import 'package:flutter/material.dart';
import 'package:farha_app/helper/app_config.dart' as config;
import '../widgets/blockbutton.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  LoginBloc _bloc = LoginBloc();
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Container(
                width: config.App(context).appWidth(150),
                height: config.App(context).appHeight(37),
                decoration: BoxDecoration(color: AppColors.purple),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 120,
              left: 20,
              child: Container(
                width: config.App(context).appWidth(100),
                height: config.App(context).appHeight(37),
                child: AnimationScaleWidget(
                  position: 4,
                  horizontalOffset: 100,
                  verticalOffset: 100,
                  child: Text(
                    "Let's Start with SignIn",
                    style: (TextStyle(
                      fontSize: 25,
                      color: AppColors.blueText,
                      fontFamily: "Quando",
                      // fontWeight: FontWeight.w700,
                    )),
                  ),
                ),
              ),
            ),
            Positioned(
              top: config.App(context).appHeight(37) - 50,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.lilac,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 50,
                        color: AppColors.purple,
                      )
                    ]),
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                padding:
                EdgeInsets.only(top: 50, right: 27, left: 27, bottom: 20),
                width: config.App(context).appWidth(88),
//              height: config.App(context).appHeight(55),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimationScaleWidget(
                      position: 3,
                      horizontalOffset: 0,
                      verticalOffset: 100,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        onChanged: (input) => _bloc.email = input,
                        keyboardType: TextInputType.emailAddress,
                        //onSaved: (input) => _con.user.email = input,
                        validator: (input) => !input.contains('@')
                            ? "should_be_a_valid_email"
                            : null,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(color: AppColors.lightWhite),
                          contentPadding: EdgeInsets.all(12),
                          //hintText: 'raneem@gmail.com',
                          hintStyle: TextStyle(color: AppColors.black),
                          prefixIcon: Icon(Icons.alternate_email,
                              color: AppColors.purple),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purple)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purple)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purple)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    AnimationScaleWidget(
                      position: 4,
                      horizontalOffset: 100,
                      verticalOffset: 100,
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        onChanged: (input) => _bloc.password = input,
                        obscureText: _obscureText,
                        // onSaved: (input) => "Password" = input,
                        validator: (input) => input.length < 3
                            ? 'should_be_more_than_3_characters'
                            : null,
                        decoration: InputDecoration(
                          // labelText: S.of(context).password,
                          labelText: 'password',
                          labelStyle: TextStyle(color: AppColors.lightWhite),
                          contentPadding: EdgeInsets.all(12),
                          hintText: '••••••••••••',
                          hintStyle: TextStyle(color: AppColors.lightWhite),
                          prefixIcon:
                          Icon(Icons.lock_outline, color: AppColors.purple),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _toggle();
                                //_con.hidePassword = !_con.hidePassword;
                              });
                            },
                            color: AppColors.purple,
                            icon: Icon(Icons.visibility),
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: AppColors.purple)),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.purple,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.purple,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    AnimationScaleWidget(
                      position: 4,
                      horizontalOffset: 0,
                      verticalOffset: 100,
                      child: BlockButtonWidget(
                        text: Text(
                          AppLocalizations.of(context).trans("sign_in"),
                          style: TextStyle(color: AppColors.lightWhite),
                        ),
                        color: AppColors.purple,
                        onPressed: () {
                          _bloc.login(context);
                        },
                      ),
                    ),
                    SizedBox(height: 15),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed('/Pages', arguments: 2);
                      },
                      shape: StadiumBorder(),
                      textColor: AppColors.purple,
                      child: Text('Skip'),
                      padding:
                      EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    ),
//                      SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 85,
              child: Column(
                children: <Widget>[
                  AnimationScaleWidget(
                    position: 4,
                    horizontalOffset: 100,
                    verticalOffset: 100,
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterPage(false)),
                              );
                            },
                            child: Text(
                              ("I don't have an account"),
                            )),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage(false)),
                            );
                          },
                          child: Text(" SignUp",
                              style: TextStyle(
                                color: AppColors.pink1,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}