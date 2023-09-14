import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/size_config.dart';

class FormErrors extends StatelessWidget {
  const FormErrors({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(errors.length, (index) => formErrorText(error: errors[index]))
    );
  }

  Row formErrorText({required String error}) {
    return Row(
        children: [
          SvgPicture.asset(
            "assets/icons/Error.svg",
            height: getProportionateScreenWidth(14),
            width: getProportionateScreenWidth(14),
          ),
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(error)
        ],
      );
  }
}