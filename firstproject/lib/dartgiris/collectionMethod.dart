void main(){

  final iterable = [1, 2, 3,4,5,6,7,8,9,0];
  final s = {1, 2, 3};
  final m = {1: 10, 2: 20, 3: 30};


  print(iterable);

  print(iterable.first);
  print(iterable.last);
  print(iterable.firstWhere((element) => element%4 ==0));

  print(iterable.any((element) => element>3)); // herhangi biri uyuyor ise true olur.

  if(iterable.every((element) => element>-1)){
    print("Hepsi 3'ten büyük baba");
  }

  // iterable.fold(0, (previousValue, element) => null);
  
  print(iterable.where((element) => element>4)); //koşula uygun olanları bulur

  print(iterable.map((e) => e*e)); // her elemana uygular


}