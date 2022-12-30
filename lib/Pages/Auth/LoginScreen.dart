import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fxbulls/Pages/HomePage/HomeScreen.dart';
import 'package:fxbulls/Provider/AuthProvider.dart';
import 'package:fxbulls/Share/DashBorad.dart';
import 'package:fxbulls/main.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _ct=Get.put(AuthProvider());
  final fromKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Form(
          key: fromKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Skip".toUpperCase(),
                      style: GoogleFonts.rubik(fontSize: 16, color: color),
                    ),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Let's Sign You In.",
                  style: GoogleFonts.rubik(
                      fontSize: 23, color: color, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 7,
                ),
                Text(
                  "To Continue, first Verify that it's You.",
                  style: GoogleFonts.rubik(fontSize: 18, color: color),
                ),
                SizedBox(
                  height: 80,
                ),
                Text(
                  " Email Address",
                  style: GoogleFonts.rubik(fontSize: 20, color: color),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _ct.email,
                      validator: (value) {
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value!)) {
                          return 'Enter correct email!';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      cursorColor: color,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  " Password",
                  style: GoogleFonts.rubik(fontSize: 20, color: color),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: Get.height * 0.07,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: TextFormField(
                      controller: _ct.pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter New Password";
                        } else if (value.length < 8) {
                          return "Password must be atleast 8 characters long";
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      cursorHeight: 20,
                      cursorColor: color,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 10)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Forgot Passord",
                    style: GoogleFonts.rubik(
                        fontSize: 20, color: color, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  height: 60,
                  width: Get.width * 0.9,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: color,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () {
                      if (fromKey.currentState!.validate()) {
                        _ct.login();
                        dataStorage.write('isLogged', true);
                        // Get.to(Dash_Borad());
                        // print("sucessfully");
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => LoginScreen(),
                        // ));
                      } else {
                        // Flushbar(
                        //   title: "Invaild form",
                        //   message: "Please complete the form properly",
                        //   duration: Duration(seconds: 9),
                        // ).show(context);
                        return null;
                      }
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.rubik(fontSize: 21, color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
