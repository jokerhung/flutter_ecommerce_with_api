import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/constants.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.press,
  });

  final String text, icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
          style: TextButton.styleFrom(
              padding: EdgeInsets.all(20),
              backgroundColor: Color(0xFFF5F6F9),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15))),
          onPressed: press,
          child: Row(
            children: [
              SvgPicture.asset(
                icon,
                width: 22,
                colorFilter: ColorFilter.mode(kPrimaryColor, BlendMode.srcIn),
              ),
              SizedBox(width: 20),
              Expanded(
                  child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
              Icon(Icons.arrow_forward_ios)
            ],
          )),
    );
  }
}
