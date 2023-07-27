import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:new_pro/constants/my_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = "";
  var answer = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(

            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    SizedBox(
                      height: 45,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          //you can remove this Row
                          Row(
                            children: [
                              Center(child: Text("Ashwin Calculator", style: TextStyle(fontSize: 20, color: Colors.white),))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                userInput.toString(),
                                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w400,color: Colors.white),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal:15 ),
                            child: Text(
                              answer.toString(),
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Row(
                                children: [
                                  MYButton(
                                    title: "AC",
                                    onPress: () {
                                      userInput = " ";
                                      answer = "";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "+/-",
                                    onPress: () {
                                      userInput += "+/-";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "%",
                                    onPress: () {
                                      userInput += "%";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "/",
                                    color: Colors.orange,
                                    onPress: () {
                                      userInput += "/";
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MYButton(
                                    title: "7",
                                    onPress: () {
                                      userInput += "7";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "8",
                                    onPress: () {
                                      userInput += "8";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "9",
                                    onPress: () {
                                      userInput += "9";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "x",
                                    color: Colors.orange,
                                    onPress: () {
                                      userInput += "*";
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MYButton(
                                    title: "4",
                                    onPress: () {
                                      userInput += "4";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "5",
                                    onPress: () {
                                      userInput += "5";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "6",
                                    onPress: () {
                                      userInput += "6";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "-",
                                    color: Colors.orange,
                                    onPress: () {
                                      userInput += "-";
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MYButton(
                                    title: "1",
                                    onPress: () {
                                      userInput += "1";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "2",
                                    onPress: () {
                                      userInput += "2";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "3",
                                    onPress: () {
                                      userInput += "3";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "+",
                                    color: Colors.orange,
                                    onPress: () {
                                      userInput += "+";
                                      setState(() {});
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  MYButton(
                                    title: "0",
                                    onPress: () {
                                      userInput += "0";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: ".",
                                    onPress: () {
                                      userInput += ".";
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "DEL",
                                    onPress: () {
                                      userInput = userInput.substring(0, userInput.length - 1);
                                      setState(() {});
                                    },
                                  ),
                                  MYButton(
                                    title: "=",
                                    color: Colors.orange,
                                    onPress: () {
                                      equalPress();
                                      setState(() {

                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }

  void equalPress(){
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll("x", "*");

    Parser p = Parser();
    Expression expression = p.parse(userInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }

}
