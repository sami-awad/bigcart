import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:carousel_custom_slider/carousel_custom_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.index});
  final int index ;

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}
 int count = 0;
class _ProductDetailsState extends State<ProductDetails> {
final PageController _pageController=PageController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    final cubit = context.read<ProductsCubit>();
    final details = cubit.productsModel.data?.data?[widget.index];
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height*.45,
                  width: width,
                  color: Colors.white,
                  child: Stack(
                    children: [
                      SizedBox(
                        height: height*.45,
                        width: width,
                        child: PageView.builder(
                          controller: _pageController,
                            itemCount: details?.images?.length,
                            itemBuilder: (context,index){
                              return Container(
                                child: Image.network('${details?.images?[index]}'),
                              );
                            }),
                      ),
                      Center(
                        child: Column(
                          children: [
                            Spacer(),
                            SmoothPageIndicator(
                              controller: _pageController,
                              count: details?.images!.length??0,
                              effect: ScrollingDotsEffect(
                                  activeDotColor: Colors.green,
                                  dotColor: Colors.grey,
                                  dotHeight: 6,
                                  dotWidth: 6
                              ),
                            ),
                            SizedBox(height: height*.01,)
            
                          ],
                        ),
                      ),
                    ],
                  )
                ),
            
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      //height: height*.52,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                        color: Colors.grey.shade100,
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal:width*.05,vertical: height*.03),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                           Row(
                             children: [
                               Text('${details?.price}',style: TextStyle(
                                 fontSize: 18,
                                 color: HexColor('#28B446')
                               ),),
                               Spacer(),
                               Icon(CupertinoIcons.heart,color: Colors.grey,size: 30,)
                             ],
                           ),
                            Text('${details?.name}',
                              style: TextStyle(fontSize: 16),
                            ),
                            // Text('1.50 lbs',style: TextStyle(
                            //   fontSize: 12,
                            //   color: Colors.grey
                            // ),),
                            SizedBox(height: height*.01,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('4.5',style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),),
                                SizedBox(width: width*.01,),
                                Icon(CupertinoIcons.star_fill,size: 20,color: Colors.yellow,),
                                SizedBox(width: width*.01,),
                                Icon(CupertinoIcons.star_fill,size: 20,color: Colors.yellow,),
                                SizedBox(width: width*.01,),
                                Icon(CupertinoIcons.star_fill,size: 20,color: Colors.yellow,),
                                SizedBox(width: width*.01,),
                                Icon(CupertinoIcons.star_fill,size: 20,color: Colors.yellow,),
                                SizedBox(width: width*.01,),
                                Icon(CupertinoIcons.star_lefthalf_fill,size: 20,color: Colors.yellow,),
                                SizedBox(width: width*.01,),
                                Text('(89 reviews)',style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey
                                ),),
                                SizedBox(width: width*.08,),
                                Row(
                                  children: [
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            if (count>0){
                                              count--;
                                            }
                                          });
                                        },
                                        child: Icon(CupertinoIcons.minus,color: HexColor('#6CC51D'),)),
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal:width*.03),
                                      child: Text('$count',style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.grey
                                      ),),
                                    ),
                                    InkWell(
                                        onTap: (){
                                          setState(() {
                                            count++;
                                          });
                                        },
                                        child: Icon(CupertinoIcons.add,color: HexColor('#6CC51D'),)),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: height*.015,),
                            Text('${details?.description}',style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey
                            ),),
                            SizedBox(height: height*.08,),
            
            
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            
              ],
            ),
          ),
          Positioned(
            //top: height*.78,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //SizedBox(height: height,),
                // Container(
                //   height: height*.07,
                //   width: width,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(10),
                //       color: Colors.white
                //   ),child: Padding(
                //   padding:  EdgeInsets.symmetric(horizontal: width*.04),
                //   child: Row(
                //     children: [
                //       Text('Quantity'),
                //       Spacer(),
                //       InkWell(
                //           onTap: (){
                //             setState(() {
                //               if (count>0){
                //                 count--;
                //               }
                //             });
                //           },
                //           child: Icon(CupertinoIcons.minus,color: HexColor('#6CC51D'),size: 35,)),
                //       VerticalDivider(),
                //       Padding(
                //         padding:  EdgeInsets.symmetric(horizontal:width*.03),
                //         child: Text('$count',style: TextStyle(
                //             fontSize: 18,
                //             color: Colors.grey
                //         ),),
                //       ),
                //       VerticalDivider(),
                //       InkWell(
                //           onTap: (){
                //             setState(() {
                //               count++;
                //             });
                //           },
                //           child: Icon(CupertinoIcons.add,color: HexColor('#6CC51D'),size: 35,)),
                //     ],
                //   ),
                // ),
                // ),
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
                  ),child:Padding(
                  padding:  EdgeInsets.symmetric(horizontal:width*.04),
                  child: Stack(
                    children: [
                      const Center(
                        child: Text('Add to cart',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                        )
                        ),
                      ),
                      Container(
                        height: height*.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(CupertinoIcons.bag,color: Colors.white,size: 35,)
                          ],
                        ),
                      )
                    ],
                  ),
                ) ,
                ),
                SizedBox(height: height*.02,)
              ],
            ),
          )
        ],
      ),
    );
  },
);
  }
}
