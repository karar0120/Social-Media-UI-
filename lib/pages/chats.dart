
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../data/userdata.dart';
import '../theme/colors.dart';

class chats extends StatefulWidget {
  @override
  _chatsState createState() => _chatsState();
}

class _chatsState extends State<chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(preferredSize:Size.fromHeight(0),
      child: getAppbar(),),
      body: getBody(),
    );
  }

  Widget getAppbar(){
    return AppBar(
    backgroundColor: white,
    elevation: 0.0,
    );
  }

  Widget getBody(){
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(left: 25,right: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text("Messages",style: TextStyle(
              color: black,
              fontWeight: FontWeight.bold,
              fontSize: 25
            ),),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 15,
                    spreadRadius:2,
                    color: Colors.grey.withOpacity(0.2),
                    offset: Offset(0,1),
                  )
                ]
              ),
              child: Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    IconButton(
                        onPressed: (){}, icon: Icon(Feather.search,color: black,)),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        cursorColor: black,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for contacts",
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    )
                  ],
              ),
            ),
            SizedBox(
              height: 40,
            ),

            Column(
              children: List.generate(usersList.length, (index) {
                return  Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                        color: white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(33),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15,
                            spreadRadius:2,
                            color: Colors.grey.withOpacity(0.15),
                            offset: Offset(0,1),
                          )
                        ]
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            border: Border.all(color: black),
                          ),
                          child: Center(
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  image: DecorationImage(
                                    image: NetworkImage("${usersList[index]['img']}"),
                                    fit: BoxFit.cover,

                                  )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child:Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${usersList[index]['name']}",style: TextStyle(fontSize: 15,color: black),
                              ),SizedBox(
                                height: 5,
                              ),
                              Text(
                                  "${usersList[index]['message']}",style: TextStyle(fontSize: 14,color: black.withOpacity(0.5))
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
