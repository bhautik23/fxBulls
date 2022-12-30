import 'package:flutter/material.dart';
import 'package:fxbulls/Provider/AuthProvider.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

class borkerWidget extends StatefulWidget {
  const borkerWidget({Key? key, required this.indx}) : super(key: key);
  final int indx;

  @override
  State<borkerWidget> createState() => _borkerWidgetState();
}

class _borkerWidgetState extends State<borkerWidget> {
  final _broker = Get.put(AuthRes());
  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Card(
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 0, left: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 60,
                    width: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              _broker.broker_data[widget.indx]["thumb"])),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Chip(
                        label: Text(
                            _broker.broker_data[widget.indx]["mindeposit"],
                            style: GoogleFonts.rubik(color: Colors.white)),
                        backgroundColor: Colors.red,
                      ),
                      Text(
                        "Min.Depoit",
                        style: GoogleFonts.rubik(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 0.0, vertical: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        _broker.broker_data[widget.indx]["name"],
                        style: GoogleFonts.rubik(),
                      ),
                      // Icon(Icons.bookmark_border)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Metatrader 4 Metatrader 5"),
                  Row(
                    children: <Widget>[
                      Icon(
                        Icons.star_rate,
                        color: Colors.amber,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "5/5",
                        style:
                            GoogleFonts.rubik(fontSize: 11, color: Colors.grey),
                      )
                    ],
                  ),
                  Text(
                    "2 Reviews",
                    style: GoogleFonts.rubik(fontSize: 12),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Chip(
                            label: Text(
                                _broker.broker_data[widget.indx]
                                    ["maxleavarage"],
                                style: GoogleFonts.rubik(color: Colors.white)),
                            backgroundColor: color,
                          ),
                          Text(
                            "Max.Shoulder",
                            style: GoogleFonts.rubik(),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 13,
                          ),
                          Icon(
                            Icons.equalizer_rounded,
                            color: Colors.red,
                            size: 30,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Min.Depoit",
                            style: GoogleFonts.rubik(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class filterWrap extends StatelessWidget {
  filterWrap({Key? key, required this.text}) : super(key: key);
  final List text;
  final _ct = Get.find<AuthTrading>();
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: text
          .map(
            (e) => InkWell(
              onTap: () {
                if (_ct.selected.any((element) => element == e['name'])) {
                  _ct.selected.remove(e['name']);
                } else {
                  _ct.selected.add(e['name']);
                }
                _ct.selected.refresh();
              },
              child: Obx(
                () => Container(
                  clipBehavior: Clip.antiAlias,
                  height: 30,
                  decoration: BoxDecoration(
                      color: _ct.selected.any((element) => element == e['name'])
                          ? Theme.of(context).primaryColor
                          : null,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor)),
                  margin: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      e['name'],
                      style: GoogleFonts.rubik(
                        fontSize: 18,
                        color:
                            _ct.selected.any((element) => element == e['name'])
                                ? Colors.white
                                : null,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
