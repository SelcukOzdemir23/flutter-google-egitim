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
  late TextEditingController controller;

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

  void yeniOgrenciEkle(String yeniOgrenci) {
    setState(() {
      ogrenciler.add(yeniOgrenci);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Sinif(
          sinif: sinif, baslik: baslik, ogrenciler: ogrenciler, yeniOgrenciEkle: yeniOgrenciEkle),
    );
  }
}

class Sinif extends StatelessWidget {
  const Sinif({
    super.key,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  });

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // sağ ve sol ile alakalı
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.red),
            Text('$sinif. Sınıf', textScaleFactor: 2),
            Icon(Icons.star)
          ],
        ),
        Text(baslik, textScaleFactor: 1.5),
        OgrenciListesi(ogrenciler: ogrenciler),
        OgrenciEkleme(yeniOgrenciEkle: yeniOgrenciEkle)
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {
  const OgrenciEkleme({
    super.key,
    required this.yeniOgrenciEkle,
  });

  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  @override
  State<OgrenciEkleme> createState() => _OgrenciEklemeState();
}

class _OgrenciEklemeState extends State<OgrenciEkleme> {
  final controller = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          onChanged: (value) {
            setState(() {});
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: ElevatedButton(
              onPressed: controller.text.isEmpty
                  ? null
                  : () {
                      final yeniOgrenci = controller.text;
                      widget.yeniOgrenciEkle(yeniOgrenci);
                      controller.text = "";
                      // setState(() {
                      //ogrenciler.add(controller.text);hey
                      //});
                    },
              child: Text("Ekle")),
        ),
        SizedBox(
          width: 100,
          height: 200,
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 50,
                    height:100,
                    color: Colors.red,
                    child: Center(
                      child: Text(
                          "A",

                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    super.key,
    required this.ogrenciler,
  });

  final List<String> ogrenciler;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final o in ogrenciler) Text(o),
      ],
    );
  }
}
