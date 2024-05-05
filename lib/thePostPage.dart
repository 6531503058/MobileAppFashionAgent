import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/PostItem.dart';


class thePostingPage extends StatelessWidget {
  
  final PostItem lePost;
  const thePostingPage({super.key, required this.lePost });


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

             Expanded(
              flex: 6,
               child: Container(alignment: Alignment.center,
               color: const Color.fromARGB(255, 241, 241, 241),
                child: Stack(
                            children: [
                             
                              Image.network(lePost.imageUrl, fit: BoxFit.contain, ),
                               IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                color: const Color.fromARGB(255, 32, 32, 32),
                              ),
                            ],
                          ),),
             ),
               Expanded(
              flex: 4,
               child: Container(
              // color: Color.fromARGB(255, 233, 233, 233),
              decoration: const BoxDecoration( gradient: LinearGradient( begin: Alignment.topRight,
              end: Alignment.bottomLeft,colors: [Color.fromARGB(255, 255, 255, 255), Color.fromARGB(255, 255, 255, 255),],),),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 4,
                      color: const Color.fromARGB(255, 255, 255, 255),),//139
                      FractionallySizedBox(
                        widthFactor: 0.75,
                        child: Column(children: [Text(lePost.title, style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'montserrat'),),
                      const SizedBox(height: 5,),
                      Text("author: ${lePost.author}", style: const TextStyle(fontFamily: 'montserrat'),),
                      const SizedBox(height: 10,),
                      Text(lePost.caption, textAlign: TextAlign.center,style: const TextStyle(fontFamily: 'montserrat'),),],),),
                      
                     
                      
                    ],
                  ),
                ),),
             ),
                
          
            
            ],
          ),
        ),
      ),
      ),
    ),);
  }
}

