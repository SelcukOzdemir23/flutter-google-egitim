void main(){

  print("Selam");

  var mesajSayisi = 1;

  var mi = 0;

  while(mi<mesajSayisi){
    print("$mi mesaj sayısı");
    mi++;
  }

  do{
    print("$mi mesaj sayısı");
    mi++;
  }
  while(mi<mesajSayisi);

  for(int i =0;i<mesajSayisi;i++){
    print("$i mesaj sayısı");
  }

  final mesajlar = ["a","b","c"];
  for(var mi=0;mi<mesajlar.length;mi++){
    print("${mesajlar[mi]}");
  }

  for (var i in mesajlar){
    print("$i");
  }

  print("$mesajSayisi adet mesajınız var");
}