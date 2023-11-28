class Ogrenci{
  String ad;
  int _yas; // _ demek private demek
  Ogrenci? siraArkadasi; // ? olmas sebebi null değerinin atanması

  void merhabaDe(){
    print("Merhaba ben $ad ve $_yas'ındayım");
    if(siraArkadasi!=null){
      print("Sira Arkadaşım: ${siraArkadasi!.ad}");
    }

  }
  Ogrenci(this.ad, this._yas);

  void dogumGununuKutla() {
    print("Dogum Günün Kutlu Olsun");
    _yas+=1;
  }

  void siraArkadasininDogumGununuKutla(){
    if(siraArkadasi!=null){
      print("${siraArkadasi!.ad} doğum günün kutlu olsun");
      siraArkadasi!.dogumGununuKutla();
    }


    }
}