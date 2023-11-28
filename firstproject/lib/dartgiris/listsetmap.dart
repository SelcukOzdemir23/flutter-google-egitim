void main() {
  final List<String> mesajlar = ["a", "b", "c"]; // veri tipi list üzerinden String
  print(mesajlar);

  mesajlar.add("d");
  print(mesajlar);
  mesajlar.addAll(["e", "d"]);
  print(mesajlar);
  print("$mesajlar.length");

  if (mesajlar.contains('a')) {
    print("a var");
  } else {
    print("yok");
  }

  mesajlar[0] = "A";
  print(mesajlar);

  mesajlar.remove("A");
  print(mesajlar);

  for (var i in mesajlar) {
    print(i);
  }

//SET

  final arkadaslar = {"ali", "ayşe", "mehmet"};

  print(arkadaslar);

  arkadaslar.add("fatma");
  print(arkadaslar);

  print(arkadaslar.first);
  print(arkadaslar.last);

  print(arkadaslar.length);

  print(arkadaslar.intersection({"ayşe", "mehmet", "a"}));

//MAP - DICTIONARY
  final etiketler = {"arkadaşlar": 1, "okul": 3, "iş": 5};

  print(etiketler);

  print(etiketler["iş"]);
  etiketler["iş"] = 7;

  print(etiketler);

  print(etiketler.containsKey("okul"));

  for (final entry in etiketler.entries) {
    print("${entry.key}: ${entry.value}");
  }

//GENERIC TURLER
final List<String> l = ["a"];
final Set<String> set = {"memati"};
final Map<String, int> map = {"Baş":1};

  

}
