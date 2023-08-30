//import 'dart:ffi';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int countLike = 0;
  int countDislike = 0;

  void incrementDislike() {
    setState(() {
      if (countDislike < 20) {
        countDislike++;
      }
    });
  }

  void incrementLike() {
    setState(() {
      if (countLike < 20) {
        countLike++;
      }
    });
  }

  void clearCount() {
    setState(() {
      countDislike = 0;
      countLike = 0;
    });
  }

  bool get isLoved => countLike == 20;
  bool get isHated => countDislike == 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2e292c),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/eltz-castle-wierschem-germany-by-cederic-vandenberghe.jpg',
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Este é o castelo de Eltz, situado em Wierschem na Alemanha.',
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: Color(0x80be5a1e),
                fontFamily: 'Phudu',
                fontSize: 30,
                color: Color(0xff2e292c),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 300,
            ),
            const Text(
              'O que você acha dele?',
              style: TextStyle(
                backgroundColor: Color(0x80be5a1e),
                fontFamily: 'Phudu',
                fontSize: 30,
                color: Color(0xfffffeff),
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$countLike',
                      style: TextStyle(
                        fontFamily: 'Black Ops One',
                        fontSize: 70,
                        color: isLoved
                            ? const Color(0xff02ba2c)
                            : const Color(0xfffffeff),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x60fffeff),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xfffffeff),
                          width: 8,
                        ),
                      ),
                      child: IconButton(
                        onPressed: incrementLike,
                        icon: const Icon(Icons.thumb_up),
                        iconSize: 80,
                        color: isLoved
                            ? const Color(0x30BE231E)
                            : const Color(0xfffffeff),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 70,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$countDislike',
                      style: TextStyle(
                        fontFamily: 'Black Ops One',
                        fontSize: 70,
                        color: isHated
                            ? const Color(0xFFBE231E)
                            : const Color(0xfffffeff),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0x60fffeff),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xfffffeff),
                          width: 8,
                        ),
                      ),
                      child: IconButton(
                        onPressed: incrementDislike,
                        icon: const Icon(Icons.thumb_down),
                        iconSize: 80,
                        color: isHated
                            ? const Color(0x30BE231E)
                            : const Color(0xfffffeff),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: clearCount,
              style: TextButton.styleFrom(
                backgroundColor: Color(0x40fffeff),
                fixedSize: const Size(100, 40),
                foregroundColor: Color(0xffbe5a1e),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Zerar',
                style: TextStyle(
                  fontFamily: 'Phudu',
                  fontSize: 20,
                  color: Color(0xfffffeff),
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
