import "dart:math";
import "dart:io"; 

import "package:body_calc/utils/colors.dart";
import "package:flutter/material.dart";

class Display extends StatefulWidget {  
  final double height; 
  final double weight; 
  final int age; 
  const Display({required this.height, required this.weight, required this.age, super.key});

  @override
  State<Display> createState() => DisplayState();
}

class DisplayState extends State<Display> {
  late int age; 
  late double height, weight; 
  late String bmi, bc; 


  @override
  void initState() {
    super.initState();
    age = widget.age; 
    height = widget.height; 
    weight = widget.weight; 
    bmi = calcBMI(weight, height); 
    bc = calcBC(weight, height, age); 
  } 

  String calcBMI(double w, double h){
    return (w/(pow(h, 2))*10000).toStringAsFixed(1);
  }

  String calcBC(double w, double h, int a){
    // (655.1+(9.6*weight)+(1.8*height)-(4.7*age)).toStringAsFixed(2) => women
    return (66.47+(13.7*weight)+(5*height)-(6.8*age)).toStringAsFixed(2); 
  }

  String getStatus(double bmi){
    return ""; 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            color: green
          ),
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+15), 
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Center(
                  child: Text("Results", style: TextStyle(color: grey, fontSize: 35, fontWeight: FontWeight.bold),),
                ), 
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 650,
                  decoration: const BoxDecoration(
                    color: blue,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(50.0), topRight: Radius.circular(50.0)), 
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 3), 
                        color: blue, 
                        blurRadius: 50
                      )
                    ]
                  ),
                  child: Column(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 15),
                        child: Text("Body-Mass Index", style: TextStyle(color: grey, fontSize: 19),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          width: MediaQuery.of(context).size.width-130,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 2),
                            borderRadius: const BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Center(child: Text(bmi, style: const TextStyle(color: grey, fontSize: 18),)),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 15),
                        child: Text("Basic Consumption", style: TextStyle(color: grey, fontSize: 19),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          width: MediaQuery.of(context).size.width-130,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(color: grey, width: 2),
                            borderRadius: const BorderRadius.all(Radius.circular(50.0))
                          ),
                          child: Center(child: Text("$bc kcal", style: const TextStyle(color: grey, fontSize: 18)))
                        ),
                      ), 
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50), 
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: grey, 
                            borderRadius: const BorderRadius.all(Radius.circular(50.0)), 
                            border: Border.all(color: grey, width: 2)
                          ),
                          child: InkWell(
                            onTap: () => exit(0),
                            child: const Center(child: Text("Exit", style: TextStyle(color: blue, fontSize: 25, fontWeight: FontWeight.bold)))
                          )
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}