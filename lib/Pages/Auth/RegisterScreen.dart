import 'package:flutter/material.dart';
import 'package:fxbulls/Pages/Auth/LoginScreen.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();
  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {},
                child: Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    "Skip".toUpperCase(),
                    style: GoogleFonts.rubik(fontSize: 16, color: color),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Create an Account",
                style: GoogleFonts.rubik(
                    fontSize: 28, color: color, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                "Enter Your detail here",
                style: GoogleFonts.rubik(fontSize: 18, color: color),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                " Email Address",
                style: GoogleFonts.rubik(fontSize: 16, color: color),
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
                    controller: email,
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
                height: 10,
              ),
              Text(
                " Password",
                style: GoogleFonts.rubik(fontSize: 16, color: color),
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
                    controller: password,
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
                height: 10,
              ),
              Text(
                " Confirm Password",
                style: GoogleFonts.rubik(fontSize: 16, color: color),
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Re-Enter New Password";
                      } else if (value!.length < 8) {
                        return "Password must be atleast 8 characters long";
                      } else if (value == password) {
                        return "Password must be same as above";
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
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      "I have accept",
                      style: GoogleFonts.rubik(
                          fontSize: 16,
                          color: color,
                          fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Terms & Conditions",
                          style: GoogleFonts.rubik(
                              color: color,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              letterSpacing: -1),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: Get.height * 0.05,
                width: Get.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    if (fromKey.currentState!.validate()) {
                      print("sucessfully");
                      fromKey.currentState!.save();
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => RegisterScreen(),
                      ));
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
                    "Register",
                    style: GoogleFonts.rubik(fontSize: 21, color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height * 0.1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have an Account?",
                    style: GoogleFonts.rubik(fontSize: 18, color: color),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: Text(
                      "Login",
                      style: GoogleFonts.rubik(
                          fontSize: 18,
                          color: color,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
