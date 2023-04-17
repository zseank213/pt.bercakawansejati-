import 'package:flutter/material.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

Widget TitleAndDetail({
  required String title,
  String? detail,
  TextAlign? textAlign,
  bool? isSpaceBetween = false,
}) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: isSpaceBetween == true
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.start,
        children: [
          Text(
            "$title",
          ),
          AppDimens.horizontalSpace8,
          Flexible(
            child: Text(
              "${detail}",
              textAlign: textAlign ?? TextAlign.end,
            ),
          ),
        ],
      ),
      AppDimens.verticalSpace6,
    ],
  );
}
