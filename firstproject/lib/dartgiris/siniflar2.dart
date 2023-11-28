

import 'ogrencisinifi.dart';

void main(){
  print("Hello");

  Ogrenci o1 = Ogrenci("Ali",22);
  Ogrenci o2 = Ogrenci("Ayşe",16);


  o1.merhabaDe();
  o2.merhabaDe();

  // o1._yas +=1; bunu yapamazsın private oldu
  o1.dogumGununuKutla();
  o1.merhabaDe();

}