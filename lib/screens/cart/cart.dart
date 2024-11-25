import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}
int counter = 0;
class _CartState extends State<Cart> {
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
            title: Text('Cart'),
          ),
          body: Stack(
            children: [
              SizedBox(
                //height: height*.635,
                child: ListView.builder(
                    itemCount: 10,
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
              ),
              Spacer(),
              Column(
                children: [
                  Spacer(),
                  Container(
                    height: height*.26,
                    color: Colors.white,
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal:width*.04),
                      child: Column(
                        children: [
                          SizedBox(height: height*.03,),
                          Row(
                            children: [
                              Text('suototal',style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),),
                              Spacer(),
                              Text(r'$56.8',style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),)
                            ],
                          ),SizedBox(height: height*.015,),
                          Row(
                            children: [
                              Text('Shipping charges',style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),),
                              Spacer(),
                              Text(r'$2.4',style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey
                              ),)
                            ],
                          ),
                          Divider(),
                          //SizedBox(height: height*.015,),
                          Row(
                            children: [
                              Text('Total',style: TextStyle(
                                fontSize: 22,

                              ),),
                              Spacer(),
                              Text(r'$59.2',style: TextStyle(
                                fontSize: 20,
                              ),)
                            ],
                          ),
                          SizedBox(height: height*.02,),
                          Container(
                            height: height*.07,
                            width: width,
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
                            ),child: Center(
                                  child: Text('Checkout',style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                  )
                                  ),
                            ),
                          ) ,
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
