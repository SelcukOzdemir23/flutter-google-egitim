import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/ogretmenler_repository.dart';

import 'package:flutteregitimgoogle/Uygulama/models/ogretmen.dart';

class OgretmenlerSayfasi extends ConsumerWidget {
  const OgretmenlerSayfasi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğretmenler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
              color: Colors.black,
              elevation: 20,
              child: Stack(children: [
                Center(
                  child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                      child: Hero(
                          tag: 'ogretmen',
                          child: Material(
                            child: Container(
                                padding: const EdgeInsets.all(8.0),
                                color: Colors.grey.shade200,
                                child: Text("${ogretmenlerRepository.ogrenciler.length} Öğretmen")),
                          ))),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: OgretmenIndirmeButonu(),
                )
              ])),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    OgretmenSatiri(ogretmenlerRepository.ogrenciler[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ogretmenlerRepository.ogrenciler.length),
          ),
        ],
      ),
    );
  }
}

class OgretmenIndirmeButonu extends StatefulWidget {
  const OgretmenIndirmeButonu({
    super.key,
  });

  @override
  State<OgretmenIndirmeButonu> createState() => _OgretmenIndirmeButonuState();
}

class _OgretmenIndirmeButonuState extends State<OgretmenIndirmeButonu> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (BuildContext context, WidgetRef ref, Widget? child) {
      return IconButton(
        color: Colors.white,
        icon: const Icon(Icons.download),
        onPressed: () {
          ref.read(ogretmenlerProvider).indir();
        },
      );
    });
  }
}

class OgretmenSatiri extends ConsumerWidget {
  final Ogretmen ogretmen;

  const OgretmenSatiri(
    this.ogretmen, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogretmenlerRepository = ref.watch(ogretmenlerProvider);
    bool seviyorMuyum = ogretmenlerRepository.seviyorMuyum(ogretmen);
    return ListTile(
      title: Text(
        ogretmen.ad + " " + ogretmen.soyad,
        style: TextStyle(color: Colors.red),
      ),
      trailing: IconButton(
          onPressed: () {
            ogretmenlerRepository.sev(ogretmen, !seviyorMuyum);
          },
          icon: Icon(seviyorMuyum ? Icons.favorite : Icons.favorite_border)),
      leading: Text(ogretmen.cinsiyet == "Erkek" ? "🧑" : "👩"),
    );
  }
}
