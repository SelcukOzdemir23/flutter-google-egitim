import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutteregitimgoogle/Uygulama/repository/mesajlar_repository.dart';

import 'package:flutteregitimgoogle/Uygulama/models/mesajlar.dart';

class MesajlarSayfasi extends ConsumerStatefulWidget {


  const MesajlarSayfasi( {super.key});

  @override
  ConsumerState<MesajlarSayfasi> createState() => _MesajlarSayfasiState();
}

class _MesajlarSayfasiState extends ConsumerState<MesajlarSayfasi> {


  @override
  void initState() {

    Future.delayed(Duration.zero).then((value) {
      return ref.read(yeniMesajProvider.notifier).sifirla();
    });


    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    final mesajlarRepository = ref.watch(mesajlarProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mesajlar"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: mesajlarRepository.mesajlar.length,
                itemBuilder: (context, index) {
                  return MesajGorunumu(mesajlarRepository.mesajlar[mesajlarRepository.mesajlar.length - index - 1]);
                },
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Row(
                children: [
                  SizedBox(),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "Write something happily..."),
                        ),
                      ),
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Gönder");
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          shadowColor: Colors.white,
                          shape: const BeveledRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(5)))),
                      child: const Text("Gender"),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

class MesajGorunumu extends StatelessWidget {
  final Mesaj mesaj;

  const MesajGorunumu(
    this.mesaj, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mesaj.gonderen == "Ayşe" ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              color: Colors.green.shade200,
              borderRadius: BorderRadius.all(Radius.circular(15))),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(mesaj.yazi),
          ),
        ),
      ),
    );
  }
}
