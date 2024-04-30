import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiamondFaceResult.dart';
import 'package:flutter_application_1/HearthFaceResult.dart';
import 'package:flutter_application_1/RoundFaceResult.dart';
import 'package:flutter_application_1/SquareFaceresult.dart';
import 'package:flutter_application_1/coolToneResult%20copy.dart';
import 'package:flutter_application_1/warmToneResult.dart';
import 'package:flutter_application_1/ovalfaceresult.dart';
import 'package:flutter_application_1/rectanglefaceresult.dart';

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
                  SizedBox(
                    width: 1,
                  )
                ],
              ),
              Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("DEFINE YOUR COLOR WITH COLOR TONE")],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 200,
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
                          builder: (context) => CoolToneResult(),
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
                                      child: Text("purple blood blue tone"),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                              width: 200,
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
                          builder: (context) => WarmToneResult(),
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
                                      child: const Text("green blood Yellow tone"),
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
