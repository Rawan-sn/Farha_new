import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/register_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/user_interface/widgets/AnimationScaleWidget.dart';
import 'package:flutter/material.dart';
import 'package:farha_app/helper/app_config.dart' as config;
import '../widgets/blockbutton.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final bool isService;

  RegisterPage(this.isService);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final FocusNode _firstNameFocusNode = FocusNode();
  final FocusNode _lastNameFocusNode = FocusNode();
  String valueChoose;
  List listItem = ["male" , "female"];
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  RegisterBloc bloc = new RegisterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Positioned(
            bottom: 30,
            child: Row(
              children: [
                Text(
            AppLocalizations.of(context).trans("I_have_an_account_back_to"),
                  style: TextStyle(
                    color: AppColors.purple,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text("SignIn",
                      style: TextStyle(
                        color: AppColors.pink1,
                      )),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            child: AnimationScaleWidget(
              position: 4,
              horizontalOffset: 100,
              verticalOffset: 100,
              child: BlockButtonWidget(
                text: Text(
                  AppLocalizations.of(context).trans("sign_up"),
                  style: TextStyle(color: AppColors.lightWhite),
                ),
                color: AppColors.purple,
                onPressed: () {
                  if (widget.isService)
                    bloc.model.type = "provider";
                  else
                    bloc.model.type = "user";
                  bloc.register(context);
                },
              ),
            ),
          ),
          Positioned(
            top: 0,
            child: Container(
              width: config.App(context).appWidth(100),
              height: config.App(context).appHeight(37),
              decoration: BoxDecoration(color: AppColors.purple),
            ),
          ),
          Positioned(
            top: 80,
            child: AnimationScaleWidget(
              child: Container(
                width: config.App(context).appWidth(75),
                height: config.App(context).appHeight(10.5),
                child: Text(
                  AppLocalizations.of(context)
                      .trans("let's_start_with_sign_up"),
                  style: (TextStyle(
                    fontSize: 20,
                    color: AppColors.blueText,
                    fontFamily: "Quando",
                    // fontWeight: FontWeight.w700,
                  )),
                ),
              ),
            ),
          ),
          Positioned(
            top: config.App(context).appHeight(29.5) - 50,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.lilac,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 50,
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                    )
                  ]),
              margin: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 27),
              width: config.App(context).appWidth(88),
              height: config.App(context).appHeight(55),
              child: Form(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 3),

                      AnimationScaleWidget(
                        position: 3,
                        horizontalOffset: 100,
                        verticalOffset: 100,
                        child: TextFormField(
                          controller:  _firstNameController,
                          focusNode: _firstNameFocusNode,

                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (text){
                            print('onFieldSubmitted: $text');
                            FocusScope.of(context).requestFocus(_lastNameFocusNode);

                          },
                          onEditingComplete: () {
                            FocusScope.of(context).requestFocus(_lastNameFocusNode);
                          },
                          onChanged: (name) {
                            bloc.model.firstName = name;
                          },
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 3
                              ? "should_be_more_than_3_letters"
                              : null,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("first_name"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_outline,
                                color: AppColors.purple),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimationScaleWidget(
                        position: 3,
                        horizontalOffset: 100,
                        verticalOffset: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          focusNode: _lastNameFocusNode,
                          onChanged: (name) {
                            bloc.model.lastName = name;
                          },
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 3
                              ? "should_be_more_than_3_letters"
                              : null,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("last_name"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_outline,
                                color: AppColors.purple),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.5))),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimationScaleWidget(
                        position: 3,
                        horizontalOffset: 0,
                        verticalOffset: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (address) => bloc.model.address = address,
                          keyboardType: TextInputType.text,
                          validator: (input) => input.length < 3
                              ? "should_be_more_than_3_letters"
                              : null,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("address"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.location_city,
                                color: AppColors.purple),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimationScaleWidget(
                        position: 4,
                        horizontalOffset: 100,
                        verticalOffset: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (phone) => bloc.model.phone = phone,
                          keyboardType: TextInputType.phone,
                          validator: (input) => !input.contains('@')
                              ? "should_be_a_valid_email"
                              : null,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("phone"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.format_list_numbered_sharp,
                                color: AppColors.purple),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      AnimationScaleWidget(
                        position: 4,
                        horizontalOffset: 0,
                        verticalOffset: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (password) =>
                              bloc.model.password = password,
                          obscureText: _obscureText,
                          validator: (input) => input.length < 6
                              ? "should_be_more_than_6_letters"
                              : null,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("password"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintText: '••••••••••••',
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.1)),
                            prefixIcon: Icon(Icons.lock_outline,
                                color: AppColors.purple),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _toggle();
                                });
                              },
                              color: AppColors.purple,
                              icon: Icon(Icons.visibility),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      AnimationScaleWidget(
                        position: 4,
                        horizontalOffset: 0,
                        verticalOffset: 100,
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          onChanged: (email) =>
                          bloc.model.email = email,

                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("email"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.1)),
                            prefixIcon: Icon(Icons.email,
                                color: AppColors.purple),

                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.purple)),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.purple)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.purple)),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      DropdownButtonFormField(
                        value: valueChoose,
                        onChanged: (valueChoose) => bloc.model.gender = valueChoose,
                          decoration: InputDecoration(
                            labelText: AppLocalizations.of(context).trans("gender"),
                            labelStyle: TextStyle(color: AppColors.lightWhite),
                            contentPadding: EdgeInsets.all(12),
                            hintStyle: TextStyle(
                                color: Theme.of(context)
                                    .focusColor
                                    .withOpacity(0.7)),
                            prefixIcon: Icon(Icons.person_add_alt_1_outlined,
                                color: AppColors.purple),

                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Theme.of(context)
                                        .focusColor
                                        .withOpacity(0.2))),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.purple)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: AppColors.purple)),
                          ),
                          dropdownColor: Colors.white,
                          isExpanded: true,
                        iconSize: 25,
                        iconEnabledColor:AppColors.purple,
                          style:TextStyle(
                            color: AppColors.black,
                            fontSize: 15,
                            decorationColor: AppColors.red,
                          ),
                          items: listItem.map((valueItem){
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                        ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
