import 'package:farha_app/Localization/AppLocal.dart';
import 'package:farha_app/bloc/add_to_cart_bloc.dart';
import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/models/create_model/add_to_cart_model.dart';
import 'package:farha_app/models/list_service_beauty_center_model.dart';
import 'package:farha_app/user_interface/dialogs/show_dialogs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class BeautyCenterDetailsPage extends StatefulWidget {
  final ListServiceBeautyCenterModel data;

  BeautyCenterDetailsPage(this.data);

  @override
  _BeautyCenterDetailsPageState createState() =>
      _BeautyCenterDetailsPageState();
}

class _BeautyCenterDetailsPageState extends State<BeautyCenterDetailsPage> {
  AddToCartBloc _bloc = AddToCartBloc();

  @override
  void initState() {

    super.initState();
    _bloc.model.serviceId = widget.data.id.toString();
    _bloc.model.type = widget.data.type;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          title: Text(
            AppLocalizations.of(context).trans("beauty_details"),
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
                                    .trans("beauty_name"),
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
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)
                                    .trans("beauty_type"),
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.purple),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(widget.data.serviceDetails.type),
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
                              Text(widget.data.serviceDetails.startTime),
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
                              Text(widget.data.serviceDetails.endTime),
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
                                    widget.data.serviceDetails.details.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            AppLocalizations.of(context)
                                                .trans("section  "),
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.yellow),
                                          ),
                                          Text(widget.data.serviceDetails
                                              .details[index].name),
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
                                                .trans("price")+"  ",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.purple),
                                          ),
                                          Text(widget.data.serviceDetails
                                              .details[index].price
                                              .toString()),
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
                  onPressed: () {
                    setState(() {
                      ShowDialogs.createCartDialog(context,
                        widget.data.serviceDetails.details
                      )
                          .then((value) {

                        if (value!=null)
                        {
                         // venus.add(value);
                        }
                      });
                    });

                 //   _bloc.create(context);
                  },
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
