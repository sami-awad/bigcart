import 'dart:async';
import 'dart:ui';

import 'package:bigcart/screens/registration/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    // Auto-slide feature
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              _buildStack(
                  height: height,
                  width: width,
                  title: ' Get Discounts\nOn All Products',
                  image: 'assets/onboarding/onboarding1.png'),
              _buildStack(
                  height: height,
                  width: width,
                  title: 'Buy Premium\nQuality Fruits',
                  image: 'assets/onboarding/onboarding2.png'),
              _buildStack(
                  height: height,
                  width: width,
                  title: '  Buy Quality\nDairy Products',
                  image: 'assets/onboarding/onboarding3.png'),
            ],
          ),
          // Dot Indicator
          Positioned(
            bottom: height * 0.17,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  height: 9,
                  width: _currentPage == index ? 24 : 12,
                  decoration: BoxDecoration(
                    color: _currentPage == index ? Colors.green : Colors.grey,
                    borderRadius: BorderRadius.circular(12),
                  ),
                );
              }),
            ),
          ),
          Center(
            child: Column(
              children: [
                const Spacer(),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>Registration() ));
                  },
                  child: Container(
                    height: height * .07,
                    width: width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(colors: [
                        HexColor('#ADDC7F'),
                        HexColor('#72C726'),
                      ]),
                    ),
                    child: const Center(
                      child: Text(
                        'Get started',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .07,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack _buildStack({
    required double height,
    required double width,
    required String title,
    required String image,
  }) {
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          child: Image.asset(
            image,
            fit: BoxFit.fill,
          ),
        ),
        Center(
          child: Column(
            children: [
              SizedBox(
                height: height * .07,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              SizedBox(
                height: height * .07,
              )
            ],
          ),
        ),
      ],
    );
  }
}
