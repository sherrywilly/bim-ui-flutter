import 'package:hexcolor/hexcolor.dart';
import 'package:testflutter/constants/app_constants.dart';
import 'package:testflutter/widgets/left_bar.dart';
import 'package:testflutter/widgets/right_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Text(
                "BMI Calculator",
                style: TextStyle(
                    color: accentHexColor, fontWeight: FontWeight.w300),
              ),
            ),
            backgroundColor: mainHexColor,
            elevation: 0,
          ),
          backgroundColor: mainHexColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    newMethod("height"),
                    newMethod("weight"),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "calculate",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  child: Text(
                    "10",
                    style: TextStyle(
                      fontSize: 90,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  child: Text(
                    "Normal weight",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                LeftBar(barWidth: 40),
                SizedBox(
                  height: 20,
                ),
                LeftBar(barWidth: 60),
                SizedBox(
                  height: 20,
                ),
                LeftBar(barWidth: 30),
                SizedBox(
                  height: 20,
                ),
                RightBar(barWidth: 40),
                SizedBox(
                  height: 50,
                ),
                RightBar(barWidth: 30)
              ],
            ),
          )),
    );
  }

  Container newMethod(String txthint) {
    return Container(
      width: 130,
      child: TextField(
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w300,
          color: accentHexColor,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: txthint,
          hintStyle: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
