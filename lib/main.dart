import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:bigcart/screens/homescreen/homescreen.dart';
import 'package:bigcart/screens/homescreen/search/cubit/search_cubit.dart';
import 'package:bigcart/screens/homescreen/search/search.dart';
import 'package:bigcart/screens/homescreen/widgets/bottom_navigation_bar.dart';
import 'package:bigcart/screens/onboarding/onboarding.dart';
import 'package:bigcart/screens/registration/login/cubit/login_cubit.dart';
import 'package:bigcart/screens/registration/login/login.dart';
import 'package:bigcart/screens/registration/registration.dart';
import 'package:bigcart/screens/registration/signup/cubit/sign_up_cubit.dart';
import 'package:bigcart/screens/registration/signup/signup.dart';
import 'package:bigcart/screens/onboarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit(),
        ),BlocProvider(
          create: (context) => SearchCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BottomBar(),
      ),
    );
  }
}
