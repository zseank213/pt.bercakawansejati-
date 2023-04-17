// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.success,
    this.message,
    this.data,
  });

  bool? success;
  String? message;
  List<DatumProduct>? data;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? [] : List<DatumProduct>.from(json["data"]!.map((x) => DatumProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class DatumProduct {
  DatumProduct({
    this.id,
    this.name,
    this.qty,
    this.price,
    this.isActive,
    this.maxOrderQty,
  });

  int? id;
  String? name;
  int? qty;
  int? price;
  bool? isActive;
  int? maxOrderQty;

  factory DatumProduct.fromJson(Map<String, dynamic> json) => DatumProduct(
        id: json["id"],
        name: json["name"],
        qty: json["qty"],
        price: json["price"],
        isActive: json["is_active"],
        maxOrderQty: json["max_order_qty"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "qty": qty,
        "price": price,
        "is_active": isActive,
        "max_order_qty": maxOrderQty,
      };
}
