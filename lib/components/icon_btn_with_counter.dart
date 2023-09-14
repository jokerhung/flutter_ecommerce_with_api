import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconBtnWithCounter extends StatelessWidget {
  const IconBtnWithCounter({
    super.key, required this.svgIcon, required this.numOfItems, required this.press,
  });

  final String svgIcon;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        clipBehavior: Clip.none,
        children:[
          Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(12)),
            height: getProportionateScreenWidth(46),
            width: getProportionateScreenWidth(46),
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              shape: BoxShape.circle
            ),
            child: SvgPicture.asset(svgIcon),
          ),
          if(numOfItems > 0)
          Positioned(
            right: 0,
            top: -3,
            child: Container(
              height: getProportionateScreenWidth(16),
              width: getProportionateScreenWidth(16),
              decoration: BoxDecoration(
                 color: Color(0xFFFF4848),
                 shape: BoxShape.circle,
                 border: Border.all(width: 1.5, color: Colors.white)
              ),
              child: Center(
                child: Text(
                  "$numOfItems", 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(10),
                    height: 1,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),
          )
        ] 
      ),
    );
  }
}