import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/models/ogretmen.dart';
import 'package:flutteregitimgoogle/Uygulama/services/data_service.dart';


class OgretmenlerRepository extends ChangeNotifier {
  List<Ogretmen> ogrenciler = [
    Ogretmen("Faruk", "Yılmaz", 40, "Erkek"),
    Ogretmen("Semiha", "Çelik", 54, "Kadın")
  ];

  final Set<Ogretmen> sevdiklerim = {};
  final DataService dataService;

  OgretmenlerRepository(this.dataService);

  void indir() {
    Ogretmen ogretmen = dataService.ogretmenIndir();

    ogrenciler.add(ogretmen);
    notifyListeners();
  }

  void sev(Ogretmen ogretmen, bool seviyorMuyum) {
    if (seviyorMuyum) {
      sevdiklerim.add(ogretmen);
    } else {
      sevdiklerim.remove(ogretmen);
    }
  }

  bool seviyorMuyum(Ogretmen ogretmen) {
    return sevdiklerim.contains(ogretmen);
  }
}

final ogretmenlerProvider = ChangeNotifierProvider(
      (ref) {
    return OgretmenlerRepository(ref.watch(dataServiceProvider));
    }
);
