import 'package:bigcart/screens/profile/aboutme/aboutme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: height*.18,
                color: Colors.white,
              ),
               Center(
                 child: Padding(
                   padding: EdgeInsets.symmetric(horizontal: width*.07),
                   child: Column(
                      children: [
                        SizedBox(height: height*.095,),
                        ClipOval(
                          child: Image.asset('assets/categories/banner.png',
                            height: height*.13,
                            width: height*.13,
                            fit: BoxFit.fill,),
                        ),
                        SizedBox(height: height*.02,),
                        Text('Sami awad',style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: height*.007,),
                        Text('samywd699@gmail.com',style: TextStyle(
                          fontSize: 12,
                        color: Colors.grey
                        ),),
                        SizedBox(height: height*.05,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.person_alt_circle,title: 'About me'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.clock,title: 'My Orders'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.heart,title: 'My Favorites'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.location_solid,title: 'My Address'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.creditcard,title: 'My Cards'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.money_dollar_circle,title: 'Transactions'),
                        SizedBox(height: height*.02,),
                        _buildRow(context:context,width:width,icon: CupertinoIcons.bell,title: 'Notification'),
                        SizedBox(height: height*.02,),
                   Row(
                     children: [
                       Icon(CupertinoIcons.arrow_uturn_left_circle,color: HexColor('#28B446'),),
                       SizedBox(width: width*.07,),
                       Text('Sign out',style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.bold
                       ),),],)
                      ],

                                 ),
                 ),
               )
            ],
          )
        ],
      ),
    );
  }

  InkWell _buildRow({
    required width,
    required icon,
    required title,
    required context,
}) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutMe()));
      },
      child: Row(
                          children: [
                            Icon(icon,color: HexColor('#28B446'),),
                            SizedBox(width: width*.07,),
                            Text(title,style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold
                            ),),
                            Spacer(),
                            Icon(CupertinoIcons.right_chevron,color: HexColor('#28B446'),)
                          ],
                        ),
    );
  }
}
