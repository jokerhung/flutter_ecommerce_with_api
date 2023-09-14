import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/demo/Cart.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/body.dart';

class CartScreen extends StatelessWidget {
  static String routeName = "/cart";
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Text(
              "Your Cart",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }
}

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 174,
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30)
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.15))
          ]),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                height: getProportionateScreenWidth(40),
                width: getProportionateScreenWidth(40),
                decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10)),
                child: SvgPicture.asset("assets/icons/receipt.svg"),
              ),
              Spacer(),
              Text("Add voucher here"),
              const SizedBox(width: 10),
              Icon(
                Icons.arrow_forward_ios,
                size: 12,
                color: kTextColor,
              )
            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(TextSpan(text: "Total: \n", children: [
                TextSpan(
                    text: "\$337.15",
                    style: TextStyle(fontSize: 16, color: Colors.black))
              ])),
              SizedBox(
                width: getProportionateScreenWidth(190),
                child: DefaultButton(text: "Check Out", press: () {}),
              )
            ],
          )
        ],
      ),
    );
  }
}
