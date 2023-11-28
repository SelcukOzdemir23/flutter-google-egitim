void main(){
  List<Ogretmen> ogretmenler = [
    Ogretmen("ali"),
    IngilizceOgretmeni("başlangıç", "John")
  ];

  for (var i in ogretmenler){
    i.merhabaDe();
  }

}

class Ogretmen{
  String ad;

  Ogretmen(this.ad);

  void merhabaDe(){
    print("Merhaba ben ${ad} öğretmen");
  }

}

class IngilizceOgretmeni extends Ogretmen{
  String chapter;
  IngilizceOgretmeni(this.chapter,String name): super(name);

  @override
  void merhabaDe() {
    // TODO: implement merhabaDe
    super.merhabaDe();
    print("I'm at the chapter of $chapter");
  }
}
