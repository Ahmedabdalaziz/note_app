import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomSearchIcon extends StatelessWidget {
  final IconData? icon;
  const CustomSearchIcon({super.key, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          color: kSecondColor.withOpacity(0.05),
          borderRadius: BorderRadiusDirectional.circular(10)),
      child:  Icon(icon),
    );
  }
}
