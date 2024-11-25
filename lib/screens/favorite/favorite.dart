import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}
int counter = 0;
class _FavoriteState extends State<Favorite> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        final cubit = context.read<ProductsCubit>();
        var height = MediaQuery.of(context).size.height;
        var width = MediaQuery.of(context).size.width;
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text('Favorites'),
          ),
          body: ListView.builder(
            itemCount: 5,
              itemBuilder: (context,index){
                return Padding(
                  padding:  EdgeInsets.all(height*.01),
                  child: Container(
                    height: height*.12,
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.all(height*0.015),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/categories/peach.png',scale: 1.25,),
                          SizedBox(width: width*.05,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: height*.01,),
                              Text(r'$2.22 x 4',style: TextStyle(
                                fontSize: 12,
                                color: HexColor('#6CC51D')
                              ),),
                              Text('Fresh peach',style: TextStyle(
                                fontSize: 16
                              ),),
                              Text('1.50 lbs',style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey
                              ),),

                            ],
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      counter++;
                                    });
                                  },
                                  child: Icon(Icons.add,color: HexColor('#6CC51D'),)),
                              Text('$counter',style: TextStyle(
                                color: Colors.grey
                              ),),
                              InkWell(
                                  onTap: (){
                                    setState(() {
                                      if(counter>0){
                                        counter--;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove,color: HexColor('#6CC51D'),)),
                            ]
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }),
        );
      },
    );
  }
}
