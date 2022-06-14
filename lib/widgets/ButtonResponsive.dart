import 'package:flutter/material.dart';
import 'package:mountain_app/misc/colors.dart';

class ResponsiveButton extends StatelessWidget {
  final bool hasText;
  String thisText;
  ResponsiveButton({required this.hasText, this.thisText = ""});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.mainColor,
      ),
      width: hasText ? 270 : 100,
      height: 55,
      padding: hasText ? EdgeInsets.only(left: 20, right: 2) : null,
      child: hasText
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  thisText,
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Image(
                  image: AssetImage("img/Button Img/button-one.png"),
                ),
              ],
            )
          : Image(
              image: AssetImage("img/Button Img/button-one.png"),
            ),
    );
  }
}
