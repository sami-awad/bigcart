import 'package:bigcart/screens/registration/login/login.dart';
import 'package:bigcart/screens/registration/signup/cubit/sign_up_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

import '../registration.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}
bool _obscureText = true;

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _phonecontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    final TextEditingController _namecontroller = TextEditingController();
    final signupcubit= context.read<SignUpCubit>();
    return  BlocConsumer<SignUpCubit, SignUpState>(
  listener: (context, state) {
    if(state is SignUpSuccess){
      _showsuccessdialog(
          context: context,
          title: 'Success',
          content: 'Welcome to our store');
      Future.delayed(Duration(seconds: 2),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
      });
    }else if (state is SignUpError){
      _showsuccessdialog(
          context: context,
          title: 'Error',
          content: '${signupcubit.signUpModel.message}');
    }
  },
  builder: (context, state) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:height*.6,
            width: width,
            child: Image.asset('assets/registration/signup.png',fit: BoxFit.fill,),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                height: height*.6,
                width: width,
                decoration: BoxDecoration(
                  color: HexColor('#F4F5F9'),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: width*0.07),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*.025,),
                    const Text('Create account',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                    const Text('Quickly create account ',style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                    ),),
                    SizedBox(height: height*.02,),
                     TextField(
                       controller: _namecontroller,
                        decoration: InputDecoration(
                          prefixIcon:const Icon(CupertinoIcons.person,color: Colors.grey,) ,
                          hintText: ('Enter Your Name'),
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                      ),
                    SizedBox(height: height*.02,),
                    //email
                    TextField(
                       controller: _emailcontroller,
                        decoration: InputDecoration(
                          prefixIcon:const Icon(CupertinoIcons.mail,color: Colors.grey,) ,
                          hintText: ('Email address'),
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                      ),
                    SizedBox(height: height*.02,),
                     //phone
                     TextField(
                       controller: _phonecontroller,
                        decoration: InputDecoration(
                          prefixIcon:const Icon(CupertinoIcons.phone,color: Colors.grey,) ,
                          hintText: ('Phone number'),
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                      ),
                    SizedBox(height: height*.02,),
                     //password
                     TextField(
                       controller: _passwordcontroller,
                       obscureText: _obscureText,
                        decoration: InputDecoration(
                          prefixIcon:const Icon(CupertinoIcons.lock,color: Colors.grey,) ,
                          hintText: ('********'),
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          suffixIcon: IconButton(
                              icon : Icon(_obscureText?Icons.visibility : Icons.visibility_off,),
                            onPressed: (){
                                setState(() {
                                  _obscureText=!_obscureText;
                                });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15)
                          )
                        ),
                      ),
                    SizedBox(height: height*.02,),
                    InkWell(
                      onTap: (){
                        signupcubit.signup(
                          name: _namecontroller.text,
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text,
                            phone: _phonecontroller.text);
                        print(signupcubit.signUpModel.message);
                      },
                      child: Container(
                        height: height*.06,
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
                                  offset: const Offset(1, 2)
                              )
                            ]
                        ),child:const Padding(
                        padding: EdgeInsets.symmetric(horizontal:40),
                        child: Center(
                          child: Text('Sign UP',style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white
                          )
                          ),
                        ),
                      ) ,
                      ),
                    ),
                    SizedBox(height: height*.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ?    ',style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                        ),),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                          },
                          child: const Text('Login',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    )
                  ],),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  },
);
  }
}

void _showsuccessdialog({
  required BuildContext context,
  required String title,
  required String content,

}){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text(title),
          content: Text(content),
        );
      });
}