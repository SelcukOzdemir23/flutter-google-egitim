//mutable içeriği değişebilir
//immutable içeriği değişmez.



void main() {
  final Ogrenci o1 = Ogrenci("Ali", 22);
  final Ogrenci o2 = Ogrenci("Ayşe", 16);
  final Ogrenci o3 = Ogrenci.onSekiz("Ahmet");

  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();
}

const o = Ogrenci("cc", 19);


class Ogrenci {
  final String ad;
  final int yas; // _ demek private demek

  const Ogrenci(this.ad, int y): yas=y;

  const Ogrenci.onSekiz(String ad):this(ad,18);

  factory Ogrenci.cc(){
    return o;
  }

  void merhabaDe() {
    print("Merhaba ben $ad ve $yas'ındayım");
  }
}
