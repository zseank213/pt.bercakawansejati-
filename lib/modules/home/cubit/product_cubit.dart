import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pt_berca_kawan_sejati/lib.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ProductService _ProductService = ProductService();

  void getData() async {
    emit(OnLoadingGetDataProduct());

    var res = await _ProductService.getProduct();

    if (res.statusCode == 200) {
      var _data = ProductModel.fromJson(res.data);
      debugPrint('Get Data Status : Success');

      emit(OnSuccessGetDataProduct(data: _data));
      print(_data);
      // await SecureStorage.setAccessToken(token: "");
    } else {
      var _data = ProductModel.fromJson(res.data);

      debugPrint('Get Data Status: ${res.toString()}');

      emit(
        OnErrorGetDataProduct(
          errorCode: res.statusCode,
          errorMessage: [_data.message],
        ),
      );
      // errorCode: res.statusCode, errorMessage: res.toString()));
    }
  }
}
