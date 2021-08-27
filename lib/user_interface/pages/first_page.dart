import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/user_interface/pages/register_page.dart';
import 'package:farha_app/user_interface/widgets/blockbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_page.dart';
import 'main_navigation_pages.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    _setStatusBar();
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height:  MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2921.jpg'),
            fit: BoxFit.cover,
          ),
        ),
       child: SingleChildScrollView(
         child:
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[
             Column(
               children: <Widget>[
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.1,
                 ),
                 SizedBox(
                   height: MediaQuery.of(context).size.height * 0.025,
                 ),
                 Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: <Widget>[
                     Container(
                       width: MediaQuery.of(context).size.width,
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.only(
                             topLeft: Radius.circular(10),
                             topRight: Radius.circular(10),
                             bottomLeft: Radius.circular(10),
                             bottomRight: Radius.circular(10)),
                         boxShadow: [
                           BoxShadow(
                             color: Colors.black.withOpacity(0.8),
                             spreadRadius: 100,
                             blurRadius: 100,
                             offset: Offset(0, 3), // changes position of shadow
                           ),
                         ],
                       ),
                       child: Column(
                         children: <Widget>[
                           Container(
                             height: MediaQuery.of(context).size.width * 0.1,
                             width: MediaQuery.of(context).size.width * 0.1,
                             decoration: BoxDecoration(
                                 color: AppColors.white,
                                 borderRadius:
                                 BorderRadius.all(Radius.circular(15))),
                             child: Image.asset(
                               'assets/images/logo1.png',
                             ),
                           ),
                           Padding(
                             padding: const EdgeInsets.all(18.0),
                             child: Text(
                               'مرحبا بك بتطبيق فرحة حيث يمكنك إيجاد كل طلباتك لحفلتك',
                               style: TextStyle(fontSize: 22,color: Colors.white),
                               // TextStyles.getWhiteBold(FontSizes.bigText)
                               textAlign: TextAlign.center,
                             ),
                           ),
                         ],
                       ),
                     ),
                     SizedBox(
                       height: MediaQuery.of(context).size.height * 0.3,
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: BlockButtonWidget(
                         text: Text(
                           '   Sign_in   ',
                           style: TextStyle(color: AppColors.lightWhite),
                         ),
                         color: AppColors.purple,
                         onPressed: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => LoginPage()));
                         },
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: BlockButtonWidget(
                         text: Text(
                           'register_as_service_provider',
                           style: TextStyle(color: AppColors.lightWhite),
                         ),
                         color: AppColors.purple,
                         onPressed: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => RegisterPage(true)));
                         },
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: BlockButtonWidget(
                         text: Text(
                           'continue_as_gist',
                           style: TextStyle(color: AppColors.lightWhite),
                         ),
                         color: AppColors.purple,
                         onPressed: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) => MainNavigationPages()));
                         },
                       ),
                     )
                   ],
                 ),
               ],
             ),
           ],
         ),

       ),
      ),
    );
  }

  _setStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}
/*

  child: SafeArea(
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
              AnimationScaleWidget(
                position: 3,
                verticalOffset: 100,
                horizontalOffset: 0,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height:80,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/images/logo1.png",
                                scale: 5,
                              ),
                              Text("Welcome you with a Farha app\n",
                               style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.w400,fontSize: 22),
                              ),
                              Text("  you can found all services for\n",
                                style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.w400,fontSize: 22),
                              ),
                              Text(" your celebrity",
                                style: TextStyle(color: AppColors.gray,fontWeight: FontWeight.w400,fontSize: 22),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 5,
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlockButtonWidget(
                        text: Text(
                          'Sign_up',
                          style: TextStyle(color: AppColors.lightWhite),
                        ),
                        color: AppColors.purple,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterPage()));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlockButtonWidget(
                        text: Text(
                          'Sign_in',
                          style: TextStyle(color: AppColors.lightWhite),
                        ),
                        color: AppColors.purple,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                      ),
                    )
                    ,

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BlockButtonWidget(
                        text: Text(
                          'continue_as_gist',
                          style: TextStyle(color: AppColors.lightWhite),
                        ),
                        color: AppColors.purple,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainNavigationPages()));
                        },
                      ),
                    )
                  ],

                ),
              ),
            ],
          ),
        ),
 */