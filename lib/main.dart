import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_1/personalColorTest.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/faceshapetest.dart';

void main()  async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(home: myapp()),
  );
}

class myapp extends StatelessWidget {
  final BoxDecoration deco = BoxDecoration(
    border: Border.all(
      color: const Color.fromARGB(0, 8, 0, 121),
      width: 2,
    ),
    color: const Color.fromARGB(90, 207, 207, 207),
    borderRadius: BorderRadius.circular(10),
  );

  myapp({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 237, 225),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*Container(
              padding: const EdgeInsets.only(top: 0, bottom: 10),
              margin: const EdgeInsets.only(
                  left: 70, right: 70, top: 20, bottom: 20),
              child: const Text(
                "WELCOME TO",
                style: TextStyle(fontSize: 40, fontFamily: "Montserrat"),
              ),
            ),*/
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 0, bottom: 30),
              child: const Image(
                width: 170,
                height: 170,
                image: AssetImage('images/fa.png'),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, bottom: 5),
              margin: const EdgeInsets.only(top: 0, bottom: 15),
              child: const Image(
                width: 300,
                height: 300,
                image: AssetImage('images/WomanChoosing.png'),
              ),
            ),

            MouseRegion(
              
              cursor: SystemMouseCursors.click,
              child: Container(
                
                margin: const EdgeInsets.only(top: 0, bottom: 10),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const personalColorTest()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    decoration: BoxDecoration(color: const Color.fromARGB(255,161, 188, 180),
                    borderRadius: BorderRadius.circular(10),),
                    padding: const EdgeInsets.only(
                        top: 20, left: 30, right: 30, bottom: 20),
                    child: const Text("PERSONAL COLOR", style: TextStyle(color: Colors.white,fontFamily: 'montserrat' ),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5,),
            MouseRegion(
              
              cursor: SystemMouseCursors.click,
              child: Container(
                margin: const EdgeInsets.only(top:5, bottom: 10),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const facetest(),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 200,
                    decoration: BoxDecoration(color: const Color.fromARGB(255,182, 127, 98),
                    borderRadius: BorderRadius.circular(10),),
                    padding: const EdgeInsets.only(
                        top: 20, left: 50, right: 50, bottom: 20),
                    child: const Text(" FACE SHAPE ", style: TextStyle(color: Colors.white,fontFamily: 'montserrat' ),),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 70,),
          ],
        ),
      ),
    );
  }
}
