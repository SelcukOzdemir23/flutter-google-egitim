void main(){
  final l = [1,2,3];
  final s = {1,2,3};
  final m = {1:10,2:20,3:30};

  final Iterable<int> l1 = l;
  final Iterable<int> s1 = s;

  for(final e in l1){
    print(e);
  }

  print(l1.first);
  print(l1.last);
  print(l1.length);
  print(l1.contains(4));

  l1.forEach((element) {print(element);});

  print(l1.toList());


  for(final e in l){
    print(e);
  }

  for(var i = 0;i<l.length;i++){
    print(l[i]);
  }

  for (final e in m.entries){
    print("${e.key} ${e.value}");
  }

}