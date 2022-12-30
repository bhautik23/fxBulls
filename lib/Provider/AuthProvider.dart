import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:fxbulls/Share/DashBorad.dart';
import 'package:fxbulls/main.dart';
import 'package:get/get.dart';

class AuthProvider extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  Dio dio = Dio();
  login() async {
    final res =
        await dio.post("https://myfxbulls.com/backend/api/signin", data: {
      "email": email.text,
      "password": pass.text,
      "fcm_token": "",
    });

    if (res.statusCode == 200) {
      print("Success");
      print("${res.data['Token']['token']}");
      dataStorage.write("token", res.data['Token']['token']);
      dataStorage.write("userid", res.data['Token']['userid']);
      print("datastorage" + dataStorage.read("token").toString());
      Get.to(Dash_Borad());
    }
  }
}

class AuthProviderRegister extends GetxController {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  Dio dio = Dio();
  Redister() async {
    final res =
        await dio.post("https://myfxbulls.com/backend/api/signin", data: {
      "email": _email.text,
      "password": _password.text,
      "fcm_token": "",
    });

    if (res.statusCode == 200) {
      print("Success");
      print("${res.data['Token']['token']}");
      dataStorage.write("token", res.data['Token']['token']);
      dataStorage.write("userid", res.data['Token']['userid']);
      print("datastorage" + dataStorage.read("token").toString());
    }
  }
}

class AuthRes extends GetxController {
  Dio dio = Dio();
  RxList broker_data = [].obs;
  // RxInt page = 0.obs;
  RxList broker_page = [].obs;
  RxInt page = 1.obs;
  urlData_response() async {
    broker_page.value.add(page);
    print("Body without------>${broker_page}");
    try {
      broker_page.refresh();
      print(broker_page);
      final res = await dio.post("https://myfxbulls.com/backend/api/brokers",
          data: {
            "token": dataStorage.read("token"),
            "page": page.toInt(),
            "limit": 12
          });
      print("{res.statusCode}");
      if (res.statusCode == 200) {
        print("=========${res.data["Response"]}");
        broker_data.addAll(res.data['Response']);
        // print(broker_data);
        broker_data.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}

// void _firstLoad() async {
//   setState(() {
//     _isFirstLoadRunning = true;
//   });
//   try {
//     final res =
//     await http.get(Uri.parse("$_baseUrl?_page=$_page&_limit=$_limit"));
//     setState(() {
//       _posts = json.decode(res.body);
//     });
//   } catch (err) {
//     if (kDebugMode) {
//       print('Something went wrong');
//     }
//   }
//
//   setState(() {
//     _isFirstLoadRunning = false;
//   });
// }

class AuthTrading extends GetxController {
  RxList selected = [].obs;

  Dio dio = Dio();
  RxList trading = [].obs;
  filter_trading() async {
    try {
      final res = await dio.post(
          "https://myfxbulls.com/backend/api/tradingplatform",
          data: {"token": dataStorage.read("token")});
      print("${res.statusCode}");
      if (res.statusCode == 200) {
        // print("=========${res.data["Response"]}");
        trading.value = res.data['Response'];
        print(trading);
        trading.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}

class AuthPayment extends GetxController {
  RxList selected = [].obs;
  Dio dio = Dio();
  RxList payment = [].obs;
  filter_payment() async {
    try {
      final res = await dio.post("https://myfxbulls.com/backend/api/payment",
          data: {"token": dataStorage.read("token")});
      print("${res.statusCode}");
      if (res.statusCode == 200) {
        // print("=========${res.data["Response"]}");
        payment.value = res.data['Response'];
        print(payment);
        payment.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}

class AuthRegulation extends GetxController {
  RxList selected = [].obs;
  Dio dio = Dio();
  RxList regulation = [].obs;
  filter_regulation() async {
    try {
      final res = await dio.post("https://myfxbulls.com/backend/api/regulation",
          data: {"token": dataStorage.read("token")});
      print("${res.statusCode}");
      if (res.statusCode == 200) {
        // print("=========${res.data["Response"]}");
        regulation.value = res.data['Response'];
        print(regulation);
        regulation.refresh();
      }
    } catch (e) {
      print(e);
    }
  }
}
