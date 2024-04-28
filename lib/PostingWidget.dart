import 'dart:ffi';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SelectLeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectLeImage();
}

class _SelectLeImage extends State<SelectLeImage> {
  Uint8List? _image;
  @override
  Widget build(BuildContext context) {
    void selectImage() async {
      Uint8List? img = await pickImage(ImageSource.gallery);
      print("here img");
      print(img);
      setState(() {
        _image = img;
        print("setting");
        print(_image);
        PostingPage._image = img;
        PostingPage.checkImage();
      });
    }

    Widget checkNullImage() {
      print(_image);
      if (_image == null) {
        print("Icon");
        return Transform.scale(
            scale: 1.75,
            child: Icon(
              Icons.add_outlined,
              color: Color.fromARGB(255, 156, 156, 156),
            ));
      } else {
        print("Memo");
        print(_image);
        return Image.memory(
          _image!,
          width: 180,
          height: 180,
        );
      }
    }

    return SizedBox(
      width: 180,
      height: 180,
      child: OutlinedButton(
        onPressed: () {
          selectImage();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: checkNullImage(),
      ),
    );
  }
}

class PostingPage extends StatelessWidget {
  TextEditingController _titleTec = TextEditingController();
  TextEditingController _captionTec = TextEditingController();
  static Uint8List? _image;
  String warning = "";
  static void checkImage() {
    print("Image Down Down Down");
    print(_image);
    print("Image UP UP UP");
  }

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
                  onPressed: () {
                    String _title = _titleTec.text;
                    String _caption = _captionTec.text;

                    if (_title != "" && _caption != "" && _image != null) {
                      print(_title + " |***and***|" + _caption);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          actions: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Close"))
                          ],
                          title: const Text("Please fill all form"),
                        ),
                      );
                    }
                  },
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
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: TextField(
                    controller: _titleTec,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(hintText: "Title"),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: TextField(
                    controller: _captionTec,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "tap to add caption"),
                    minLines: 1, // Set this
                    maxLines: 10, // and this
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              SelectLeImage(),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("1 to 1 image is recomanded")],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
