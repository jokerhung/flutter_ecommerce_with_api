import 'package:flutter/material.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/models/product_resp.dart';
import 'package:shop_app/data/demo/Product.dart';
import 'package:shop_app/size_config.dart';

class ColorDots extends StatelessWidget {
  const ColorDots({
    super.key,
    required this.product,
  });

  final ProductResp product;

  @override
  Widget build(BuildContext context) {
    int selectedColor = 0;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          ...List.generate(
              product.colors!.length,
              (index) => ColorDot(
                  color: product.colors![index],
                  isSelected: selectedColor == index)),
          Spacer(),
          RoundedIconBtn(iconData: Icons.remove, press: () {}),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(iconData: Icons.add, press: () {}),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      decoration: BoxDecoration(
          //color: product.colors[0],
          shape: BoxShape.circle,
          border: Border.all(
              color: isSelected ? kPrimaryColor : Colors.transparent)),
      child: DecoratedBox(
          decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
    );
  }
}
