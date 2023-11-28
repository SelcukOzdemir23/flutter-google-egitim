String global = "Global Değişken a";

void main(){
  int i =1;
  double d = 1.1;

  num n1 = 1;
  num n2 = d; // num ikisini birden tutabilir


  String s = "mer\\haba";
  print(i);
  print(d);
  print(s);

  print(i.toString());

  bool isEven = i.isEven;


  final l = [1,2,3];
  final set = {1,2,4};
  final map = {"a":1,"b":2};

  print(l);
  print(set);
  print(map.keys);

  Object o;

  var a = 3;// artık String felan olamaz;
}