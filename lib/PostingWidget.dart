import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:image_picker/image_picker.dart';



class SelectLeImage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _SelectLeImage();

}
class _SelectLeImage extends State<SelectLeImage>{
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    


    void selectImage() async{
    Uint8List? img = await pickImage(ImageSource.gallery);
    print("here img");
    print(img);
    setState(() {
       _image = img;
       print("setting");
       print(_image);
    });
    }
    Widget checkNullImage(){
      print(_image);
      if(_image == null)
      { print("Icon");
        return Transform.scale( scale: 1.75, child: Icon(Icons.add_outlined, color: Color.fromARGB(255, 156, 156, 156),));}
      
      else{print("Memo");
      print(_image);
      return Image.memory(_image!,width: 180,height: 180,);}
      
      
    }

    return SizedBox(
      width: 180,
      height: 180,
      child: OutlinedButton(
                  onPressed: () { selectImage(); },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                  ),
                  child:checkNullImage(),
                ),
    );
  }
  
}

class PostingPage extends StatelessWidget {
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

  PostingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Post",
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(hintText: "Title"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "tap to add caption"),
                    minLines: 1, // Set this
                    maxLines: 6, // and this
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              SelectLeImage(),
              SizedBox(height: 10,),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("1 to 1 image is recomanded")],)
            ],
          ),
        ),
      ),
    );
  }
}
