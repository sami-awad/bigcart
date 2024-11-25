import 'package:bigcart/screens/homescreen/homescreen.dart';
import 'package:bigcart/screens/homescreen/widgets/bottom_navigation_bar.dart';
import 'package:bigcart/screens/registration/login/cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:bigcart/screens/homescreen/search/search.dart';
import '../registration.dart';
import '../signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _SignUpState();
}
bool _obscureText = true;

class _SignUpState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailcontroller = TextEditingController();
    final TextEditingController _passwordcontroller = TextEditingController();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    // if(state is LoginSuccess){
    // //  _showsuccessdialog(context);
    //  Future.delayed(Duration(seconds: 2),(){
    //    Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomBar()));
    //  });
    // }
  },
  builder: (context, state) {
    return BlocBuilder<LoginCubit, LoginState>(
  builder: (context, state) {
    final cubit= context.read<LoginCubit>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height:height*.6,
            width: width,
            child: Image.asset('assets/registration/login.png',fit: BoxFit.fill,),
          ),
          Column(
            children: [
              const Spacer(),
              Container(
                height: height*.465,
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
                    SizedBox(height: height*.04,),
                    const Text('Welcome back !',style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),),
                    const Text('sign in to your account ',style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey
                    ),),
                    SizedBox(height: height*.04,),
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
                    SizedBox(height: height*.03,),
                    InkWell(
                      onTap: (){
                        cubit.login(
                            email: _emailcontroller.text,
                            password: _passwordcontroller.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginCheck()));
                        print(cubit.loginmodel.status);
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
                          child: Text('Login',style: TextStyle(
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
                        const Text('Dont have an account ?    ',style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey
                        ),),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> const SignUp()));
                          },
                          child: const Text('Sign up',style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          ),),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  },
);
  },
);
  }
}

void _showsuccessdialog(BuildContext context){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Success'),
          content: Text('Welcome back to our app'),
        );
      });
}