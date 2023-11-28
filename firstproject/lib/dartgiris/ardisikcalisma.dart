void main(){
  print("Hoş Geldiniz");

  var mesajSayisi = 2;
  print("$mesajSayisi adet okunmuş mesaj var");

  if(mesajSayisi==1){
    print("Aynen Öyle");
  }else if(mesajSayisi==2){
    print("Aynen Öyle 2");
  }
  else{
    print("Asikome");
  }

  switch(mesajSayisi){
    case 0:
      print("0");
      break;
    case 1:
      print("1");
      break;
    case 2:
      print("2");
      break;


  }
  print(mesajSayisi > 0 ? 'Aynen Öyle' : "asikome");
}