//mutable içeriği değişebilir
//immutable içeriği değişmez.

void main() {
  final Ogrenci o1 = Ogrenci("Ali", 22);
  final Ogrenci o2 = Ogrenci("Ayşe", 16);

  o1.merhabaDe();
  o2.merhabaDe();
}

class Ogrenci {
  final String ad;
  final int yas; // _ demek private demek

  Ogrenci(this.ad, this.yas);

  void merhabaDe() {
    print("Merhaba ben $ad ve $yas'ındayım");
  }
}
