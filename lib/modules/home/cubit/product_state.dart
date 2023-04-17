part of 'product_cubit.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class OnLoadingGetDataProduct extends ProductState {}

class OnErrorGetDataProduct extends ProductState {
  final int? errorCode;
  final List<dynamic>? errorMessage;

  OnErrorGetDataProduct({
    this.errorCode,
    this.errorMessage,
  });
}

class OnSuccessGetDataProduct extends ProductState {
  final ProductModel? data;

  OnSuccessGetDataProduct({this.data});
}
