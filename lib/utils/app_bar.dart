import 'package:flutter/material.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

PreferredSizeWidget AppBarTextTitleNoElevation(
  context, {
  required String text,
  void Function()? onTapLeading,
  List<Widget>? action,
  bool? canBack,
  bool? isCenter,
  Color? backgroundColor,
  Color? textColor,
}) {
  return AppBar(
    elevation: 0,
    leading: canBack == true
        ? InkWell(
            onTap: onTapLeading ??
                () {
                  Navigator.pop(context);
                },
            child: const Icon(
              Icons.arrow_back,
              color: neutral80,
            ),
          )
        : Container(),
    backgroundColor: backgroundColor ?? Colors.white,
    actions: action,
    title: Text(
      text,
      style: textMedium(color: textColor ?? neutral90, isBold: true),
    ),
    centerTitle: isCenter ?? false,
  );
}
