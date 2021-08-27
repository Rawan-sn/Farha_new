import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetailsServicePage extends StatefulWidget {
  @override
  _DetailsServicePageState createState() => _DetailsServicePageState();
}

class _DetailsServicePageState extends State<DetailsServicePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("details"),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: AppColors.purple,
                    height: MediaQuery.of(context).size.height / 3,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Image.asset(
                            "assets/images/ad.jpg",
                            fit: BoxFit.cover,
                          ),
                          onTap: () {},
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Text(
                            AppLocalizations.of(context)
                                .trans("details_for_service"),
                            style: TextStyle(
                                fontSize: TextSizes.smallText,
                                fontWeight: FontWeight.bold,
                                color: AppColors.purple),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "Hall Name: ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text("AlBahia"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "Hall Large: ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text("150 person"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "Hall Price: ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text("300 person"),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            children: [
                              Text(
                                "Hall Location: ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text("Damascus"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 175,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(top: 5),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                // color: Colors.white,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  onPressed: () {},
                  child: Text(
                    "Add To Cart",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
