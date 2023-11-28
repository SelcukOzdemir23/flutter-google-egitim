Future<void> main() async {
  await runTest();
}

Future<void> runTest()  {

  return Future.delayed(const Duration(seconds: 1)).then((value) => hatataliAsync()).then((value) => Future.delayed(const Duration(seconds: 1))).catchError((e){
    print("UStaaaaa");
  });



}

Future<void> hatataliAsync() async {
  throw "ne yaptın usta sen";
}