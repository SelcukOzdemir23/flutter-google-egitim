//CLASSSES

void main() {
  //guzel ama bir class değil
  final ogrenci = {"adı": "Ali", "Soyadı": "Yılmaz", "yaşı": 18, "cinsiyet": "erkek", "notu": 100};
  print(ogrenci);
  final ali = Ogrenci("Ahmet", "Baş", 5, "Erken", 95);
  final veli = Ogrenci("Veli", "Gök", 3, "Kadın", 35);
  print(ali.toString());
  print(veli.toString());

  ali.adiSoyadi = "Memati Baş";
  print(ali.adiSoyadi);

  print(Ogrenci.okulAdi);
  print(okulIsmi);

  Ogrenci.setOkulAdi("Kurtlar Okulu");
  print(Ogrenci.okulAdi);
}


String okulIsmi = "Atatürk İlkokulu";
class Ogrenci {

  static String okulAdi = "Atatürk İlkokulu";
  static void setOkulAdi(String yeniokulAdi){
    okulAdi = yeniokulAdi;
  }

  String ad;
  String soyad;
  int yas;
  String cinsiyeti;
  int notu;
  bool mezunMu;

  Ogrenci(this.ad, this.soyad, this.yas, this.cinsiyeti, this.notu) : mezunMu = false;

  bool ortalamaninUstundeMi(int ortalama) {
    return notu > ortalama;
  }

  String get adiSoyadi => "$ad $soyad";

  set adiSoyadi(String value) {
    int bosluk = value.indexOf(" ");
    this.ad = value.substring(0, bosluk);
    this.soyad = value.substring(bosluk, value.length);
  }

  @override
  String toString() {
    return "$ad $soyad $yas $cinsiyeti $notu $mezunMu";
  }
}
