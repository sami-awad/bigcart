import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({super.key});

  @override
  State<AboutMe> createState() => _AboutMeState();
}
bool _isobscure = true;

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: HexColor('#F4F5F9'),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Text ('About me'),
        centerTitle: true,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: width*.04,vertical: height*.032),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Personal Details',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: height*.01,),
              _buildContainer(height:height, width:width,icon: CupertinoIcons.person_alt_circle,title: 'Enter your name'),
              SizedBox(height: height*.01,),
              _buildContainer(height:height, width:width,icon: CupertinoIcons.mail,title: 'for_example@gmail.com'),
              SizedBox(height: height*.01,),
              _buildContainer(height:height, width:width,icon: CupertinoIcons.phone,title: '1213 121 1232'),
              SizedBox(height: height*.025,),
              Text('Change Password',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              SizedBox(height: height*.015,),
              Container(
              height: height*.072,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.lock,color: Colors.grey,),
                    hintText: 'Current password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            ),
              SizedBox(height: height*.01,),
              Container(
              height: height*.072,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),child: Center(
                  child: TextField(
                    obscureText: _isobscure,
                    decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.lock,color: Colors.grey,),
                    suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            _isobscure=!_isobscure;
                          });
                        },
                        child: Icon(_isobscure?Icons.visibility_off:Icons.visibility)),
                    hintText: '********',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            ),
              SizedBox(height: height*.01,),
              Container(
              height: height*.072,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                    prefixIcon: Icon(CupertinoIcons.lock,color: Colors.grey,),
                    hintText: 'Confirm password',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none
                    )
                ),
              ),
            ),
            ),
              SizedBox(height: height*.1,),
              Container(
                height: height*.07,
                width: width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(colors: [
                      HexColor('#ABDB7D'),
                      HexColor('#6FC622'),
                    ]),
                    boxShadow: [
                      BoxShadow(
                          color:HexColor('#ABDB7D'),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: const Offset(1, 2)
                      )
                    ]
                ),child:Padding(
                padding:  EdgeInsets.symmetric(horizontal:width*.04),
                child: Center(
                  child: Text('save settings',style: TextStyle(fontSize: 15,color: Colors.white),),
                )
              ) ,
              ),
            ],
          ),
        ),
      ) ,

    );
  }

  Container _buildContainer({
    required  height,
    required  width,
    required  icon,
    required  title,
  }) {
    return Container(
            height: height*.072,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8)
            ),child: Center(
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(icon,color: Colors.grey,),
                hintText: title,
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                  borderSide: BorderSide.none
                )
              ),
            ),
          ),
          );
  }
}
