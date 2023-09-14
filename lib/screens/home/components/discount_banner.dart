import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15)
      ),
      width: double.infinity,
      //height: 90,
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Text.rich(
        TextSpan(
          text: "A Summer Surpise\n",
          style: TextStyle(
            color: Colors.white,
          ),
          children: [
            TextSpan(
              text: "Cashback 2%",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              )
            )
          ]
        )
      )
    );
  }
}