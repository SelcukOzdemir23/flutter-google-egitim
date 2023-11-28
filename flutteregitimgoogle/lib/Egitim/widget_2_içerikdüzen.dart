import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutteregitimgoogle/Egitim/album.dart';
import 'package:video_player/video_player.dart';

// https://docs.flutter.dev/ui/widgets

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
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(title: "Flutter Demo Home Page"),
        '/settings': (context) => SettingsPage(),
      },
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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
              onPressed: () {
                print("settings");
                Navigator.of(context).pushNamed('/settings');
              },
              icon: Icon(Icons.settings)),
          TextButton(
              onPressed: () {
                print("Hadi be!");
              },
              child: Text("Selam"))
        ],
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
                child: LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 450) {
                    return Row(
                      children: [Sinif(), Expanded(child: Text("Seçili Öğrencinin Detayları"))],
                    );
                  } else {
                    return SingleChildScrollView(
                        scrollDirection: Axis.vertical,child: Sinif());
                  }
                })),
            Positioned(bottom: 20, left: 10, right: 10, child: OgrenciEkleme()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Selam");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Aleyküm Selam")));
        },
        child: Text("OHA"),
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
        Container(
          color: Colors.red,
          padding: const EdgeInsets.all(8.0),
          child: Text(sinifBilgisi.baslik, textScaleFactor: 1.5),
        ),
        OgrenciListesi(),
        //Image.network("https://i.pinimg.com/550x/4d/aa/1e/4daa1ed0a8659aee502fa1f9bb4c7e1f.jpg"),
        //VideoApp()
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: Text("Öğrencileri Yükle"),
          onPressed: () async {
            final ogrenciler = SinifBilgisi.of(context).ogrenciler;

            await Future.forEach(ogrenciler, (ogrenci) async {
              print("$ogrenci yukleniyor");
              await Future.delayed(Duration(seconds: 1));
              print("$ogrenci yüklendi");
            });

            print("Tüm Öğrenciler Yüklendi");
          },
        ),
        ElevatedButton(
          child: Text("Yeni Sayfaya Git"),
          onPressed: () {
            //sor(context);

            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AlbumPage()));
          },
        ),
      ],
    );
  }

  Future<void> sor(BuildContext context) async {
    try {
      bool? cevap = await cevabiAl(context);
      print("Cevap geldi: ${cevap}");
      if (cevap == true) {
        print("Beğenildi");
        throw "Hata oldu";
      } else {
        cevap = await Navigator.of(context).push<bool>(MaterialPageRoute(
          builder: (context) {
            return VideoEkrani("Keşke beğenseniz... Videoyu Beğendiniz mi?");
          },
        ));
      }
      if (cevap == true) {
        print("BEĞENDİ...");
      }
    } catch (e) {
    } finally {
      print("Bu arad yapılan işler");
    }
  }

  Future<bool?> cevabiAl(BuildContext context) async {
    bool? cevap = await Navigator.of(context).push<bool>(MaterialPageRoute(
      builder: (context) {
        return VideoEkrani("Videoyu Beğendiniz mi?");
      },
    ));
    return cevap;
  }
}

class VideoEkrani extends StatelessWidget {
  final String mesaj;

  const VideoEkrani(
    this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        print("pop edecek");
        return true;
      },
      child: Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              children: [
                Placeholder(
                  fallbackHeight: 150,
                ),
                //VideoApp(),
                SizedBox(
                  height: 50,
                ),
                Text(this.mesaj),

                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).maybePop(true);
                  },
                  child: Text("Evet"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).maybePop(false);
                  },
                  child: Text("Hayır"),
                ),
              ],
            ),
          )),
    );
  }
}

class VideoApp extends StatefulWidget {
  const VideoApp({super.key});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying ? _controller.pause() : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
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
        padding: const EdgeInsets.symmetric(horizontal: 58.0, vertical: 16.0),
        child: Image.asset("images/Memati_Kurtlar_vadisi_pusu.jpg"),
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
        for (final o in sinifBilgisi.ogrenciler) ...[
          Text(o),
          SizedBox(
            height: 16,
          )
        ]
      ],
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Settings Page"),
        ),
        body: Container(
          child: Text("Settings Page"),
        ));
  }
}
