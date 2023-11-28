//GLOBAL DEĞİŞKEN

final globalA = "Globalim";

void main(){

  //const ve final ile sabit değişkenler oluşturuluyor
  //const d = "değişkenim";

  final a = "a";

  final d = "değişken" + a;
  print(d);

  if(1 == 1){
    final a = "İçerideyimdim";
    print(a);
  }

  print("Main Çalıştı");
  altProgram();

  print(globalA);

}

void altProgram(){

  final a = "Başka bir a";
  print(a);
  print("Al Program Çalıştı");
  print(globalA);

}

