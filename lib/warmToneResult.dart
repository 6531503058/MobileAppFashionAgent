import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/PostingWidget.dart';
import 'package:flutter_application_1/model/PostItem.dart';
import 'package:flutter_application_1/thePostPage.dart';
import 'package:http/http.dart' as http;

class PostFeed extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PostFeed();
}

class _PostFeed extends State<PostFeed> {
  List<PostItem> _posts = [];
   final String _dataTarget = 'image-post-warm.json';
   final String _storageTarget = "warm-img";
  @override
  void initState() {
    print("init");

    super.initState();
    _loadPost();
  }

  void _loadPost() async {
    final url = Uri.https('fashionagent-ff669-default-rtdb.firebaseio.com',
        _dataTarget);
    final respond = await http.get(url);
    final Map<String, dynamic> listData = json.decode(respond.body);
    final List<PostItem> _loadedPost = [];
    for (final item in listData.entries) {
      print("Lee image down");
      String leImage = item.value['image-url'];
      print("Lee image up");
      _loadedPost.add(PostItem(
          title: item.value['title'],
          caption: item.value['caption'],
          imageUrl: leImage,
          date: item.value['date'],
          id: item.key));
    }

    setState(() {
      _posts = _loadedPost;
      print("Check Post");
      print(_posts);
    });

    print(
        "*****************************************__Respond__******************************");
    print(respond.body);
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        color: Color.fromARGB(255, 233, 233, 233),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (ctx, index) => Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 241, 241, 241),
                            borderRadius: BorderRadius.circular(10)),
                        child: FractionallySizedBox(
                          widthFactor: 0.75,
                          child: FractionallySizedBox(
                            widthFactor: 0.8,
                            child: InkWell(
                              onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => thePostingPage(lePost: _posts[index]),
                        ),
                      );
                    },
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.network(_posts[index].imageUrl)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                        color: Color.fromARGB(255, 233, 233, 233),
                      )
                    ],
                  )
              /*ListTile(
              title: Text(_posts[index].title),
              leading: Container(child: Image.memory(_posts[index].image)),
            ),*/
              ),Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostingPage( dataTarget: _dataTarget,storageTarget: _storageTarget,),
                              ),
                            );
                          },
                          child: Transform.scale(
                            scale: 1.5,
                            child: Icon(Icons.add_outlined, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Color.fromARGB(255, 216, 198, 185),
                            fixedSize: Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
          ],),

        ]),
      ),
    );
  }
}

class  WarmToneResult extends StatelessWidget {

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

   WarmToneResult({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                    icon: const Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Container(
                    height: 40,
                    width: 175,
                    decoration: decoTitle,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('Warm Tone')],
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

              /*Here*/
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 120,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "You are warm tone"),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      width: 120,
                      height: 120,
                      fit: BoxFit.fill,
                      image: AssetImage("images/warmpat.png"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Flexible(
                child: PostFeed(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
