import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/faceshapetest.dart';
import 'package:flutter_application_1/third.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 0, bottom: 30),
              margin: const EdgeInsets.only(
                  left: 70, right: 70, top: 20, bottom: 20),
              child: const Text(
                "Welcome to",
                style: TextStyle(fontSize: 45, fontFamily: "Montserrat"),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 30),
              child: const Image(
                image: AssetImage('images/fa.png'),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
                child: InkWell(
                  customBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const third()));
                  },
                  child: Container(
                    decoration: deco,
                    padding: const EdgeInsets.only(
                        top: 20, left: 50, right: 50, bottom: 20),
                    child: const Text("Personal Color"),
                  ),
                ),
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                margin: const EdgeInsets.only(top: 20, bottom: 20),
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
                    decoration: deco,
                    padding: const EdgeInsets.only(
                        top: 20, left: 50, right: 50, bottom: 20),
                    child: const Text("   Face Shape   "),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
