

import 'ogrencisinifi.dart';

void main(){
  print("Hello");

  Ogrenci o1 = Ogrenci("Ali",22);
  Ogrenci o2 = Ogrenci("Ayşe",16);
  Ogrenci o3 = Ogrenci("Ahmet",16);


  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();

  o1.siraArkadasi = o2;
  o2.siraArkadasi = o1;
  o1.merhabaDe();
  o2.merhabaDe();
  o3.merhabaDe();
  o1.siraArkadasininDogumGununuKutla();
  o2.merhabaDe();


}

