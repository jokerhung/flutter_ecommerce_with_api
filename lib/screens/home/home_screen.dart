import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/custom_bottom_nav_bar.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/repositories/category_api.dart';
import 'package:shop_app/data/repositories/product_api.dart';
import 'package:shop_app/enums.dart';
import 'package:shop_app/data/demo/Product.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/screens/home/components/categories.dart';
import 'package:shop_app/screens/home/components/discount_banner.dart';
import 'package:shop_app/screens/home/components/home_header.dart';
import 'package:shop_app/screens/home/components/popular_product.dart';
import 'package:shop_app/screens/home/components/product_best.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/screens/home/components/special_offer.dart';
import 'package:shop_app/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(ProductApi(), CategoryApi())..add(LoadDataEvent()),
      child: Scaffold(
        body: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            // TODO: implement listener
            if(state.errorMessage != "") {
              ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
                content: Text(state.errorMessage),
              ),
            );
            }
          },
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return RefreshIndicator(
                onRefresh: () async {
                  context.read<HomeBloc>().add(LoadDataEvent());
                },
                child: SafeArea(
                  child: Column(
                    children: [
                      HomeHeader(),
                      Expanded(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            SizedBox(height: getProportionateScreenHeight(20)),
                            DiscountBanner(),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            Categories(),
                            SizedBox(height: getProportionateScreenHeight(20)),
                            SpecialOffer(),
                            ProductBest()
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
      ),
    );
  }
}
