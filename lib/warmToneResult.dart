import 'dart:convert';
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
      String leImage = item.value['image-url'];
      _loadedPost.add(PostItem(
          title: item.value['title'],
          author: item.value['author'],
          caption: item.value['caption'],
          imageUrl: leImage,
          date: item.value['date'],
          id: item.key));
    }

    setState(() {
      _posts = _loadedPost;
    });

  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [GridView.builder(

              itemCount: _posts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (ctx, index) => Column(
                    children: [
                      
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.circular(0)),
                        child: FractionallySizedBox(
                          widthFactor: 0.9,
                          child: FractionallySizedBox(
                            widthFactor: 0.85,
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
                                borderRadius: BorderRadius.circular(0),
                                child: Image.network(_posts[index].imageUrl)),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        child: Text(_posts[index].title, style: const TextStyle(fontWeight: FontWeight.w800,fontFamily: 'montserrat'),),
                      ),
                    ],
                  )
              ),Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PostingPage( dataTarget: _dataTarget, storageTarget: _storageTarget ,),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: const Color.fromARGB(255, 216, 198, 185),
                            fixedSize: const Size(100, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              
                            ),
                          ),
                          child: Transform.scale(
                            scale: 1.5,
                            child: const Icon(Icons.add_outlined, color: Colors.white),
                          ),
                        ),
                        const SizedBox(height: 10,),
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
                   const SizedBox(
                    height: 40,
                    width: 175,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text('COOL TONE',textAlign: TextAlign.center, style: TextStyle(height: 0,color: Color.fromARGB(255, 182, 127, 98), fontSize: 24,fontWeight: FontWeight.w700, fontFamily: 'montserrat'),),],
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
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
                    height: 40,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "the colors we suggest",textAlign: TextAlign.center, style: TextStyle(fontFamily: 'montserrat'),),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: const Image(
                      width: 350,
                      
                      fit: BoxFit.fill,
                      image: AssetImage("images/platletWarm.png"),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  const Text(
                          "you can tap in picture for more detail",textAlign: TextAlign.center,
                          style: TextStyle(height: 0, fontSize: 12,fontFamily: 'montserrat'),
                        ),
                ],
              ),
               const SizedBox(height: 20,),
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
