import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fxbulls/Provider/AuthProvider.dart';
import 'package:fxbulls/Share/Widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class ShowBroker extends StatefulWidget {
  const ShowBroker({Key? key}) : super(key: key);

  @override
  State<ShowBroker> createState() => _ShowBrokerState();
}

enum Fruit { most, polpulr }

class _ShowBrokerState extends State<ShowBroker> {
  Fruit? _fruit = Fruit.polpulr;
  final _broker = Get.put(AuthRes());

  TextEditingController search = TextEditingController();

  final _trading = Get.put(AuthTrading());
  final _payment = Get.put(AuthPayment());
  final _regulation = Get.put(AuthRegulation());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _trading.filter_trading();
    _payment.filter_payment();
    _regulation.filter_regulation();
    _controller.addListener(_scrollerLister);
  }

  RangeValues _currentRangeValues = RangeValues(20, 60);
  ScrollController _controller =ScrollController();
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // toolbarHeight: 20,
        centerTitle: false,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: color,
            )),
        title: Text(
          "All Brokers/ My Saved brokers",
          style: GoogleFonts.rubik(
              fontSize: 18, color: color, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 10,
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
                StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                  return Expanded(
                      child: InkWell(
                    onTap: () {
                      showModalBottomSheet<void>(
                        // isDismissible: false,
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return FractionallySizedBox(
                              heightFactor: 2.1,
                              child: Container(
                                clipBehavior: Clip.antiAlias,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Filter",
                                            style: GoogleFonts.rubik(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                color: color),
                                          ),
                                          InkWell(
                                              onTap: () {
                                                Get.back();
                                              },
                                              child: Icon(
                                                Icons.close,
                                                color: Colors.grey,
                                              ))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            "Sort By",
                                            style: GoogleFonts.rubik(
                                                fontSize: 18,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Expanded(
                                            child: RadioListTile<Fruit>(
                                              toggleable: true,
                                              title: const Text('Most Poular'),
                                              value: Fruit.most,
                                              groupValue: _fruit,
                                              onChanged: (value) {
                                                setState(() {
                                                  _fruit = value;
                                                });
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Terminals",
                                        style: GoogleFonts.rubik(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() => filterWrap(
                                          text: _trading.trading.value)),
                                      Divider(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Payment system",
                                        style: GoogleFonts.rubik(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() => filterWrap(
                                          text: _payment.payment.value)),
                                      Divider(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Regulation",
                                        style: GoogleFonts.rubik(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Obx(() => filterWrap(
                                          text: _regulation.regulation.value)),
                                      Divider(),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "Min Investment",
                                        style: GoogleFonts.rubik(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RangeSlider(
                                          activeColor: color,
                                          values: _currentRangeValues,
                                          labels: RangeLabels(
                                            _currentRangeValues.start
                                                .round()
                                                .toString(),
                                            _currentRangeValues.end
                                                .round()
                                                .toString(),
                                          ),
                                          min: 0,
                                          max: 100,
                                          inactiveColor:
                                              Colors.blueGrey.withOpacity(.8),
                                          // values: (_currentRangeValues.start,_currentRangeValues.end),
                                          onChanged: (value) {
                                            _currentRangeValues = value;
                                            setState(() {});
                                          }),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Container(
                                        height: 60,
                                        width: Get.width * 0.9,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: color,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10))),
                                          onPressed: () {},
                                          child: Text(
                                            "Apply",
                                            style: GoogleFonts.rubik(
                                                fontSize: 21,
                                                color: Colors.white),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25))),
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Icon(
                      Icons.filter_alt_outlined,
                      color: color,
                    ),
                  ));
                }),
              ],
            ),
            ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: _broker.broker_data.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return borkerWidget(
                  indx: index,
                );
              },
            )
          ],
        ),
      ),
    );
  }
  void _scrollerLister() async{
    print("Scroller Lister");
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        _broker.page++;
      _broker.urlData_response();
      setState(() {
      });
      print("call");
    } else {
      print("Don't call");
    }
  }
}
