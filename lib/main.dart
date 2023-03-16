import "package:flutter/material.dart"; 
import "package:body_calc/screens/input.dart"; 

void main() => runApp(const App()); 


class App extends StatelessWidget{
  const App({super.key}); 

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Body Calculator", 
      home: Input()
    );
  }
}