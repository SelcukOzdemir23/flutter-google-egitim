import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late TextEditingController  controller;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }
  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  var sinif = 5;
  var baslik = "Öğrenciler";
  var ogrenciler = ["Ali", "Ayşe", "Can"];

  @override
  Widget build(BuildContext context) {

    // ogrenciler.add("MEmati"); //buildin içine yapma yeğenim
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 600,
              height: 100,
              child: TextField(
                obscureText: true,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter a search terme",
                  suffixIcon: Icon(Icons.access_alarms_sharp),
                ),
              ),
            ),
            Text('$sinif. Sınıf', textScaleFactor: 2),
            Text(baslik, textScaleFactor: 1.5),
            for (final o in ogrenciler) Text(o),
            ElevatedButton(onPressed: (){
              setState(() {
                ogrenciler.add(controller.text);
              });
            },
                child: Text("Ekle"))
          ],
        ),
      ),
    );
  }
}
