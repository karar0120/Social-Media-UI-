
import 'package:flutter/material.dart';

import '../data/postsjson.dart';
import '../theme/colors.dart';

class saved extends StatefulWidget {
  @override
  _savedState createState() => _savedState();
}

class _savedState extends State<saved> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(preferredSize:Size.fromHeight(0),child: getAppbar(),),
      body: getBody(),
    );
  }
  Widget getAppbar(){
    return AppBar(
      backgroundColor: white,
      elevation:0.0 ,
    );
  }
  Widget getBody(){
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 25,left: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),

            Text("Saved",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: black
            ),
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: List.generate(postsList.length, (index) {
                return Container(
                  width:(size.width-70)/2 ,
                  height:(size.width-70)/2,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0,1),
                          blurRadius:15 ,
                          spreadRadius: 2,
                          color: grey.withOpacity(0.4),
                        )
                      ],
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage("${postsList[index]['postImg']}"),
                          fit: BoxFit.cover
                      )
                  ),
                );
              }),
            ),



          ],
        ),
      ),
    );
  }
}
