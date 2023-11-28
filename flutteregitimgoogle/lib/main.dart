import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/pages/mesajlar_sayfasi.dart';
import 'package:flutteregitimgoogle/Uygulama/pages/ogrenciler_sayfasi.dart';
import 'package:flutteregitimgoogle/Uygulama/pages/ogretmenler_sayfasi.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/mesajlar_repository.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/ogrenciler_repository.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/ogretmenler_repository.dart';
import 'package:flutteregitimgoogle/Uygulama/utilities/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(ProviderScope(child: const OgrenciApp()));
}

class OgrenciApp extends StatelessWidget {
  const OgrenciApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Öğrenci Uygulaması',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isFirebaseInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeFirebase();
  }

  Future<void> initializeFirebase() async {
    await Firebase.initializeApp();
    setState(() {
      isFirebaseInitialized = true;
    });
    if (FirebaseAuth.instance.currentUser != null) {
      anaSayfayaGit();
    }

    // anaSayfayaGit();
  }

  void anaSayfayaGit() {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => const AnaSayfa(title: "Öğrenci Ana Sayfa"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: isFirebaseInitialized
                ? ElevatedButton(
                    onPressed: () async {
                      await signInWithGoogle();

                      var uid = FirebaseAuth.instance.currentUser!.uid;

                      FirebaseFirestore.instance.collection("kullanicilar").doc(uid).set(
                          {'girişYaptimi': true, 'sonGirisTarihi': FieldValue.serverTimestamp()},
                          SetOptions(merge: true));

                      anaSayfayaGit();
                    },
                    child: Text("Google Sign In"))
                : CircularProgressIndicator()));
  }
}

class AnaSayfa extends ConsumerWidget {
  final String title;

  const AnaSayfa({super.key, required this.title});

  // MesajlarRepository mesajlarRepository = MesajlarRepository();
  // OgrencilerRepository ogrencilerRepository = OgrencilerRepository();
  // OgretmenlerRepository ogretmenlerRepository = OgretmenlerRepository();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserHeader(),
            ListTile(
              title: Text("ÖYlesine"),
            ),
            ListTile(
              title: Text("ÖYlesine"),
            ),
            ListTile(
              title: Text("ÖYlesine"),
            ),
            ListTile(
              title: Text("Çıkış Yap"),
              onTap: () async {
                signOutWithGoogle();
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (OgrencilerSayfasi())),
                  );
                },
                child: Text("${ogrencilerRepository.ogrenciler.length} Öğrenci")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OgretmenlerSayfasi()),
                  );
                },
                child: Hero(
                    tag: 'ogretmen',
                    child: Material(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                          color: Colors.grey.shade200,
                          child: Text("${ogretmenlerRepository.ogrenciler.length} Öğretmen")),
                    ))),
            ElevatedButton(
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MesajlarSayfasi()),
                  );
                },
                child: Text("${ref.watch(yeniMesajProvider)} mesajınız var")),
          ],
        ),
      ),
    );
  }
}

class UserHeader extends StatefulWidget {
  const UserHeader({
    super.key,
  });

  @override
  State<UserHeader> createState() => _UserHeaderState();
}

class _UserHeaderState extends State<UserHeader> {
  Future<Uint8List?>? _ppicFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ppicFuture = _ppicIndir();
  }

  Future<Uint8List?> _ppicIndir() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    // uid = "another";

    var documentSnapShot =
        await FirebaseFirestore.instance.collection("kullanicilar").doc(uid).get();
    final userRecMap = documentSnapShot.data();

    if (userRecMap == null) return null;
    if (userRecMap.containsKey("ppicref")) {
      var ppicRef = userRecMap["ppicref"];
      Uint8List? uint8list = await FirebaseStorage.instance.ref(ppicRef).getData();

      return uint8list;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(FirebaseAuth.instance.currentUser!.displayName!),
            Text(FirebaseAuth.instance.currentUser!.email!),
            SizedBox(height: 10),
            InkWell(
              onTap: () async {
                XFile? xFile = await ImagePicker().pickImage(source: ImageSource.camera);
                if (xFile == null) return;

                var uid = FirebaseAuth.instance.currentUser!.uid;

                final imagePath = xFile.path;
                final ppicRef = FirebaseStorage.instance.ref("ppics").child("$uid.jpg");
                await ppicRef.putFile(File(imagePath));

                await FirebaseFirestore.instance
                    .collection("kullanicilar")
                    .doc(uid)
                    .update({'ppicref': ppicRef.fullPath});
                setState(() {
                  _ppicFuture = _ppicIndir();
                });
              },
              child: FutureBuilder<Uint8List?>(
                  future: _ppicFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final picInMemory = snapshot.data!;
                      return MovingAvatar(picInMemory: picInMemory);
                    }
                    return CircleAvatar(
                      child: Text("SÖ"),
                    );
                  }),
            ),
          ],
        ));
  }
}

class MovingAvatar extends StatefulWidget {
  const MovingAvatar({
    super.key,
    required this.picInMemory,
  });

  final Uint8List picInMemory;

  @override
  State<MovingAvatar> createState() => _MovingAvatarState();
}

class _MovingAvatarState extends State<MovingAvatar>
    with SingleTickerProviderStateMixin<MovingAvatar> {
  late Ticker _ticker;

  double yataydaKonum = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _ticker = createTicker((Duration elapsed) {
      final aci = pi * elapsed.inMicroseconds / Duration(seconds: 1).inMicroseconds;
      setState(() {
        yataydaKonum = sin(aci) * 30 + 30;
      });
    });
    _ticker.start();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left:yataydaKonum),
      child: CircleAvatar(
        backgroundImage: MemoryImage(widget.picInMemory),
      ),
    );
  }
}
