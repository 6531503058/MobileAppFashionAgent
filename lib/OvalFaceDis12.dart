import 'package:flutter/material.dart';

class OvalFaceDis12 extends StatelessWidget {
  final BoxDecoration deco = BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(0, 8, 0, 121),
      width: 2,
    ),
    color: const Color.fromARGB(90, 207, 207, 207),
    borderRadius: BorderRadius.circular(10),
  );
  final BoxDecoration decoTitle = BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(0, 8, 0, 121),
      width: 2,
    ),
    color: const Color.fromARGB(255, 216, 198, 185),
    borderRadius: BorderRadius.circular(25),
  );

  OvalFaceDis12({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Flexible(
                   child: FractionallySizedBox(
                      widthFactor: 1,
                      heightFactor: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Stack(
                          
                          children: [
                            const Image(
                              image: AssetImage('images/o12.png'),
                            ),
                             IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios_rounded),
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ],
                        ),
                      ), 
                    ),
                  
              ),
              Container(
                width: 360,
                height: 240,
                margin: const EdgeInsets.only(top: 20, left: 10, right: 10),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('"Long, wavy mermaid hair - sweet girl vibes."'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
