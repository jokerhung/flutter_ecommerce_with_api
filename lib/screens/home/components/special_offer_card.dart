import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    super.key,
    required this.category,
    required this.image,
    required this.numOfBrands,
    required this.press,
  });

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
    //   child: SizedBox(
    //     width: getProportionateScreenWidth(242),
    //     height: getProportionateScreenHeight(100),
    //     child: ClipRRect(
    //       borderRadius: BorderRadius.circular(20),
    //       child: Stack(
    //         children: [
    //           Image.asset(
    //             image,
    //             fit: BoxFit.cover,
    //           ),
    //           Container(
    //             decoration: BoxDecoration(
    //                 gradient: LinearGradient(
    //                     begin: Alignment.topCenter,
    //                     end: Alignment.bottomCenter,
    //                     colors: [
    //                   Color(0xFF343434).withOpacity(0.4),
    //                   Color(0xFF343434).withOpacity(0.15),
    //                 ])),
    //           ),
    //           Padding(
    //             padding: EdgeInsets.symmetric(
    //                 horizontal: getProportionateScreenWidth(15),
    //                 vertical: getProportionateScreenWidth(10)),
    //             child: Text.rich(
    //                 TextSpan(style: TextStyle(color: Colors.white), children: [
    //               TextSpan(
    //                   text: "$category\n",
    //                   style: TextStyle(
    //                       fontSize: getProportionateScreenWidth(18),
    //                       fontWeight: FontWeight.bold)),
    //               TextSpan(text: "$numOfBrands brands")
    //             ])),
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Container(
        height: getProportionateScreenHeight(50),
        padding: EdgeInsets.only(left: getProportionateScreenWidth(20), right: getProportionateScreenWidth(20)),
        decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        kPrimaryColor.withOpacity(0.4),
                        kPrimaryColor.withOpacity(0.05),
                      ])),
        child: Row(
          children: [
            Text(
              "$category",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(18),
                fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
