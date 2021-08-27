import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/beauty_center_list_bloc.dart';
import 'package:farha_app/bloc/food_shop_list_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/app_permissions.dart';
import 'package:farha_app/models/all_service_beauty_center_model.dart';
import 'package:farha_app/models/all_service_food_shop_model.dart';
import 'package:farha_app/user_interface/cards/beauty_item_card.dart';
import 'package:farha_app/user_interface/cards/food_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'add_beauty_center_page.dart';
import 'add_foodShop_page.dart';
import 'beauty_center_details_page.dart';

class FoodShopListPage extends StatefulWidget {
  @override
  _FoodShopListPageState createState() => _FoodShopListPageState();
}

class _FoodShopListPageState extends State<FoodShopListPage> {
  FoodShopListBloc _bloc = FoodShopListBloc();

  @override
  void initState() {
    _bloc.getFoodShops(context, "FoodShop");
    super.initState();
  }


  moveToAddFoodShop() async {
    var isAddedOrEdited = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddFoodShopsPage();
        },
      ),
    );
    if (isAddedOrEdited != null) {
      _refreshAll();
    }
  }

  Future<Null> _refreshAll() async {
    _bloc.clearBeautyCenter();
    _bloc.getFoodShops(context, "FoodShop");
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("food_shops"),
            style: TextStyle(
              fontSize: TextSizes.text,
            ),
          ),
          flexibleSpace: Container(
            color: AppColors.purple,
          ),
          elevation: 2,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              StreamBuilder<ServiceFoodShopModel>(
                  stream: _bloc.beautyCenterStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data.data.length != 0)
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          primary: false,
                          itemCount: snapshot.data.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              child:
                              FoodItemCard(data: snapshot.data.data[index]),
//                              onTap: () {
//                                Navigator.pushReplacement(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => BeautyCenterDetailsPage(snapshot.data.data[index]),
//                                   ));
//                              },
                            );
                          },
                        );
                      else {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 80,
                                width: 80,
                                child: Image(
                                    image: AssetImage(
                                        "assets/images/oops_data.png")),
                              ),
                              Text(AppLocalizations.of(context)
                                  .trans('no_data_found')),
                              ElevatedButton(
                                child: Text(AppLocalizations.of(context)
                                    .trans('refresh')),
                                onPressed: () {
                                  _refreshAll();
                                },
                              )
                            ],
                          ),
                        );
                      }
                    }
                    return Padding(
                      padding: EdgeInsets.only(top: 300),
                      child: Center(
                        child: SpinKitFadingCircle(
                          itemBuilder: (BuildContext context, int index) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: index.isEven
                                    ? Colors.pinkAccent
                                    : Colors.purpleAccent,
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  }),
            ],
          ),
        ),
        floatingActionButton: Visibility(
          visible: AppPermissions.isServiceProvider(),
          child: FloatingActionButton(
            onPressed: () {
              moveToAddFoodShop();
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
