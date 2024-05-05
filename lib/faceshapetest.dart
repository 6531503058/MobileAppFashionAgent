import 'package:flutter/material.dart';
import 'package:flutter_application_1/DiamondFaceResult.dart';
import 'package:flutter_application_1/HearthFaceResult.dart';
import 'package:flutter_application_1/RoundFaceResult.dart';
import 'package:flutter_application_1/SquareFaceresult.dart';
import 'package:flutter_application_1/ovalfaceresult.dart';
import 'package:flutter_application_1/rectanglefaceresult.dart';

class facetest extends StatelessWidget {
  const facetest({super.key});

  @override
  Widget build(BuildContext context) {
    BoxDecoration deco = BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(0, 8, 0, 121),
        width: 2,
      ),
      color: const Color.fromARGB(90, 207, 207, 207),
      borderRadius: BorderRadius.circular(10),
    );
    BoxDecoration decoTitle = BoxDecoration(
      border: Border.all(
        color: const Color.fromARGB(0, 8, 0, 121),
        width: 2,
      ),
      color: const Color.fromARGB(255, 216, 198, 185),
      borderRadius: BorderRadius.circular(25),
    );

    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          /*leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close),
          ),
          title: const Text("Define your face shape"),
          centerTitle: true,*/
          toolbarHeight: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: false,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close),
                    ),
                  ),
                ],
              ),
                const Column(
                    children: [
                      Text('DEFINE YOUR',
                          style: TextStyle(
                            height: 0,
                            fontSize: 27,
                            fontFamily: 'montserrat'
                          ),),
                      Text(
                         'FACE SHAPE',
                         style: TextStyle(
                           height: 0,
                           fontSize: 27,
                           color: Color.fromARGB(255, 182, 127, 98),
                           fontFamily: 'montserrat'
                         ),
                       ),
                    ],
                  ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OvalFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/11.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Oval face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RectangleFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/12.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Rectangle face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RoundFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/21.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Round face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SquareFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/22.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Square face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HearthFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/31.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Hearth face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DiamondFaceResult(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: deco,
                      width: 180,
                      height: 210,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: const Image(
                              fit: BoxFit.fill,
                              width: 170,
                              height: 170,
                              image: AssetImage('images/32.png'),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 5),
                            child: const Text("Diamond face",style: TextStyle(fontFamily: 'montserrat'),),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }
}
