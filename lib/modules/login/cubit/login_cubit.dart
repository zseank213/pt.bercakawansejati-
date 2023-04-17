// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:pt_berca_kawan_sejati/lib.dart';
//
// part 'login_state.dart';
//
// class LoginCubit extends Cubit<LoginState> {
//   LoginCubit() : super(LoginInitial());
//
//   final LoginService _LoginService = LoginService();
//
//   void getAuth() async {
//     emit(OnLoadingGetAuthLogin());
//
//     // try {
//     var res = await _LoginService.getLogin(
//
//     );
//     if (res.statusCode == 200) {
//       // var _data = Login.fromJson(res.data);
//       // debugPrint('Get Auth Status : Success');
//       // emit(OnSuccessGetAuthLogin(data: _data));
//       await SecureStorage.setAccessToken(token: "");
//     } else {
//       // var _data = Login.fromJson(res.data);
//
//       debugPrint('Get Auth Status: ${res.toString()}');
//
//       emit(
//         OnErrorGetAuthLogin(
//           errorCode: res.statusCode,
//           // errorMessage: _data.meta?.messages,
//         ),
//       );
//       // errorCode: res.statusCode, errorMessage: res.toString()));
//     }
//   }
// }
