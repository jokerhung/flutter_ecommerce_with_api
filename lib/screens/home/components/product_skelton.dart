import 'package:flutter/material.dart';
import 'package:shop_app/components/skelton.dart';
import 'package:shop_app/size_config.dart';

class ProductSkelton extends StatelessWidget {
  const ProductSkelton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(140),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Skelton(
              width: 140,
              height: 140,
            ),
            Skelton(
              width: 140,
              height: 10,
            ),
            Skelton(
              width: 100,
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Skelton(
                  width: 80,
                  height: 10,
                ),
                Skelton(
                  width: 20,
                  height: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
