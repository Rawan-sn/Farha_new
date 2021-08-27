import
'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/beauty_center_list_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/helper/app_permissions.dart';
import 'package:farha_app/models/all_service_beauty_center_model.dart';
import 'package:farha_app/user_interface/cards/beauty_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'add_beauty_center_page.dart';
import 'beauty_center_details_page.dart';

class BeautyListPage extends StatefulWidget {
  @override
  _BeautyListPageState createState() => _BeautyListPageState();
}

class _BeautyListPageState extends State<BeautyListPage> {
  BeautyCenterBloc _bloc = BeautyCenterBloc();

  @override
  void initState() {
    _bloc.getBeautyCenter(context, "BeautyCenter");
    super.initState();
  }

  moveToAddBeauty() async {
    var isAddedOrEdited = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return AddBeautyCenterPage();
        },
      ),
    );
    if (isAddedOrEdited != null) {
      _refreshAll();
    }
  }

  Future<Null> _refreshAll() async {
    _bloc.clearBeautyCenter();
    _bloc.getBeautyCenter(context, "BeautyCenter");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("beauty_center"),
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
              StreamBuilder<ServiceBeautyCenterModel>(
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
                              BeautyItemCard(data: snapshot.data.data[index]),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => BeautyCenterDetailsPage(snapshot.data.data[index]),
                                    ));
                              },
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
              moveToAddBeauty();
            },
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
