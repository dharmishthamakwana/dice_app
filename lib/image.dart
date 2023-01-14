import 'dart:math';

import 'package:flutter/material.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  List diceImages = [
    "assets/image/dice.png",
    "assets/image/dice(1).png",
    "assets/image/dice(2).png",
    "assets/image/dice(3).png",
    "assets/image/dice(4).png",
    "assets/image/dice(5).png",
  ];
  List l1 = [];
  List counts = [0, 0, 0, 0, 0, 0];
  int i = 0, n = 0, y = 0, z = 0, sum = 0;
  List admin = [];
  TextEditingController txtno = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Text("Dice play",
                style: TextStyle(fontSize: 25, color: Colors.black87)),
            centerTitle: true,
            backgroundColor: Colors.amber),
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: txtno,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 2)),
                    label: Text(
                      "Enter the no",
                      style: TextStyle(color: Colors.amber),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber))),
                style: TextStyle(color: Colors.amber),
              ),
              InkWell(
                onTap: () {
                  String a = txtno.text;
                  n = int.parse(a);
                  l1.clear();
                  setState(() {
                    for (i = 0; i < n; i++) {
                      l1.add(0);
                    }
                    sum = n;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                        border:
                        Border.all(color: Colors.grey.shade700, width: 2)),
                    child: Text("Creat",
                        style: TextStyle(color: Colors.black, fontSize: 25)),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: l1
                      .asMap()
                      .entries
                      .map((e) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      diceImages[l1[e.key]],
                      height: 100,
                      width: 100,
                    ),
                  ))
                      .toList(),
                ),
              ),
              InkWell(
                onTap: () {
                  l1.clear();
                  sum = 0;
                  setState(() {
                    var rnd = Random();
                    for (y = 0; y < n; y++) {
                      z = rnd.nextInt(6);
                      l1.add(z);
                      sum = sum + z + 1;
                    }
                    admin.clear();
                    admin.add(l1);
                    print("$admin");
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 125,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(8),
                        border:
                        Border.all(color: Colors.grey.shade700, width: 2)),
                    child: Text("Play   :=    $sum",
                        style: TextStyle(color: Colors.black, fontSize: 20)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 50,
              // ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (l1[1] == 1) {
                      i=1;
                    }
                    if (l1[1] == 1) {
                      i=2;
                    }
                  },
                  );
                },
                child: Text("$i"),
              )
            ],
          ),
        ),
      ),
    );
  }
}