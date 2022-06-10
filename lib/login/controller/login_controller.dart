import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitjarus/login/model/login_request_model.dart';
import 'package:pitjarus/login/model/login_response.dart';
import 'package:pitjarus/service/dbhelper.dart';
import 'package:pitjarus/service/login_service.dart';

class LoginController extends GetxController{

  late final LoginService _loginService;

  var isLoading = false.obs;
  List? list = [];
  late final stores = List<Stores>.empty().obs;
  var status = '';

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    isLoading(false);
  }
//Login ambil data dan simpan ke sqflite
  Future<void> logintest(String username, String password) async{
    try{
      isLoading(true);
      final response = await _loginService.postTest(username,password);
      final data = response?.stores;
      stores.value = data ?? [];
      status = response?.status ?? '';
      print('status ${response?.status}');
      if (response?.status == "success"){

      }else{
        print('masuk else');
        alertSnackBar(
            "Opps!!",
            response?.message ??
                "Please check Internet or your Credentials",
            Colors.red.withOpacity(0.9));
      }
    }
    finally{
      isLoading(false);
    }
  }


  alertSnackBar(String title, String text, Color color) {
    return Get.snackbar(
      title,
      text,
      animationDuration: const Duration(seconds: 1),
      backgroundColor: color,
      colorText: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      snackPosition: SnackPosition.TOP,
    );
  }

}