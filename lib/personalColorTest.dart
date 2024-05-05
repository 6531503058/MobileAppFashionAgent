import 'package:flutter/material.dart';
import 'package:flutter_application_1/youAre.dart';

class personalColorTest extends StatelessWidget {
  const personalColorTest({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                  const SizedBox(
                    width: 1,
                  )
                ],
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("DEFINE YOUR COLOR WITH COLOR TONE", style: TextStyle(fontFamily: 'montserrat'),)],
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    alignment: Alignment.center,
                    width: 200,
                    decoration: BoxDecoration(color: const Color.fromARGB(255,161, 188, 180),
                    borderRadius: BorderRadius.circular(10),),
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 20),
                    child: const Text("PERSONAL COLOR", style: TextStyle(fontFamily: 'montserrat',color: Colors.white ),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 150,
                              height: 300,
                              child: Image(
                                image: AssetImage('images/pupleHand.png'),
                                fit: BoxFit.contain,
                              )),
                          InkWell(
                             onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YouAre(plat: "platletCool.png",finger: 'twoFinger.png',tone: 'COOL', r: 214, g: 239, b: 244,),
                        ),
                      );
                    },
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 214, 239, 244),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20),),),
                                      child: const Text("purple blood\n  blue tone", style: TextStyle(fontFamily: 'montserrat'),),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 150,
                              height: 300,
                              child: Image(
                                image: AssetImage('images/greenHand.png'),
                                fit: BoxFit.contain,
                              )),
                          InkWell(
                             onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const YouAre(plat: 'platletWarm.png',finger:'tenFinger.png' ,tone: 'WARM', r: 254, g: 253, b: 233, ),
                        ),
                      );
                    },
                            child: Container(
                              alignment: Alignment.center,
                              width: 150,
                              height: 50,
                              decoration: const BoxDecoration(
                                  color: Color.fromARGB(255, 254, 253, 233),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20),),),
                                      child: const Text("green blood\nYellow tone" ,style: TextStyle(fontFamily: 'montserrat'),),
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
              const Row(
                children: [
                  SizedBox(
                    width: 1,
                    height: 100,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
