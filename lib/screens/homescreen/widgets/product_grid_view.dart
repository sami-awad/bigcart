import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:bigcart/screens/homescreen/widgets/productdetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(top: height*.015),
      child: BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    final cubit  = context.read<ProductsCubit>();
    final details = cubit.productsModel?.data?.data ;
    return GridView.builder(
          itemCount: cubit.productsModel?.data?.data?.length,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(index: index,)));
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),child: Padding(
                  padding:  EdgeInsets.all(height*.01),
                  child: Column(
                  children: [
                    Row(
                      children: [
                        Spacer(),
                        Icon(CupertinoIcons.heart,color: Colors.grey,)
                      ],
                    ),
                    Container(
                        height: height*.1,
                        width: height*.1,
                        child: Image.network('${details?[index]?.image}')),
                    SizedBox(height: height*.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(r'$ ',style: TextStyle(
                          fontSize: 14,
                          color: HexColor('#6CC51D')
                        ),),Text('${details?[index]?.price} ',style: TextStyle(
                          fontSize: 14,
                          color: HexColor('#6CC51D')
                        ),),
                      ],
                    ),
                    SizedBox(height: height*.005),
                    Text(
                        details?[index].name != null
                            ? details![index].name!.length > 20
                            ? details![index].name!.substring(0, 20)
                            : details![index].name!
                            : '',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    ),),
                    SizedBox(height: height*.005),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.bag,color: HexColor('#6CC51D'),),
                        SizedBox(width: width*.02,),
                        Text('Add to cart')
                      ],
                    )
                  ],
                            ),
                ),
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              childAspectRatio: .68,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          ));
  },
),
    );
  }
}
