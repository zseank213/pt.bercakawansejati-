import 'package:flutter/material.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

Widget ProductCard({
  required BuildContext context,
  required DatumProduct data,
  required int index,
  required TextEditingController controller,
  required void Function() onTapPlus,
  required void Function() onTapMinus,
}) {
  return Card(
    margin: EdgeInsets.zero,
    child: Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Image.network(
            "https://recruitment.pt-bks.com/assets/${data.name}.png",
            width: 100,
            height: 100,
          ),
          AppDimens.verticalSpace12,
          Text(
            data.name ?? '',
            style: textNormal(color: neutral90, isBold: true),
          ),
          Row(
            children: [
              InkWell(
                onTap: onTapPlus,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "+",
                      style: textNormal(color: neutral30),
                    ),
                  ),
                ),
              ),
              AppDimens.horizontalSpace8,
              Expanded(
                child: Container(
                  height: 30,
                  child: TextFormField(
                    decoration: textInputDecoration(),
                    style: textSmall(
                      color: neutral80,
                    ),
                    textAlign: TextAlign.center,
                    controller: controller,
                    readOnly: true,
                  ),
                ),
              ),
              AppDimens.horizontalSpace8,
              InkWell(
                onTap: onTapMinus,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      "-",
                      style: textNormal(color: neutral30),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
