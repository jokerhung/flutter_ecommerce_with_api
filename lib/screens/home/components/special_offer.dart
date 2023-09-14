import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/skelton.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/screens/home/components/section_title.dart';
import 'package:shop_app/size_config.dart';

import 'special_offer_card.dart';

class SpecialOffer extends StatelessWidget {
  const SpecialOffer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(
              text: "Categories",
              press: () {},
            ),
            SizedBox(
              height: getProportionateScreenWidth(20),
            ),
            state.isLoading
                ? SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SpecialOfferSkelton(),
                        SpecialOfferSkelton(),
                        SpecialOfferSkelton(),
                        SpecialOfferSkelton(),
                      ],
                    ),
                  )
                : SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          state.listCategories.length, 
                          (index) => SpecialOfferCard(
                            category: state.listCategories[index],
                            image: "assets/images/Image Banner 2.png",
                            numOfBrands: 18,
                            press: () {},
                          )
                        ),
                      ],
                    ),
                  ),
          ],
        );
      },
    );
  }
}

class SpecialOfferSkelton extends StatelessWidget {
  const SpecialOfferSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: Skelton(
        width: getProportionateScreenWidth(200),
        height: getProportionateScreenHeight(50),
      ),
    );
  }
}
