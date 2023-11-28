void main() {
  print("Merhaba");

  try {
    print("main");
    hataliKoduCagir(); // hata var
    print("mainim");
  } on FormatException catch (e) {
    print("hata oldu");
    rethrow;
  } catch (e) {
    print("Tüm hatalar yakalandı");
    print(e);
  } finally {
    //öyle yada böyle çalışır
    print("Finally");
  }

  print("Finally'den sonra");
}

void hataliKoduCagir() {
  print("hatalikoduçağiran");
  hataliKod(); // hata var
}

void hataliKod() {
  print("hatali kod giriş");
  throw new Exception("HATA VAR");
  String? s = null;
  print(s!.length);
  double.parse("ben bir double değilim"); // hata var

  print("hatali kod çıkış");
}
