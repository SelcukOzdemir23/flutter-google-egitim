import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){

}

class MyApp extends StatelessWidget{
  MyApp(){
    print("My App Oluşuyor");
  }

  @override
  Widget build(BuildContext context) {
    print("build method");
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue;
      ),
      home: MyHomePage(title),
    );
  }
}