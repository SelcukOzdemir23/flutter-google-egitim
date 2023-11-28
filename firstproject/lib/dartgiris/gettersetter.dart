//getter ve setter değişkenleri korumak için yapılır
// her değişken için getter ve setter olsa iyi olur.

void main() {
  final Ogrenci o1 = Ogrenci("Ali", 22);

  o1.merhabaDe();
  o1.yas = 13;
  print(o1.yas);


  print(o1.sinif);
  o1.sinif = 1;
  print(o1.yas);

  o1.sube = "A";
  print(o1.sube);
}

class Ogrenci {
  String ad;
  int yas;
  String _sube = ""; //private oldu yoksa get sete gerek yok zaten

  String get sube => _sube;

  set sube(String value) {
    _sube = value;
  }

  int get sinif{
    print("Sınıf Hesaplanıyor");
    return yas-5;
  }

  set sinif(int s){
    yas = s+5;
  }

  Ogrenci(this.ad, this.yas);

  void merhabaDe() {
    print("Merhaba ben $ad ve $yas'ındayım");
  }
}
