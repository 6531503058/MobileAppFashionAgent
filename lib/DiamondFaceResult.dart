import 'package:flutter/material.dart';

class DiamondFaceResult extends StatelessWidget {
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

  DiamondFaceResult({super.key});

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Container(
                    height: 40,
                    width: 175,
                    decoration: decoTitle,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Diamond Face')],
                    ),
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
                      icon: const Icon(Icons.keyboard_arrow_left),
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 240,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "It's a narrow-faced shape without small angles or prominent cheekbones, featuring a wide cheek area, narrow forehead, and pointed chin."),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      width: 190,
                      height: 190,
                      fit: BoxFit.fill,
                      image: AssetImage("images/d1.png"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 190,
                    decoration: deco,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        fit: BoxFit.fill,
                        width: 65,
                        height: 70,
                        image: AssetImage("images/d11.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 190,
                    decoration: deco,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        fit: BoxFit.fill,
                        width: 65,
                        height: 70,
                        image: AssetImage("images/d12.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 160,
                    height: 190,
                    decoration: deco,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        fit: BoxFit.fill,
                        width: 65,
                        height: 70,
                        image: AssetImage("images/d21.png"),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 190,
                    decoration: deco,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: const Image(
                        fit: BoxFit.fill,
                        width: 65,
                        height: 70,
                        image: AssetImage("images/d22.png"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}