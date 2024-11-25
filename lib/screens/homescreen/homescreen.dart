import 'package:bigcart/screens/homescreen/cubit/products/products_cubit.dart';
import 'package:bigcart/screens/homescreen/search/cubit/search_cubit.dart';
import 'package:bigcart/screens/homescreen/widgets/categorieslist.dart';
import 'package:bigcart/screens/homescreen/widgets/product_grid_view.dart';
import 'package:bigcart/screens/homescreen/widgets/product_list_view.dart';
import 'package:bigcart/screens/homescreen/widgets/seeallcategories.dart';
import 'package:carousel_custom_slider/carousel_custom_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}
bool isgridview = false;
class _HomescreenState extends State<Homescreen> {
  void initState(){
    final cubit = context.read<ProductsCubit>();
    cubit.Getbanners();
    cubit.getPopularProducts();


  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final cubit=context.read<ProductsCubit>();

    return  BlocBuilder<ProductsCubit, ProductsState>(
  builder: (context, state) {
    if(state is ProductsLoading){
      return Scaffold(
        body: Center(child: Container(
            height:150,
            width: 150,
            child: CircularProgressIndicator()),)
      );
    }else if (state is ProductsError){
      return Scaffold(
        body: Center(
          child: Text('${cubit.productsModel.message}'),
        ),
      );
    }
    else{
    return Scaffold(
      backgroundColor: HexColor('#F4F5F9'),
      appBar: AppBar(
        title: BlocBuilder<SearchCubit, SearchState>(
  builder: (context, state) {
    final searchcubit=context.read<SearchCubit>();
    return TextField(
          onSubmitted: (value){
            searchcubit.Search(text: value);
           // print(searchcubit.productsModel.status);
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: HexColor('#F4F5F9'),
            hintText: 'Search keywords',
            hintStyle: TextStyle(
              color: Colors.grey
            ),
            prefixIcon: Padding(
              padding:  EdgeInsets.symmetric(horizontal: width*0.05),
              child: Icon(CupertinoIcons.search,color: Colors.grey,),
            ),
            border: OutlineInputBorder(
              borderRadius:BorderRadius.circular(12),
              borderSide: BorderSide.none
            )
          ),
        );
  },
),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:width*.03),
          child: Column(
            children: [
              SizedBox(height: height*.015,),
              CarouselSlider(
                options: CarouselOptions(
                  //height: 400.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  
                  autoPlayAnimationDuration: Duration(seconds: 1),
                ),
                items: [
                  6,7,8,4,
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        height: height*.3,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                              color: Colors.amber,
                            image: DecorationImage(
                                image: NetworkImage('${cubit.bannersModel?.data?[i]?.image}',),
                            fit: BoxFit.fill
                            )
                          ),
                      );
                    },
                  );
                }).toList(),
              ),
  
              SizedBox(height: height*.015,),
              Row(
                children: [
                  Text('Categories',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),),
                  Spacer(), InkWell(
                      onTap: (){
                        Drawer(
                          child: Container(color: Colors.grey,),
                        );
                        // cubit.getPopularProducts();
                        // print('${cubit.productsModel.data?.data?[2]?.name}'??'sami');
                        // bannercubit.Getbanners();

                        // Navigator.push(
                        //   context,
                        //   PageRouteBuilder(
                        //   pageBuilder: (_,__,___)=>AllCategories(),
                        //     transitionDuration: Duration(milliseconds:500),
                        //     transitionsBuilder:(
                        // BuildContext context,
                        // Animation<double> animation,
                        // Animation<double> secondaryAnimation,
                        // Widget child,
                        // ) =>
                        // Align(
                        // child: SizeTransition(
                        // sizeFactor: animation,
                        // child: child,
                        // ),)
                        //
                        // ));
                      },
                      child: Icon(CupertinoIcons.right_chevron,color: Colors.grey,size: 27,)),
                ],
              ),
              SizedBox(height: height*.01,),
              CategoriesScroll(),
              SizedBox(height: height*.01,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: (){
                        setState(() {
                          isgridview=!isgridview;
                        });},
                      child: Icon(
                        isgridview ? CupertinoIcons.list_bullet : CupertinoIcons.square_grid_2x2,
                        color: Colors.grey,
                      )),
                SizedBox(width: width*.03,)
                ],
              ),
              SizedBox(
                  height: height*.95,
                  child: isgridview?ProductGridView():ProductListView(),
              ),

            ],
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('Messages'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  }
);
  }
}
