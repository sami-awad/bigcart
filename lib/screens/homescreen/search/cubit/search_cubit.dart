import 'package:bigcart/helper/api_helper.dart';
import 'package:bigcart/screens/homescreen/model/productsmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  ProductsModel productsModel = ProductsModel();

  void Search ({
    required String text,
})async{
    emit(SearchLoading());
    try {
      final response = await ApiHelper.instance.post(
          url: 'search',
          body: {
            "text": text
          }
      );
      productsModel = ProductsModel.fromJson(response.data);
      print(response.data);
    }catch(e){
      emit(SearchError());
    }

  }
}
