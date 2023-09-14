import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/icon_btn_with_counter.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/size_config.dart';

import '../../../components/search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
              vertical: getProportionateScreenHeight(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SearchField(),
              IconBtnWithCounter(
                svgIcon: "assets/icons/Cart Icon.svg",
                numOfItems: 0,
                press: () {
                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
              IconBtnWithCounter(
                svgIcon: "assets/icons/Bell.svg",
                numOfItems: 3,
                press: () {},
              ),
            ],
          ),
        );
      },
    );
  }
}
