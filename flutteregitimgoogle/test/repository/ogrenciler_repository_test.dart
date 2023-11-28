
import 'package:flutter_test/flutter_test.dart';
import 'package:flutteregitimgoogle/Uygulama/models/ogrenci.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/ogrenciler_repository.dart';


void main() {
  group("Örğrenci Sevme", () {

    test('Sevdiğim öğrenci sevilmiş olarak görünüyor', () {
      final  ogrencilerRepository = OgrencilerRepository();
      final yeniOgrenci = Ogrenci("test", "test soyad", 33, "kadın");

      ogrencilerRepository.ogrenciler.add(yeniOgrenci);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), false);
      ogrencilerRepository.sev(yeniOgrenci, true);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), true);
      ogrencilerRepository.sev(yeniOgrenci, true);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), true);
      ogrencilerRepository.sev(yeniOgrenci, false);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), false);
      ogrencilerRepository.sev(yeniOgrenci, false);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), false);
      ogrencilerRepository.ogrenciler.remove(yeniOgrenci);
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), false);

    });

    test('Bilinmeyen öğrenci sevilmiyor', () {
      final  ogrencilerRepository = OgrencilerRepository();
      final yeniOgrenci = Ogrenci("test", "test soyad", 33, "kadın");
      expect(ogrencilerRepository.seviyorMuyum(yeniOgrenci), false);


    });
  });

}