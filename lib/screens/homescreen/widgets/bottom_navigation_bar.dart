import 'package:bigcart/screens/cart/cart.dart';
import 'package:bigcart/screens/favorite/favorite.dart';
import 'package:bigcart/screens/homescreen/homescreen.dart';
import 'package:bigcart/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}
class _BottomBarState extends State<BottomBar> {
  int _selectedIndex =0;
  static List<Widget> _widgetOptions = <Widget>[
    Homescreen(),
    Favorite(),
   // Cart(),
    Profile(),
  ];

  void _onItemTapped(int index) { // new
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          items:   [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home,color: Colors.grey),
                label: '',
                activeIcon:  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: Icon(CupertinoIcons.home,color: Colors.white))
            ),

            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.heart,color: Colors.grey),
                label: '',
                activeIcon:  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: Icon(CupertinoIcons.heart,color: Colors.white))

            ),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person,color: Colors.grey),
                label: '',
                activeIcon:  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: Icon(CupertinoIcons.person,color: Colors.white))

            ),
            BottomNavigationBarItem(
                icon: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                    },
                    child: Icon(CupertinoIcons.bag,color: Colors.grey,)),
                label: '',
                activeIcon:  InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                  },
                  child: Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle
                      ),
                      child: Icon(CupertinoIcons.bag,color: Colors.white)),
                )

            ),

          ],
          //unselectedItemColor:HexColor('#181725') ,
          selectedItemColor: Colors.greenAccent,

          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
