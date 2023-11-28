void main() {
  // null = böyle bir şey yok!
  print("Selamün Aleyküm");
  //String? s; //nul referasans verebilir - çıktısı null

  String s;
  // print(s); s yok
  String? sn;
  sn = getAli();
  print(sn);
  if (sn != null) {
    print(sn.length);
  }else{
    print(sn?.length); // snvar
  }

}

String? getAli() => null;
