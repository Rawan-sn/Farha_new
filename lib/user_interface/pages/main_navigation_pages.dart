import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/user_interface/pages/profile_page.dart';
import 'package:farha_app/user_interface/pages/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'home_page.dart';

class MainNavigationPages extends StatefulWidget {
  @override
  _MainNavigationPagesState createState() => _MainNavigationPagesState();
}

class _MainNavigationPagesState extends State<MainNavigationPages> {
  var _selectedPageIndex;
  List<Widget> _pages;
  PageController _pageController;
  DateTime currentBackPressTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    _selectedPageIndex = 0;
    _pages = [
      Home(),
    ];

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
          msg: AppLocalizations.of(context).trans('tap_again_exit'));
      return Future.value(false);
    }
    return Future.value(true);
  }

  void _selectPage(int selectedPageIndex) {
    setState(() {
      _selectedPageIndex = selectedPageIndex;
      _pageController.jumpToPage(selectedPageIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.purple,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 22,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedIconTheme: IconThemeData(size: 28),
          unselectedItemColor: Theme.of(context).focusColor.withOpacity(1),
          currentIndex: _selectedPageIndex,
          onTap: (int i) {
            _selectPage(i);
          },
          // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: InkWell(
                child: Icon(Icons.notifications),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
              ),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
                title: new Container(height: 5.0),
                icon: Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: AppColors.purple.withOpacity(0.4),
                          blurRadius: 40,
                          offset: Offset(0, 15)),
                      BoxShadow(
                          color: AppColors.purple.withOpacity(0.4),
                          blurRadius: 13,
                          offset: Offset(0, 3))
                    ],
                  ),
                  child: new Icon(Icons.home, color: AppColors.white),
                )),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AddBeautyCenterPage()),
                    // );
                  },
                  child: new Icon(Icons.shopping_cart_sharp)),
              title: new Container(height: 0.0),
            ),
            BottomNavigationBarItem(
              icon: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
                    );
                  },
                  child: new Icon(Icons.person)),
              title: new Container(height: 0.0),
            ),
          ],
        ),
      ),
    );
  }
}
