import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:bigcart/screens/homescreen/widgets/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return  BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    final cubit = context.read<ProductsCubit>();
    final details = cubit.productsModel?.data?.data ;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: cubit.productsModel.data?.data?.length,
          //physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context , index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(index: index,)));
              },
              child: Container(
                height: height*.14,
                width: width,
                child:Padding(
                  padding:  EdgeInsets.only(bottom:height*0.005),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    borderRadius: BorderRadius.circular(7)
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                            height: height*.1,
                            width: height*.1,
                            child: Image.network(
                              '${details?[index].image}',
                              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child; // الصورة جاهزة
                                } else {
                                  // عرض مؤشر التحميل أو أي عنصر بديل هنا
                                  return Center(
                                    child:CircularProgressIndicator()
                                  );}
                              },)),


                        SizedBox(width: width*.02,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(r'$',style: TextStyle(
                                    fontSize: 12,
                                    color: HexColor('#6CC51D')
                                ),),
                                SizedBox(width: width*.01,),
                                Text('${details?[index]?.price}',style: TextStyle(
                                    fontSize: 12,
                                    color: HexColor('#6CC51D')
                                ),),
                              ],
                            ),
                            Container(
                              width: width*.5,
                              child: Text(
                                details?[index].name != null
                                    ? details![index].name!.length > 50
                                    ? details![index].name!.substring(0, 50)
                                    : details![index].name!
                                    : '',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Row(
                              children: [
                                Text('save',style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
                                ),),
                                SizedBox(width: width*.02,),
                                Text(r' $ ',style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
                                ),),
                                Text('${details?[index]?.discount}',style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey
                                ),),
                              ],
                            ),

                          ],
                        ),
                        Spacer(),
                        // Column(
                        //     mainAxisAlignment: MainAxisAlignment.end,
                        //     children: [
                        //       // InkWell(
                        //       //     onTap: (){},
                        //       //     child: Icon(CupertinoIcons.heart,color: HexColor('#6CC51D'),)),
                        //       //Icon(CupertinoIcons.bag,color: HexColor('#6CC51D'),),
                        //       Container(
                        //             width: width*.25,
                        //             height: height*.035,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10),
                        //               color: HexColor('#6CC51D')
                        //             ),
                        //             child: Center(child: Text('add to cart',style: TextStyle(
                        //               color: Colors.white
                        //             ),))),
                        //
                        //       SizedBox(height: height*.02,)
                        //     ]
                        // ),
                        SizedBox(width: width*.025,)
                      ],
                    ),
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
