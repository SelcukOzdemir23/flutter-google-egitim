import 'package:flutter/material.dart';


void main() {
  //var adlı bir değişken var. Dinamik türde bir değişken ve içine her geleni atabiliriz.
  print(1);
  var konu = "Flutter";
  var eylem = "Öğreniyorum";

  var f = konuEylem;
  var hepsi = f(konu: konu,eylem: eylem); //referans verdik
  print(hepsi);


}

String konuEylem({required String konu, String eylem= ""}) // köşeli parantez opsiyonel yapar, required ile kesin vermen lazım denir
{
  print("Konu ve eylem birleştirildi");
  var hepsi = konu+ " " +eylem;;
  return hepsi;
}



