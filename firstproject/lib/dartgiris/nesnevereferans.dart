void main(){
final liste= [
  {"a","b"},
  {"c","d"},
  {"e","f"}
];
print(liste);

final ikinci = liste[1];

ikinci.remove("c"); // listeyi direk değiştirdin dikkat et

print(ikinci);
print(liste);

var liste1 = [1,2,3];
var liste2 = [4,5,6];

print("liste 1 ${liste1}");
print("liste 2 ${liste2}");

liste1 = liste2;

print("Later");
print("liste 1 ${liste1}");
print("liste 2 ${liste2}");

liste1[1] = 10; // liste2'yi de değiştirdik'
print("after's after");
print("liste 1 ${liste1}");
print("liste 2 ${liste2}");

//IMMUTABLE AND MUTABLE

int a = 5;
int b = 5;

String s = "merhaba";

s.replaceFirst("er", "to");

final s2 = s.replaceFirst("er", "to"); //yeni string değer oluşturdu referansı değiştirmedi

print(s2);
print(s);


}