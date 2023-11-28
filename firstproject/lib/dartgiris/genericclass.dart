void main() {
  final m = MyClass<String>("Merhaba");
  print(m.val);
  m.kullan();
}

class MyClass<T extends String> {
  T val;

  MyClass(this.val);

  void kullan(){
    print(val.length);
  }
}
