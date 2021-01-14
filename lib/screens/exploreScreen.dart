import 'dart:ui';
import 'package:assignment/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:assignment/explore.dart';
import 'package:assignment/explore_api.dart';
import 'dart:developer';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.7,
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {}),
        title: Padding(
          padding: EdgeInsets.only(left: screenWidth * 0.24),
          child: Text(
            'Explore',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
        ),
        actions: [
          IconButton(
              color: Colors.black,
              icon: Icon(
                Icons.search,
                size: 37,
              ),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05,
            top: screenHeight * 0.045,
            right: screenWidth * 0.05),
        child: RepeatedColumn(screenWidth: screenWidth, screenHeight: screenHeight),
      ),
      // Padding(
      //   padding: EdgeInsets.only(
      //       left: screenWidth * 0.05,
      //       top: screenHeight * 0.045,
      //       right: screenWidth * 0.05),
      //   child: RepeatedColumn(screenWidth: screenWidth, screenHeight: screenHeight),
      // ),
    );
  }
}

class RepeatedColumn extends StatelessWidget {
 RepeatedColumn({this.screenHeight,this.screenWidth});

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: screenWidth * 0.02, top: screenHeight * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                    },
                    child: Text(
                      'Kristin Jones',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    '20 Minutes ago',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 17,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth * 0.35),
              child: Text(
                '. . .',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 19,
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.04, top: screenHeight * 0.04),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Icon(
                    Icons.messenger_outline_rounded,
                    size: 27,
                  )),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.05),
                child: Expanded(
                  child: FutureBuilder(
                    future: fetchWelcome(),
                    builder: (context, snapshot){
                      log('data in api 1: $snapshot');
                       if(snapshot.hasData){
                         return Text(' ${snapshot.data[0]}');
                        // return ListView.builder(
                        //   itemCount: snapshot.data.length,
                        //   shrinkWrap: true,
                        //   itemBuilder: (BuildContext context, index){
                        //     Welcome welcome = snapshot.data[index];
                        //     log('data in api 3: $snapshot');
                        //     return Container(
                        //         // height: 100,
                        //         // width: 100,
                        //         child: Text('${welcome.title}'));
                        //   },
                        // );
                       }
                      return CircularProgressIndicator();
                    },
                  ),
                ),
              ),

            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              left: screenWidth * 0.04, top: screenHeight * 0.02),
          child: Row(
            children: [
              Icon(
                Icons.phonelink_erase_rounded,
                size: 27,
              ),
              SizedBox(
                width: screenWidth * 0.06,
              ),
              Container(
                  // height: 200,
                  width: 300,
                  child: Image.asset(
                    'assets/images/abc.jpg',
                  )),
            ],
          ),
        ),
      ],
    );

  }
}
