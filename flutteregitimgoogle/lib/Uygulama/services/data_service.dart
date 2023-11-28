import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/models/ogretmen.dart';

class DataService{
  Ogretmen ogretmenIndir() {
    const j = """{
    "ad": "Yeni", "soyad": "Yenioğlu", "yas": 22, "cinsiyet": "Erkek"
    }
    """;
    // final m = {"ad": "Yeni", "soyad": "Yenioğlu", "yas": 22, "cinsiyet": "Erkek"};

    final m = jsonDecode(j);

    final ogretmen = Ogretmen.fromMap(m);

    return ogretmen;

  }



}

final dataServiceProvider = Provider(
      (ref) {
    return DataService();
  },
);