import 'package:farha_app/helper/AppColors.dart';
import 'package:farha_app/helper/TextSizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeGridCard extends StatelessWidget {
  HomeGridCard({
    @required this.image,
    @required this.icon,
    @required this.title,
    @required this.onTap,
  })  : assert(image != null),
        assert(icon != null),
        assert(title != null),
        assert(onTap != null);

  final String image;
  final String icon;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 130,
        width: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: kElevationToShadow[4],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: kElevationToShadow[3],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                    child: Image.asset(
                      image,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(title,style: TextStyle(
                  color: AppColors.purple,
                  fontWeight: FontWeight.w200,
                  fontSize: TextSizes.smallText


                ),),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                    width: 45,
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.purple,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(4.0),
                    child: Align(
                      child: Center(
                        child: Image.asset(
                          icon,
                          width: 30,
                          height: 30,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
