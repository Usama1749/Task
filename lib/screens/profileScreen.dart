import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:assignment/profile.dart';
import 'package:assignment/profile_api.dart';


class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
              color: Colors.black,
              icon: Icon(Icons.arrow_back_ios,size: 22,),
              onPressed: () {}),
          title: Padding(
            padding: EdgeInsets.only(left: screenWidth * 0.24),
            child: Text(
              'Profile',
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
            ),
          ),
          actions: [
           IconButton(
             onPressed: (){

             },
             icon: Icon(Icons.search,size: 27,color: Colors.black,),
           ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth*0.05),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight*0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/dp.jpg'),
                        maxRadius: 50,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: screenHeight*0.01),
                        child: Text('Tiana Rosser',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight*0.02),
                  child: Container(
                    child: FutureBuilder(
                      future: fetchWelcome(),
                      builder: (context, snapshot){
                        if(snapshot.hasData){
                          return ListView.builder(
                            itemCount: snapshot.data.length,
                          shrinkWrap: true,
                              itemBuilder: (BuildContext context, index){
                              Welcome welcome = snapshot.data[index];
                              return Text('${welcome.data}');
                              },
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ),
                ),
                Divider(thickness: 1,),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.02),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Text('438',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                          Text('Posts',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w300)),
                        ],
                      ),
                      SizedBox(width: screenWidth*0.27),
                      Column(
                        children: [
                          Text('298',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                          Text('Following'),
                        ],
                      ),
                      SizedBox(width: screenWidth*0.22),
                      Column(
                        children: [
                          Text('321K',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500)),
                          Text('Followers'),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 1,),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.03,right: screenWidth*0.03,top: screenHeight*0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      MaterialButton(
                        height: screenHeight*0.08,minWidth: screenWidth*0.4,
                        color: Colors.blue,
                        onPressed: (){},
                      child: Text('Follow',style: TextStyle(color: Colors.white),),
                      ),
                      SizedBox(width: screenWidth*0.02,),
                      MaterialButton(
                        shape: Border.all(width: 0.4,color: Colors.blue),
                        height: screenHeight*0.08,minWidth: screenWidth*0.4,
                        onPressed: (){},
                        child: Text('Message',style: TextStyle(color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth*0.02,top: screenHeight*0.02),
                  child: Row(
                    children: [
                      Text("Photos",style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w500),),
                      SizedBox(width: screenWidth*0.59,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(Icons.menu_sharp),
                          Icon(Icons.grid_view),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight*0.015),
                Container(
                  height: 400,
                  child: GridView.count(
                    primary: false,
                      // padding: const EdgeInsets.all(10),
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 5,
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    children: List.generate(9,(index){
                      return Container(
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          color: Colors.amber,
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
                              child: Image.asset('assets/images/abc.jpg',fit: BoxFit.fitHeight,)),
                        ),
                      );
                    }),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
