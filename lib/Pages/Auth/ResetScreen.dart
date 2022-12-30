import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetScreen extends StatefulWidget {
  const ResetScreen({Key? key}) : super(key: key);

  @override
  State<ResetScreen> createState() => _ResetScreenState();
}

class _ResetScreenState extends State<ResetScreen> {
  final fromKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 35),
        child: Form(
          key: fromKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                height: 70,
              ),
              Text(
                "Reset your Password?",
                style: GoogleFonts.rubik(
                    fontSize: 23, color: color, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Please Enter your Email Address. You will receive a link to Create a new password via email.",
                style: GoogleFonts.rubik(fontSize: 19, color: color),
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
                    controller: email,
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!)) {
                        return 'Enter correct email!';
                      } else if (value == null || value.isEmpty) {
                        return "This field is required";
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
              SizedBox(
                height: 20,
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
                      print("sucessfully");
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => LoginScreen(),
                      // ),
                      // );
                    }
                  },
                  child: Text(
                    "Send",
                    style: GoogleFonts.rubik(fontSize: 21, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
