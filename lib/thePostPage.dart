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
               color: Color.fromARGB(255, 241, 241, 241),
                child: Stack(
                            children: [
                             
                              Image.memory(lePost.image, fit: BoxFit.contain, ),
                               IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                color: Color.fromARGB(255, 32, 32, 32),
                              ),
                            ],
                          ),),
             ),
               Expanded(
              flex: 4,
               child: Container(
               color: Color.fromARGB(255, 202, 152, 152),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: 4,
                      color: Color.fromARGB(255, 139, 139, 139),),
                      Text(lePost.title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      SizedBox(height: 10,),
                      Text(lePost.caption),
                     
                      
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
/*Flexible(
                       child: FractionallySizedBox(
                        widthFactor: 1,
                        heightFactor: 0.7,
                        child:
                        Container(
                          alignment: Alignment.center,
                          height: 700,
                          child: Stack(
                            children: [
                             
                              Image.memory(lePost.image),
                               IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.arrow_back_ios_rounded),
                                color: const Color.fromARGB(255, 255, 255, 255),
                              ),
                            ],
                          ),
                        )
                        ),
                     ), 
                     Flexible(child: FractionallySizedBox(
                widthFactor: 1,
                child: Container(
                  height: 3,
                  color: Color.fromARGB(255, 201, 201, 201),
                ),
              )),
              Container(
                    child:  SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(lePost.title),
                          SizedBox(height: 5,),
                          Text(lePost.caption),
                        ],
                      ),
                    ),
                ),*/
