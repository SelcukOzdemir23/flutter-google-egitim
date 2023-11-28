import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/ogrenciler_repository.dart';

import 'package:flutteregitimgoogle/Uygulama/models/ogrenci.dart';

class OgrencilerSayfasi extends ConsumerWidget {
  const OgrencilerSayfasi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Öğrenciler"),
      ),
      body: Column(
        children: [
          PhysicalModel(
            color: Colors.black,
            elevation: 20,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                child: Text(
                  "${ogrencilerRepository.ogrenciler.length} Öğrenci",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    OgrenciSatiri(ogrencilerRepository.ogrenciler[index]),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: ogrencilerRepository.ogrenciler.length),
          ),
        ],
      ),
    );
  }
}

class OgrenciSatiri extends ConsumerWidget {
  final Ogrenci ogrenci;

  const OgrenciSatiri(
    this.ogrenci, {
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ogrencilerRepository = ref.watch(ogrencilerProvider);
    bool seviyorMuyum = ogrencilerRepository.seviyorMuyum(ogrenci);
    return ListTile(
        title: AnimatedPadding(
          padding:seviyorMuyum? const EdgeInsets.only(left: 30): const EdgeInsets.only() ,
          duration: Duration(seconds: 1),
          curve: Curves.bounceOut,
          child: Text(
            "${ogrenci.ad} ${ogrenci.soyad}",
            style: const TextStyle(color: Colors.red),
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            ref.read(ogrencilerProvider).sev(ogrenci, !seviyorMuyum);
          },
          icon: AnimatedCrossFade(
              firstChild: Icon(Icons.favorite_border),
              secondChild: Icon(Icons.favorite),
              crossFadeState: seviyorMuyum ? CrossFadeState.showFirst : CrossFadeState.showSecond,
              duration: Duration(seconds: 1)),
        ),
        leading: Text(ogrenci.cinsiyet == "Erkek" ? "🧑" : "👩"));
  }
}
