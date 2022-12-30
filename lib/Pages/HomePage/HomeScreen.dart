import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fxbulls/Pages/HomePage/ShowBroker.dart';
import 'package:fxbulls/Provider/AuthProvider.dart';
import 'package:fxbulls/Share/Widget.dart';
import 'package:fxbulls/main.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _broker = Get.put(AuthRes());
  // final _trading = Get.put(AuthTrading());
  final _ct = Get.put(AuthProvider());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(_scrollerLister);
    _broker.urlData_response();
    // _trading.filter_trading();
  }

  TextEditingController search = TextEditingController();
  ScrollController _controller = ScrollController();
  var genrateed_token = "";
  bool isLodded = false;
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    genrateed_token = dataStorage.read("token").toString();
    print(genrateed_token);
    // final brokerlength = _broker.broker_data[0]["Response"];
    return Scaffold(
      body: SingleChildScrollView(
        controller: _controller,
        child: Container(
          padding: EdgeInsets.only(top: 30, right: 10, left: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: SizedBox(
                      child: Card(
                        color: Colors.grey.withOpacity(.1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          controller: search,
                          cursorHeight: 20,
                          cursorColor: color,
                          decoration: InputDecoration(
                              hintText: "Search",
                              prefixIcon: Icon(
                                Icons.search,
                                color: color,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 12)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Icon(
                      Icons.notification_add_outlined,
                      color: color,
                    ),
                  ),
                ],
              ),
              Container(
                height: 230,
                child: Stack(
                  children: [
                    SizedBox(
                      height: 180,
                      width: Get.width,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        color: Color(0xffe1e5ee),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16, vertical: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Honest reviews on",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "MyFXBulls",
                                style: GoogleFonts.rubik(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                child: Container(
                                  height: 40,
                                  width: 120,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    color: color,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "View Now",
                                        style: GoogleFonts.rubik(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        height: 70,
                        width: Get.width,
                        child: Card(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffdde0f9)
                                              .withOpacity(.5)),
                                      child: Icon(Icons.person,
                                          color: Color(0xff434dc4)),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.015,
                                        ),
                                        Text(
                                          // _broker.broker_data[0]["Total Brokers Count"].toString(),
                                          "7899",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Brokers",
                                          style:
                                              TextStyle(color: Colors.black38),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      height: Get.height * 0.05,
                                      width: Get.width * 0.12,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xffdff2f2)
                                              .withOpacity(.3)),
                                      child: Icon(
                                        Icons.person,
                                        color: Color(0xff33b59b),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.02,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.015,
                                        ),
                                        Text(
                                          "8942",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Users",
                                          style:
                                              TextStyle(color: Colors.black38),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 60,
                width: Get.width,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Forex Brokers",
                    style: GoogleFonts.rubik(
                        fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      // _trading.filter_trading();
                      Get.to(ShowBroker());
                    },
                    child: Text(
                      "Show all",
                      style: GoogleFonts.rubik(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => ListView.builder(
                  // controller: _controller,
                  itemCount: _broker.broker_data.length,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.only(bottom: 0, top: 5),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return borkerWidget(
                      indx: index,
                    );
                    return Container(
                      child: Text(index.toString()),
                    );
                  },
                ),
              )
              // Marquee(
              //   text: 'Some sample text that takes some space.',
              //   style: TextStyle(fontWeight: FontWeight.bold),
              //   scrollAxis: Axis.horizontal,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   blankSpace: 20.0,
              //   velocity: 100.0,
              //   pauseAfterRound: Duration(seconds: 1),
              //   startPadding: 10.0,
              //   accelerationDuration: Duration(seconds: 1),
              //   accelerationCurve: Curves.linear,
              //   decelerationDuration: Duration(milliseconds: 500),
              //   decelerationCurve: Curves.easeOut,
              // )
            ],
          ),
        ),
      ),
    );
  }

  void _scrollerLister() async {
    print("Scroller Lister");
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      _broker.page++;
      _broker.broker_data != null
          ? _broker.urlData_response()
          : Center(
              child: CircularProgressIndicator.adaptive(),
            );
      setState(() {});
      print("call");
    } else {
      print("Don't call");
    }
  }
  // void _firstLoad() async {
  //   setState(() {
  //     _isFirstLoadRunning = true;
  //   });
  //   try {
  //     final res =
  //     await http.post(Uri.parse("https://myfxbulls.com/backend/api/brokers"));
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

}
