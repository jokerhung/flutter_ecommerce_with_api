import 'package:flutter/material.dart';
import 'package:shop_app/size_config.dart';

class RoundedIconBtn extends StatelessWidget {
  const RoundedIconBtn({
    super.key,
    required this.iconData,
    required this.press,
  });

  final IconData iconData;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(30),
      width: getProportionateScreenWidth(30),
      child: TextButton(
        onPressed: press,
        child: Icon(iconData),
        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50))),
      ),
    );
  }
}
