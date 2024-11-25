import 'package:bigcart/screens/homescreen/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../json/categorieslist.dart';

class CategoriesScroll extends StatelessWidget {
  const CategoriesScroll({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:height*.12 ,
      child: ListView.builder(
        itemCount: categorieslist.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context,index) {
            return Padding(
              padding:  EdgeInsets.only(left:width*.03 ),
              child: Column(
                children: [
                  _buildContainer(
                      height: height,
                      image: categorieslist[index].image,
                      title: categorieslist[index].title,
                      color: categorieslist[index].color),
                ],
              ),
            );
          } ),
    );
  }

  Column _buildContainer({
    required height,
    required image,
    required title,
    required color,
}) {
    return Column(
      children: [
        Container(
                      height: height*.08,
                      width: height*.08,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(color)
                      ),child: Center(
                      child: Image.asset(image,scale: .9,),),
                    ),
        SizedBox(height: height*.01,),
        Text(title,style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
          //fontWeight: FontWeight.bold
        ),)

      ],
    );
  }
}
List<CategoriesModel> categorieslist = Categoris.map((e)=>CategoriesModel.fromjson(e)).toList();