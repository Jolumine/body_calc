import "package:flutter/material.dart"; 

import "package:body_calc/utils/colors.dart";
import "package:body_calc/screens/display.dart";  

class Input extends StatefulWidget{
  const Input({super.key}); 

  @override 
  State createState() => InputState(); 
}


class InputState extends State<Input>{
  TextEditingController ageController = TextEditingController(); 
  TextEditingController weightController = TextEditingController(); 
  TextEditingController heightController = TextEditingController(); 

  bool checkInput(){
    String a = ageController.text; 
    String w = weightController.text; 
    String h = heightController.text; 

    if(a.isEmpty || w.isEmpty || h.isEmpty){
      return false; 
    }
    else{
      return true; 
    }
  }

  @override   
  Widget build(BuildContext context){
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: green,
          child: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top+15),
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
                const Center(
                  child: Text(
                    "Body Calculator", 
                    style: TextStyle(color: grey, fontSize: 35, fontWeight: FontWeight.bold),
                  )
                ), 
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height-175,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 50, right: 50), 
                        child: TextFormField( 
                          style: const TextStyle(
                            color: grey,
                            fontSize: 18
                          ),
                          controller: ageController,
                          cursorColor: grey,
                          decoration: const InputDecoration(
                            label: Text("Age"), 
                            labelStyle: TextStyle(
                              color: grey, 
                              fontSize: 19, 
                              fontWeight: FontWeight.bold
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)), 
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                          ),
                        ), 
                      ), 
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 50, right: 50), 
                        child: TextFormField( 
                          style: const TextStyle(
                            color: grey,
                            fontSize: 18
                          ),
                          cursorColor: grey,
                          controller: weightController,
                          decoration: const InputDecoration(
                            label: Text("Bodyweight"), 
                            labelStyle: TextStyle(
                              color: grey, 
                              fontSize: 19, 
                              fontWeight: FontWeight.bold
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)), 
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                          ),
                        ), 
                      ), 
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 50, right: 50), 
                        child: TextFormField( 
                          style: const TextStyle(
                            color: grey,
                            fontSize: 18
                          ),
                          cursorColor: grey,
                          controller: heightController,
                          decoration: const InputDecoration(
                            label: Text("Height"), 
                            labelStyle: TextStyle(
                              color: grey, 
                              fontSize: 19, 
                              fontWeight: FontWeight.bold
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(50.0)), 
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: grey, width: 2), 
                            ), 
                          ),
                        ), 
                      ), 
                      Padding(
                        padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                        child: Center(
                          child: InkWell(
                            focusColor: dark,
                            onTap: (){
                              if(checkInput()){
                                Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => Display(
                                    height:double.parse(heightController.text), 
                                    weight:double.parse(weightController.text), 
                                    age:int.parse(ageController.text)
                                    )
                                  )
                                );
                              }
                              else{
                                showDialog(
                                  context: context, 
                                  builder: (BuildContext context){
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      child: Container(
                                        decoration: const BoxDecoration(
                                          color: green, 
                                          borderRadius: BorderRadius.all(Radius.circular(50))
                                        ),
                                        width: 150,
                                        height: 130,
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 10, right: 30, left: 30, bottom: 10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: const <Widget>[
                                                  Icon(Icons.error, size: 30, color: grey), 
                                                  SizedBox(width: 10),
                                                  Text("Error", style: TextStyle(color: grey, fontSize: 25))
                                                ],
                                              ),
                                            ), 
                                            const Padding(
                                              padding: EdgeInsets.only(left: 30, right: 30),
                                              child: Text("Please fill everything", style: TextStyle(color: grey, fontSize: 20))
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 6),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  TextButton(
                                                    onPressed: (){
                                                      Navigator.pop(context); 
                                                    }, 
                                                    child: const Center(child: Text("OK", style: TextStyle(fontSize:20, color: grey)))
                                                  )
                                                ]
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                );
                              }
                            },
                            child: Container(
                              width: 150,
                              height: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: grey),
                                borderRadius: const BorderRadius.all(Radius.circular(50.0))

                              ),
                              child: const Center(
                                child: Text(
                                  "Calculate", 
                                  style: TextStyle(color: grey, fontSize: 20),
                                )
                              ),
                            ),
                          )
                        ),
                      )
                    ]
                  )
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}