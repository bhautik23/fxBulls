import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fxbulls/Pages/HomePage/HomeScreen.dart';
import 'package:fxbulls/Provider/AuthProvider.dart';

class Dash_Borad extends StatefulWidget {
  const Dash_Borad({Key? key}) : super(key: key);

  @override
  State<Dash_Borad> createState() => _Dash_BoradState();
}

class _Dash_BoradState extends State<Dash_Borad> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget screen= HomeScreen();
  int ind=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: ind,selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Color(0xff989EA6),

        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 13,
        onTap: (i){
          setState(() {
            ind =i;
            i==0?
            screen=HomeScreen()
                :null;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.person,
                size: 25,
              ),
              label: "Broker",),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.star_circle,),
              label: "Reviews",),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.news,
                  size: 25),
              label: "News"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cast_for_education,
                  size: 25,),
              label: "Education",),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.settings,
                  size: 25,),
              label: "Setting",)
        ],
      ),
    );
  }
}