import 'package:bigcart/helper/products_helper.dart';
import 'package:bigcart/screens/homescreen/model/productsmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../helper/api_helper.dart';
import '../../model/bannersmodel.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  ProductsModel productsModel= ProductsModel();

  void getPopularProducts() async {
    emit(ProductsLoading());
    try {
      final response = await ApiHelper.instance.get(
        'products',
      );
      productsModel = ProductsModel.fromJson(response.data);
      //print(response.data);
      if (productsModel.status == true) {
        emit(ProductsSuccess());
      } else {
        emit(ProductsError());
      }
    } catch (e) {
      emit(ProductsError());
    }
  }
  BannersModel bannersModel = BannersModel();

  void Getbanners()async{
    emit(BannersLoading());
    try{
      final response = await ApiHelper.instance.get('banners');
      bannersModel = BannersModel.fromJson(response.data);
      print(response.data);
      if(bannersModel.status == true){
        emit(BannersSuccess());
      }
    }catch(e){
      emit(BannersError());
    }
  }
}

