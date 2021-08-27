import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:farha_app/models/list_service_beauty_center_model.dart';
import 'package:farha_app/models/list_services_foodshop_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FoodItemCard extends StatelessWidget {
  final ListServiceFoodShopModel data;

  FoodItemCard({this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            child: Image.asset(
              "assets/images/beauty.jpg",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width / 3.2,
              height: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "food shop  " + data.name,
                  style: TextStyle(
                      fontSize: TextSizes.text,
                      fontWeight: FontWeight.bold,
                      color: AppColors.purple),
                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 8.0),
//                  child: Text(
//                    "For " + data.serviceDetails.type,
//                    style: TextStyle(
//                        fontSize: 18,
//                        fontWeight: FontWeight.bold,
//                        color: Colors.amber),
//                  ),
//                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 10),
                  child: Text(
                    "created_data: " + DateTime.parse(data.createAt).year.toString()+"/"+DateTime.parse(data.createAt).month.toString()
                        +"/"+DateTime.parse(data.createAt).day.toString()
                    ,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 10),
                  child: RatingBar(
                    itemSize: 18,
                    ignoreGestures: true,
                    initialRating: data.rate.toDouble(),
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        "assets/images/heart.png",
                        height: 2.0,
                        width: 2.0,
                        color: Colors.purple,
                      ),
                      half: Image.asset(
                        "assets/images/heart_half.png",
                        height: 2.0,
                        width: 2.0,
                        color: Colors.purple,
                      ),
                      empty: Image.asset(
                        "assets/images/heart_border.png",
                        height: 2.0,
                        width: 2.0,
                        color: Colors.purple,
                      ),
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/*
LoadNetworkImage(
                    src: widget.model.attachments.isNotEmpty
                        ? widget.model.attachments?.first
                        : null,
 */

/*
 Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 5,
              width: MediaQuery.of(context).size.width / 3.2,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.purple),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: kElevationToShadow[4],
                color: Colors.white,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                child: Image.asset(
                  "assets/images/beauty.jpg",
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width / 4.2,
                  height: MediaQuery.of(context).size.width / 4.2,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 8.0, left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Beauty  "+
                    data.name,
                    style: TextStyle(
                        fontSize: TextSizes.text,
                        fontWeight: FontWeight.bold,
                        color: AppColors.purple),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3.85,
                          child: Text(
                            data.serviceDetails.type //'open :02:00 '
                            ,
                            style: TextStyle(
                                fontSize: TextSizes.notice,
                                color: AppColors.purple),
                          )),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 3.85,
                          child: Text(
                            data.address,
                            //'close :10:00',
                            style: TextStyle(
                                fontSize: TextSizes.notice,
                                color: AppColors.purple),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
 */
