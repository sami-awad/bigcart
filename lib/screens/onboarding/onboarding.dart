//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class Onboarding extends StatefulWidget {
//   @override
//   _OnboardingScreenState createState() => _OnboardingScreenState();
// }
//
// class _OnboardingScreenState extends State<Onboarding> {
//   PageController _controller = PageController();
//   int _currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageView(
//         controller: _controller,
//         onPageChanged: (int index) {
//           setState(() {
//             _currentIndex = index;
//           });
//         },
//         children: <Widget>[
//           buildOnboardingPage(
//               'assets/onboarding/onboarding1.png', 'Get Discounts On All Products'),
//           buildOnboardingPage(
//               'assets/onboarding/onboarding2.png', 'Buy Premium Quality Fruits'),
//           buildOnboardingPage(
//               'assets/onboarding/onboarding3.png', 'Buy Quality Dairy Products'),
//         ],
//       ),
//       bottomSheet: _currentIndex == 2
//           ? Container(
//         height: 60,
//         color: Colors.green,
//         child: Center(
//           child: TextButton(
//             onPressed: () {
//               // Navigate to main screen
//             },
//             child: Text(
//               'Get started',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20),
//             ),
//           ),
//         ),
//       )
//           : Container(
//         padding: EdgeInsets.symmetric(horizontal: 20),
//         height: 60,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             TextButton(
//               onPressed: () {
//                 _controller.jumpToPage(2);
//               },
//               child: Text('SKIP'),
//             ),
//             Row(
//               children: List.generate(3, (index) {
//                 return Container(
//                   margin: EdgeInsets.symmetric(horizontal: 4),
//                   width: _currentIndex == index ? 12 : 8,
//                   height: _currentIndex == index ? 12 : 8,
//                   decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     color: _currentIndex == index
//                         ? Colors.green
//                         : Colors.grey,
//                   ),
//                 );
//               }),
//             ),
//             TextButton(
//               onPressed: () {
//                 _controller.nextPage(
//                     duration: Duration(milliseconds: 500),
//                     curve: Curves.easeInOut);
//               },
//               child: Text('NEXT'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget buildOnboardingPage(String imagePath, String title) {
//     return Container(
//       padding: EdgeInsets.all(40),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Image.asset(imagePath, height: 300),
//           SizedBox(height: 30),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           SizedBox(height: 15),
//           Text(
//             'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
//             textAlign: TextAlign.center,
//             style: TextStyle(fontSize: 16, color: Colors.grey),
//           ),
//           SizedBox(height: 30),
//         ],
//       ),
//     );
//   }
// }
