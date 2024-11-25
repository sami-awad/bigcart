import 'dart:math';

import 'package:animated_icon/animated_icon.dart';
import 'package:bigcart/screens/homescreen/homescreen.dart';
import 'package:bigcart/screens/homescreen/widgets/bottom_navigation_bar.dart';
import 'package:bigcart/screens/registration/login/cubit/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class LoginCheck extends StatelessWidget {
  const LoginCheck({super.key});

  @override

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        if(state is LoginLoading){
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: Center(
              child: Container(
                height: height*.95,
                width: width*.95,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25)
                ),child:Center(
                child: Container(
                  height: height*.1,
                  width: width*.4,
                  child: LoadingIndicator(
                    indicatorType: Indicator.lineScalePulseOut,
                    colors: [
                      Colors.blue,
                      Colors.yellow,
                      Colors.blue,
                      Colors.orange,
                      Colors.green,
                      Colors.red,

                    ],
                  ),
                ),
              ) ,

              ),
            ),
          );
        }else if(state is LoginSuccess) {
          Future.delayed(const Duration(seconds: 2), () {
            // Navigate to the next screen after showing the success screen
            Navigator.push(context,MaterialPageRoute(builder: (context)=>BottomBar()));
          });

          return Scaffold(
          body: Container(
            height: height,
            width: width,
            child: Image.asset(
              'assets/categories/success.png',
              fit: BoxFit.fill,
            ),
          ),
        );

      }return Scaffold(
          body: Center(
            child: Text('error'),
          ),

        );
    }
    );
  }
}
