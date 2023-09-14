import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.text, required this.press,
  });

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.black
            ),
          ),
          GestureDetector(
            onTap: press,
            child: Text(
              "See more",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(14),
                color: Colors.black
              ),
            ),
          ),
        ],
      ),
    );
  }
}