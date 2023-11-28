void main() {
  // Spread Operatörü

  final l = [1, 2, 3];
  final s = {1, 2, 3};
  final m = {1: 10, 2: 20, 3: 30};

  print([1, 23, 45, ...l, 65, 78]); // ...li direk içine onu ekler
  print([1, 23, 45, l, 65, 78]);
  print([1, 23, 45, ...s, 65, 78]); // ...li direk içine onu ekler
  print([1, 23, 45, ...s, ...l, 65, 78]);


  //aynı şey set ve map içinde geçerli
print(
  [
    1,
    2,
    3,
    if(1==1)
      ...[69,77,98],
    if(1!=1)
      77,
    4,
    5,
    if(1!=1)
      for(int i = 0;i<3;i++)
      i
  ]

);


}
