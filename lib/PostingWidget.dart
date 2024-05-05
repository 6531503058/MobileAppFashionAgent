import 'dart:io';
import 'dart:convert';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class SelectLeImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SelectLeImage();
}

class _SelectLeImage extends State<SelectLeImage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    void selectImage() async {
      final img = await pickImage(ImageSource.gallery);
      if (img == null) {
        return;
      }
      setState(() {
        _image = File(img.path);
        PostingPage._image = File(img.path);
      });
    }

    Widget checkNullImage() {
      if (_image == null) {
        return Transform.scale(
            scale: 1.75,
            child: const Icon(
              Icons.add_outlined,
              color: Color.fromARGB(255, 156, 156, 156),
            ));
      } else {
        return Image(image: FileImage(_image!));
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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
  final TextEditingController _titleTec = TextEditingController();
  final TextEditingController _captionTec = TextEditingController();
  final TextEditingController _authorTec = TextEditingController();
  static File? _image;
  String? _title;
  String? _caption;
  String? _imageUrl;
  String dataTarget;
  String storageTarget;
  String? _author;

  PostingPage(
      {super.key, required this.dataTarget, required this.storageTarget});



  void _savePost() async {
    final date = DateTime.now().millisecondsSinceEpoch.toString();
    final storageRef = FirebaseStorage.instance
        .ref()
        .child(storageTarget)
        .child('${date.toString()}.jpg');

    await storageRef.putFile(_image!);
    _imageUrl = await storageRef.getDownloadURL();

    final url =
        Uri.https('fashionagent-ff669-default-rtdb.firebaseio.com', dataTarget);
    final respone = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          'title': _title,
          'caption': _caption,
          'image-url': _imageUrl,
          'date': date,
          'author': _author,
          //Store image in the database because i got not much time left.
        },
      ),
    );
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
                    _title = _titleTec.text;
                    _caption = _captionTec.text;
                    _author = _authorTec.text;
                    if (_title != "" && _caption != "" && _image != null) {
                      if (_author == '' || _author == null) {
                        _author = "Anonymous";
                      }
                      _savePost();
                      Navigator.of(context).pop();
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
                          title: const Text("Please fill all required form", style: TextStyle(fontFamily: 'montserrat'),),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontFamily: "montserrat",
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
                        fontFamily: "montserrat",
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
                    decoration: const InputDecoration(hintText: "Title", hintStyle: TextStyle(fontFamily: 'montserrat')),
                  ),
                ),
              ),
              Flexible(
                child: FractionallySizedBox(
                  widthFactor: 0.75,
                  child: TextField(
                    controller: _authorTec,
                    textAlign: TextAlign.start,
                    decoration: const InputDecoration(
                        hintText: "author: (defaul Anonymous)",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600,fontFamily: 'montserrat')),
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
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "tap to add caption", hintStyle: TextStyle(fontFamily: 'montserrat')),
                    minLines: 1, // Set this
                    maxLines: 10, // and this
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
              SelectLeImage(),
              const SizedBox(
                height: 10,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("1 to 1 image is recomanded", style: TextStyle(fontFamily: 'montserrat'),)],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
