import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/data_store.dart';
import 'package:farha_app/user_interface/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 60,
            title: Text(
              AppLocalizations.of(context).trans("setting"),
              style: TextStyle(
                fontSize: TextSizes.text,
              ),
            ),
            flexibleSpace: Container(
              color: AppColors.purple,
            ),
            elevation: 2,
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              child: Material(
                elevation: 4,
                shadowColor: Color(0x99492D72),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Icon(Icons.logout),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0,right: 8.0),
                          child: Text("Logout",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20) ),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    dataStore
                        .setAuthUser(null)
                        .then((value) => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SplashScreen()),
                            ));
                  },
                ),
              ),
            ),
          )),
    );
  }
}
