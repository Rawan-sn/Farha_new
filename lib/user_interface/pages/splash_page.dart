import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/data_store.dart';
import 'package:farha_app/user_interface/pages/main_navigation_pages.dart';
import 'package:farha_app/user_interface/widgets/animation_scale_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'first_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5)).then((val) {
      dataStore.getAuthUser().then((authUser) {
        print("Token: ${dataStore.authUser?.token}");
        if (authUser == null) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => FirstPage()),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => FirstPage()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    _setStatusBar();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
                child: new Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints.expand(),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      colors: [
                        AppColors.gray, //.withOpacity(0.5)
                        AppColors.purple,
                      ],
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                    )))),
            Column(
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height / 5,
                ),
                AnimationScaleWidget(
                  position: 3,
                  verticalOffset: 100,
                  horizontalOffset: 0,
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        "assets/images/logo1.png",
                        scale: 2.5,
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
