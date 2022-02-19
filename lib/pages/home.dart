import 'package:design/data/postsjson.dart';
import 'package:design/data/userdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../theme/colors.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(60),child:getappbar()),

      body: getbody(),
    );
  }



  Widget getappbar(){
    return AppBar(
      elevation: 0.0,
      backgroundColor: white,
      title: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Social UI KIT",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: black,
            ),),
            IconButton(onPressed:(){},
                icon:Icon(Feather.bell,size: 25,color:black))
          ],
        ),
      ),
    );
  }

  Widget  getbody(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Feed",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Container(
                        width: 58,
                        height: 58,
                        decoration:BoxDecoration(
                            shape: BoxShape.circle,
                            gradient:LinearGradient(colors:[Color(0xFFFFE0DF),Color(0xFFE1F6F4)])
                        ),
                        child:Center(
                          child: Icon(Icons.add,size: 28,color: black,),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Row(
                        children: List.generate(usersList.length, (index) {
                          return  Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Container(
                                width: 58,
                                height: 58,
                                decoration:BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: NetworkImage("${usersList[index]['img']}"),
                                      fit: BoxFit.cover,
                                    )
                                )
                            ),
                          );
                        }),
                      ),
                    ],
                  ),

                ),
                SizedBox(
                  height: 30.0,
                ),
                Column(

                )
            ],),
            SizedBox(
              height:5,
            ),
            Column(
              children: List.generate(postsList.length, (index) {
                return  Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 228,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              spreadRadius: 5,
                              blurRadius: 15,
                              offset: Offset(0,1),
                              color: Colors.grey.withOpacity(0.4),
                            )
                          ],
                          image:DecorationImage(
                            image: NetworkImage("${postsList[index]['postImg']}"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 228,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: black.withOpacity(0.25),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 228,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          //color: black.withOpacity(0.25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage:NetworkImage("${postsList[index]['img']}") ,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("${postsList[index]['name']}",style: TextStyle(fontSize: 15,color:white),),
                                          SizedBox(
                                            height: 3.0,
                                          ),
                                          Text("${postsList[index]['time']}",style: TextStyle(fontSize: 13,color:white.withOpacity(0.8)),)
                                        ],
                                      )
                                    ],
                                  ),
                                  Icon(Entypo.dots_three_vertical,color: white,size: 20,)
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                      width: 70,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E5E5).withOpacity(0.5),
                                        borderRadius:BorderRadius.circular(27),
                                      ),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Feather.heart,color: white,size: 14,),
                                          Text("${postsList[index]['like']}",style:TextStyle(
                                              color: white,
                                              fontSize: 13
                                          ) ,)
                                        ],
                                      )
                                  ),
                                  Container(
                                      width: 70,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E5E5).withOpacity(0.5),
                                        borderRadius:BorderRadius.circular(27),
                                      ),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(MaterialIcons.chat_bubble_outline,color: white,size: 14,),
                                          Text("${postsList[index]['comment']}",style:TextStyle(
                                              color: white,
                                              fontSize: 13
                                          ) ,)
                                        ],
                                      )
                                  ),
                                  Container(
                                      width: 70,
                                      height: 27,
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE5E5E5).withOpacity(0.5),
                                        borderRadius:BorderRadius.circular(27),
                                      ),
                                      child:Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.share,color: white,size: 14,),
                                          Text("${postsList[index]['share']}",style:TextStyle(
                                              color: white,
                                              fontSize: 13
                                          ) ,)
                                        ],
                                      )
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      )

                    ],
                  ),
                );
              })
            )
          ],
        ),
      ),
    );
  }

}
