
import 'package:design/pages/Profile.dart';
import 'package:design/pages/chats.dart';
import 'package:design/pages/saved.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../theme/colors.dart';
import 'dart:math'as math;

import 'home.dart';

class Routepage extends StatefulWidget {
  @override
  _RoutepageState createState() => _RoutepageState();
}

class _RoutepageState extends State<Routepage> {
  int activeTap=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: getFooter(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: floatingActionButton(),
      body:getbody()
    );
  }


  Widget getFooter(){
    return Container(
      width: double.infinity,
      height: 90,
      decoration: BoxDecoration(
        boxShadow:[
        BoxShadow(
          color: grey.withOpacity(0.1),
          spreadRadius:1,
          blurRadius: 20.0,
          offset:Offset(0,1),
        ),
  ],
        color: white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
        child: Row(
          mainAxisAlignment:MainAxisAlignment.spaceBetween ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(

              children: [
                InkWell(
                  onTap: (){
                    setState(() {
                      activeTap=0;
                    });
                  },
                    child: Icon (Feather.home,size: 25,color:activeTap==0?primary:black)),
                SizedBox(
                  width: 55,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        activeTap=1;
                      });
                    },
                    child: Icon (MaterialIcons.chat_bubble_outline,size: 25,color:activeTap==1?primary:black)),


              ],

            ),
            Row(
              children: [
                InkWell(
                    onTap: (){
                      setState(() {
                        activeTap=3;
                      });
                    },
                    child: Icon (Feather.heart,size: 25,color:activeTap==3?primary:black)),
                SizedBox(
                  width: 55,
                ),
                InkWell(
                    onTap: (){
                      setState(() {
                        activeTap=4;
                      });
                    },
                    child: Icon (MaterialIcons.account_circle,size: 28,color:activeTap==4?primary:black)),
              ],
            ),
          ],
        ),

      ),

    );
  }
  Widget floatingActionButton(){
    return InkWell(
      onTap: (){
        setState(() {
          activeTap=2;
        });
      },
      child: Transform.rotate(
        angle: math.pi/4,
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 15,
                offset: Offset(0,1),
              ),
            ],
            color: black,
            borderRadius: BorderRadius.circular(23),
          ),
          child: Center(
            child:Icon(Ionicons.md_add_circle_outline,
            color: white,
            size: 26,)
          ),
        ),
      ),
    );
  }
  Widget getbody(){
    return IndexedStack(
      index: activeTap,
      children: [
        Homepage(),
        chats(),

        Center(
          child :Text("3abath"),
        ),
        saved(),
        profile(),
      ],
    );
  }
}
