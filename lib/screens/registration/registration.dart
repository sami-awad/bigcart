import 'package:bigcart/screens/registration/login/login.dart';
import 'package:bigcart/screens/registration/signup/signup.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Registration extends StatelessWidget {
  const Registration({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: height*.65,
                width: width,
                child: Image.asset('assets/onboarding/registration2.jpeg',fit: BoxFit.fill,),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: height*.4,
                width: width,
                decoration: BoxDecoration(
                    color: HexColor('#F4F5F9'),
                    borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(20),
                        topRight:Radius.circular(20) )
                ),child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*.04,),
                    Text('Welcome',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),),
                    Text('Welcome to our grocery store ',style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey
                    ),),
                    SizedBox(height: height*.03,),
                    Container(
                      height: height*.07,
                      width: width*.9,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white
                      ),child:Padding(
                        padding:  EdgeInsets.symmetric(horizontal:width*.07),
                        child: Row(
                        children: [
                          Image.asset('assets/icons/google.png'),
                          SizedBox(width: width*.12,),
                          Text('Continue with google',style: TextStyle(
                            fontSize: 20
                          ),)
                        ],
                                            ),
                      ) ,
                    ),
                    SizedBox(height: height*.03,),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                      },
                      child: Container(
                        height: height*.07,
                        width: width*.9,
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
                              offset: Offset(1, 2)
                            )
                          ]
                        ),child:Padding(
                          padding:  EdgeInsets.symmetric(horizontal:width*.07),
                          child: Row(
                          children: [
                            Image.asset('assets/icons/person.png'),
                            SizedBox(width: width*.12,),
                            Text('Create an account',style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),)
                          ],
                                              ),
                        ) ,
                      ),
                    ),
                    SizedBox(height: height*.015,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account ?    ',style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey
                        ),),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
                          },
                          child: Text('Login',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    )
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
}
