import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/product_card.dart';
import 'package:shop_app/data/demo/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/size_config.dart';

import 'product_skelton.dart';
import 'section_title.dart';

class ProductBest extends StatelessWidget {
  const ProductBest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Column(
          children: [
            SectionTitle(text: "Products", press: () {}),
            Padding(
              padding: EdgeInsets.only(top: getProportionateScreenHeight(20)),
              child: state.isLoading ? 
                GridView.count(
                  childAspectRatio: 0.68,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  children: [
                    ...List.generate(4, (index) => ProductSkelton())
                  ],
                )
              : GridView.count(
                childAspectRatio: 0.68,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                shrinkWrap: true,
                children: [
                  ...List.generate(
                      state.listProduct.length,
                      (index) => ProductCard(
                            width: 140,
                            aspectRadio: 1.02,
                            product: state.listProduct[index],
                            press: () => Navigator.pushNamed(
                              context, 
                              DetailsScreen.routeName,
                              arguments: ProductDetailsArguments(product: state.listProduct[index])
                            ),
                          ))
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
