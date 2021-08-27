import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/models/create_model/home_card_model.dart';
import 'package:farha_app/user_interface/widgets/ads_home_page_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../cards/home_grid_card.dart';
import 'beauty_center_list_page.dart';
import 'food_shop_list_page.dart';
import 'hall_list_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var mainItem = [
      HomeCardModel(
        "assets/images/hall.png",
        "assets/icons/hall.png",
        AppLocalizations.of(context).trans("halls"),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HallListPage()));
        },
      ),
      HomeCardModel(
        "assets/images/cake.png",
        'assets/icons/cake.png',
        AppLocalizations.of(context).trans("foods"),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => FoodShopListPage()));
        },
      ),
      HomeCardModel(
        'assets/images/beauty.jpg',
        'assets/icons/flowers.png',
        AppLocalizations.of(context).trans("beauty_salons"),
        () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BeautyListPage()));
        },
      ),
      HomeCardModel(
        'assets/images/photographer.jpg',
        'assets/icons/camera.png',
        AppLocalizations.of(context).trans("photograph"),
        () {},
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.purple,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(height: 160, child: AdsHomePageSlider()),
                AnimationConfiguration.synchronized(
                  duration: Duration(milliseconds: 1500),
                  child: SlideAnimation(
                    horizontalOffset: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: StaggeredGridView.countBuilder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 20,
                        staggeredTileBuilder: (index) {
                          return StaggeredTile.fit(1);
                        },
                        itemCount: mainItem.length,
                        itemBuilder: (context, index) {
                          return HomeGridCard(
                            image: mainItem[index].image,
                            icon: mainItem[index].icon,
                            title: mainItem[index].title,
                            onTap: mainItem[index].onTap,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(),
    );
  }
}
