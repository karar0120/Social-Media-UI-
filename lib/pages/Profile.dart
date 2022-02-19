
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:video_player/video_player.dart';

import '../data/me_post_json.dart';
import '../data/postsjson.dart';
import '../theme/colors.dart';

class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  bool isphoto=true;
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.network('${meVideoList[0]['videoUrl']}');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(preferredSize: Size.fromHeight(0),child:getAppBar(
      )),
      body: getBody(),
    );
  }
  Widget getAppBar(){
    return AppBar(
      backgroundColor: white,
      elevation: 0.0,
    ) ;
  }
  Widget getBody(){
    var size=MediaQuery.of(context).size;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: 180,
            color: primaryLight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                        ),
                        fit: BoxFit.cover
                      ),
                      borderRadius: BorderRadius.circular(28),
                      border: Border.all(color: black),
                     /* boxShadow: [
                        BoxShadow(
                          offset: Offset(0,1),
                          blurRadius: 15,
                          spreadRadius: 2,
                          color: grey.withOpacity(0.5),
                        ),
                      ]*/
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Jonh Doe",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: black
                ),),
                Text("@jonhdoe",style: TextStyle(
                    //fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: black
                ),)
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text("Posts",style: TextStyle(fontSize: 15,color: black),),
                    SizedBox(
                      height: 8,
                    ),
                    Text('35',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)
                  ],
                ),
                Column(
                  children: [
                    Text("Followers",style: TextStyle(fontSize: 15,color: black)),
                    SizedBox(
                      height: 8,
                    ),
                    Text('1,552',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)
                  ],
                ),
                Column(
                  children: [
                    Text("Follows",style: TextStyle(fontSize: 15,color: black)),
                    SizedBox(
                      height: 8,
                    ),
                    Text('182',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,

                    ),)
                  ],
                )
            ],),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (){
                    setState(() {
                      isphoto=true;
                    });
                  },
                  icon: Icon(Foundation.photo,
                  size: 25,
                  color: isphoto?primary:black,)),
              IconButton(
                  onPressed: (){
                    setState(() {
                      isphoto=false;
                    });
                  },
                  icon: Icon(Foundation.play_video,
                    size: 25,
                    color: !isphoto?primary:black,))
            ],
          ),
          SizedBox(
            height: 30,
          ),
          isphoto?Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(mePostList.length, (index) {
              return Container(
                width: (size.width-60)/2,
                height: (size.width-60)/2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(

                    image: NetworkImage(mePostList[index]),
                    fit:BoxFit.cover
                  ),
                ),

              );
            }),
          ):Wrap(
            spacing: 15,
            runSpacing: 15,
            children: List.generate(meVideoList.length, (index) {
              return InkWell(
                onTap: (){
                  PlayVideo(context,meVideoList[index]['videoUrl']);
                },
                child: Container(
                  width: (size.width-60)/2,
                  height: (size.width-60)/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(

                        image: NetworkImage(meVideoList[index]['img']),
                        fit:BoxFit.cover
                    ),
                  ),
                  child: Center(
                    child: Icon(AntDesign.playcircleo,
                    size: 40,
                    color: white,),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
  PlayVideo(context,String videoUrl){
    _controller = VideoPlayerController.network('$videoUrl');

    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
    showDialog(context: context, builder: (context)=>AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: AspectRatio(aspectRatio: _controller.value.aspectRatio,child:VideoPlayer(
        _controller
      ),),
    ));
  }


}
