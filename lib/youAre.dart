import 'package:flutter/material.dart';
import 'package:flutter_application_1/coolToneResult%20copy.dart';
import 'package:flutter_application_1/warmToneResult.dart';

class YouAre extends StatelessWidget {
  const YouAre({super.key, required this.plat, required this.finger, required this.tone, required this.r, required this.g, required this.b});
  final String finger;
  final String plat;
  final String tone;
  final int r;
  final int g;
  final int b;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                   Container(
                      alignment: Alignment.center,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: Stack(
                        children: [
                          Image(image: AssetImage('images/$finger')),
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
                
               
                     Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40,),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "YOU ARE",
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w600,
                                height: 1, fontFamily: "montserrat"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          alignment: Alignment.topLeft,
                          child: Text(
                            "$tone TONE",
                            style: const TextStyle(
                                fontSize: 35, fontWeight: FontWeight.w600, fontFamily: "montserrat"),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 30),
                          width: 210,
                          height: 60,
                          child: Image(
                            image: AssetImage('images/$plat'),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            if (plat == "platletWarm.png") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WarmToneResult(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CoolToneResult(),
                                ),
                              );
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 150,
                            height: 50,
                            margin: const EdgeInsets.only(top: 10, left: 30),
                            decoration:  BoxDecoration(
                              color: Color.fromARGB(255, r, g, b),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                            child: const Text("DISCOVER\nYOUR FASHION"),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 30, top: 20),
                          alignment: Alignment.topLeft,
                          child: const Text(
                            "If you have a cool undertone, your best colours are\non the cool side of the colour wheel -\nreminiscent of ocean waters and a frosty winter.\nReach for the colors blue, green, purple,\nand also light pastel shades like pink,\nlavender or a cool gray.\nIn contrast to a warm undertone, accessories in\nsilver and pewter go best with a cool undertone.",
                            style: TextStyle(
                                fontSize: 13,
                                height: 1.2,fontFamily: 'montserrat'),
                          ),
                        ),
                      ],
                    ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
