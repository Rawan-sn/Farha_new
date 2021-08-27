import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/models/list_services_halls_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class HallDetailsPage extends StatefulWidget {
  final ListServiceHallsModel data;

  HallDetailsPage(this.data);

  @override
  _HallDetailsPageState createState() =>
      _HallDetailsPageState();
}

class _HallDetailsPageState extends State<HallDetailsPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("hall_details"),
            style: TextStyle(
              fontSize: TextSizes.text,
            ),
          ),
          flexibleSpace: Container(
            color: AppColors.purple,
          ),
          elevation: 2,
        ),
        body: Stack(
          children: [

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: widget.data.images.length != 0,
                    child: Container(
                      color: AppColors.purple,
                      height: MediaQuery.of(context).size.height / 3.3,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.data.images.length,
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
                    replacement: Container(
                      color: AppColors.purple,
                      height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .trans("hall_name"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(widget.data.name),
                              ),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: 8.0, vertical: 4),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //     children: [
                        //       Text(
                        //         AppLocalizations.of(context)
                        //             .trans("beauty_type"),
                        //         style: TextStyle(
                        //             fontSize: 15,
                        //             fontWeight: FontWeight.bold,
                        //             color: AppColors.purple),
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.symmetric(
                        //             horizontal: 15.0),
                        //         child: Text(widget.data..type),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).trans("address"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30.0),
                                child: Text(widget.data.address),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).trans("phone"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text(widget.data.phone),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).trans("open_at"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text(widget.data.serviceHallDetails.startTime),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context).trans("closed_at"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Text(widget.data.serviceHallDetails.endTime),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 8),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.purple5,
                          ),
                        ),
                        Container(

                          width: MediaQuery.of(context).size.width,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: GridView.builder(
                                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 200,
                                    childAspectRatio: 3 / 2,
                                    crossAxisSpacing: 20,
                                    mainAxisSpacing: 20),
                                shrinkWrap: true,
                                itemCount:
                                widget.data.serviceHallDetails.hallDetails.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .trans("venues"),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.yellow),
                                          ),
                                          Text(widget.data.serviceHallDetails.venues
                                              [index].name),
                                        ],
                                      ),
                                      // Text(widget.data.serviceDetails
                                      //     .details[index].description??""),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .trans("capacity")+"  ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.purple),
                                          ),
                                          Text(widget.data.serviceHallDetails.venues[index].capacity.toString()),
                                        ],
                                      ),
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .trans("price")+"  ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.purple),
                                          ),
                                          Text(widget.data.serviceHallDetails.venues[index].price.toString()),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Divider(
                                          thickness: 2,
                                          color: AppColors.purple5,
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 50
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(top: 5),
                width: MediaQuery.of(context).size.width,
                height: 50,
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
                    AppLocalizations.of(context).trans("add_to_cart"),
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
