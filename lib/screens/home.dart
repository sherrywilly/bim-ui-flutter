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
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

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
                    newMethod("height", _heightController),
                    newMethod("weight", _weightController),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    double _h = double.parse(_heightController.text);
                    double _w = double.parse(_weightController.text);
                    print(_bmiResult = _w / (_h * _h));

                    setState(() {
                      _bmiResult = _w / (_h * _h);
                      if (_bmiResult > 25) {
                        _textResult = "you\'re over weight";
                      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                        _textResult = "you have normal weight";
                      } else {
                        _textResult = "you\'re under weight";
                      }
                    });
                  },
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
                  height: 30,
                ),
                Container(
                  child: Text(
                    _bmiResult.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 90,
                      color: accentHexColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    child: Text(
                      _textResult,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor,
                      ),
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
                  height: 10,
                ),
                RightBar(barWidth: 40),
                SizedBox(
                  height: 30,
                ),
                RightBar(barWidth: 30)
              ],
            ),
          )),
    );
  }

  Container newMethod(String txthint, TextEditingController _ctr) {
    return Container(
      width: 130,
      child: TextField(
        controller: _ctr,
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
