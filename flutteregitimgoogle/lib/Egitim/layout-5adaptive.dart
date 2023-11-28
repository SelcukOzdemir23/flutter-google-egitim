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
      body: SinifBilgisi(
        sinif: sinif,
        baslik: baslik,
        ogrenciler: ogrenciler,
        yeniOgrenciEkle: yeniOgrenciEkle,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ArkaPlan(),
            Positioned(
                top: 100,
                left: 10,
                right: 10,
                child: LayoutBuilder(
                  builder: (context, constraints)
                  {
                    if(constraints.maxWidth> 450){
                      return Row(
                        children: [
                          Sinif(),
                          Expanded(child: Text("Seçili Öğrencinin Detayları"))
                        ],
                      );
                    }
                    else {
                      return Sinif();
                    }
                  }
                )),
            Positioned(bottom: 20, left: 10, right: 10, child: OgrenciEkleme()),
          ],
        ),
      ),
    );
  }
}

class SinifBilgisi extends InheritedWidget {
  const SinifBilgisi({
    super.key,
    required Widget child,
    required this.sinif,
    required this.baslik,
    required this.ogrenciler,
    required this.yeniOgrenciEkle,
  }) : super(child: child);

  final int sinif;
  final String baslik;
  final List<String> ogrenciler;
  final void Function(String yeniOgrenci) yeniOgrenciEkle;

  static SinifBilgisi of(BuildContext context) {
    final SinifBilgisi? result = context.dependOnInheritedWidgetOfExactType<SinifBilgisi>();
    assert(result != null, 'No SinifBilgisi found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(SinifBilgisi old) {
    return sinif != old.sinif ||
        baslik != old.baslik ||
        ogrenciler != old.ogrenciler ||
        yeniOgrenciEkle != old.yeniOgrenciEkle;
  }
}

class Sinif extends StatelessWidget {
  const Sinif({super.key});

  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center, // sağ ve sol ile alakalı
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.red),
            Text('${sinifBilgisi.sinif}. Sınıf', textScaleFactor: 2),
            Icon(Icons.star)
          ],
        ),
        Text(sinifBilgisi.baslik, textScaleFactor: 1.5),
        OgrenciListesi(),
      ],
    );
  }
}

class OgrenciEkleme extends StatefulWidget {
  const OgrenciEkleme({
    super.key,
  });

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
    final sinifBilgisi = SinifBilgisi.of(context);
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
                      sinifBilgisi.yeniOgrenciEkle(yeniOgrenci);
                      controller.text = "";
                      // setState(() {
                      //ogrenciler.add(controller.text);hey
                      //});
                    },
              child: Text("Ekle")),
        ),
      ],
    );
  }
}

class ArkaPlan extends StatelessWidget {
  const ArkaPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 100,
          color: Colors.grey.shade100,
          child: Center(),
        ),
      ),
    );
  }
}

class OgrenciListesi extends StatelessWidget {
  const OgrenciListesi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final sinifBilgisi = SinifBilgisi.of(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final o in sinifBilgisi.ogrenciler) Text(o),
      ],
    );
  }
}
