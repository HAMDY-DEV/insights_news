import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_style.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.height,
      this.width});
  final String text;
  final Function() onPressed;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? 40,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: AppColoes.primary,
              borderRadius: BorderRadius.circular(15)),
          child: Text(
            text,
            style: getBodyStyle(context, color: AppColoes.white),
          ),
        ),
      ),
    );
  }
}
