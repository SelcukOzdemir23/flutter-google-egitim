import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/models/mesajlar.dart';

class MesajlarRepository extends ChangeNotifier{
  final List<Mesaj> mesajlar = [
    Mesaj("Merhaba","Ali",DateTime.now().subtract(const Duration(minutes: 3))),
    Mesaj("Naber Müdür","Ali",DateTime.now().subtract(const Duration(minutes: 2))),
    Mesaj("slm","Ayşe",DateTime.now().subtract(const Duration(minutes: 1))),
    Mesaj("Ne müdürü ya","Ayşe",DateTime.now())
  ];

  

}

final mesajlarProvider = ChangeNotifierProvider((ref) {
  return MesajlarRepository();
});

final yeniMesajProvider = StateNotifierProvider<YeniMesajSayisi,int>((ref) {
  return YeniMesajSayisi(4);
});
class YeniMesajSayisi extends StateNotifier<int>{
  YeniMesajSayisi(super.state);

  void sifirla(){
    state = 0;
  }

}
