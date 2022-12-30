import 'package:flutter/material.dart';
import 'package:fxbulls/Pages/Auth/LoginScreen.dart';
import 'package:fxbulls/Pages/HomePage/HomeScreen.dart';
import 'package:fxbulls/Share/DashBorad.dart';
import 'package:fxbulls/Share/constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/Auth/ResetScreen.dart';

Future<void> main() async{
 await GetStorage.init();
 dataStorage=GetStorage();
  runApp(const MyApp());
}

GetStorage dataStorage = GetStorage();
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme:  ThemeData(
          primaryColor: Constants().primarycolor,
          scaffoldBackgroundColor: const Color(0xFFf9f9f9)),
      home: dataStorage.read("isLogged")==true?Dash_Borad():LoginScreen(),
    );
  }
}
