import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/rounded_icon_btn.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/models/product_resp.dart';
import 'package:shop_app/data/demo/Product.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color_dots.dart';
import 'product_description.dart';
import 'product_images.dart';
import 'top_rounded_container.dart';

class Body extends StatelessWidget {
  const Body({super.key, required this.product});

  final ProductResp product;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ProductImages(product: product),
          TopRoundedContainer(
              marginTop: 30,
              color: Colors.white,
              child: Column(
                children: [
                  ProductDescription(
                    product: product,
                    press: () {},
                  ),
                  TopRoundedContainer(
                      marginTop: 10,
                      color: Color(0xFFF6F7F9),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ColorDots(product: product),
                          TopRoundedContainer(
                              color: Colors.white,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.screenWidth * 0.15,
                                  right: SizeConfig.screenWidth * 0.15,
                                  top: getProportionateScreenWidth(15),
                                  bottom: getProportionateScreenWidth(40),
                                ),
                                child: DefaultButton(
                                    text: "Add to cart", press: () {}),
                              ),
                              marginTop: 1)
                        ],
                      ))
                ],
              ))
        ],
      ),
    );
  }
}
