import 'package:bigcart/screens/homescreen/model/categoriesmodel.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../json/categorieslist.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('All Categories'),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 150,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              //childAspectRatio: 1
            ),
            itemCount: categorieslist.length,
            itemBuilder: (context,index){
              return _buildContainer(
                  height: height,
                  image: categorieslist[index].image,
                  title: categorieslist[index].title,
                  color:categorieslist[index]. color);
            }),
      )
    );
  }

  Container _buildContainer({
    required height,
    required image,
    required title,
    required color,
}) {
    return Container(
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(20),
                color:Colors.white,
                borderRadius: BorderRadius.circular(10)
              ),child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      height: height*.07,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: HexColor(color),
                      ),
                      child: Image.asset(image,scale: .8,)),
                  SizedBox(height: height*.01,),
                  Text(title,style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey
                  ),)
                ],
              ),

            );
  }
}
List<CategoriesModel> categorieslist = Categoris.map((e)=>CategoriesModel.fromjson(e)).toList();