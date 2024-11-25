import 'package:bigcart/helper/api_helper.dart';
import 'package:bigcart/screens/registration/signup/model/signupmodel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  SignUpModel signUpModel=SignUpModel();
  
  void signup ({
    required String email,
    required String password,
    required String phone,
    required String name,
}) async{
    emit(SignUpLoading());
    try{
      final response =await ApiHelper.instance.post(
        url: 'register',
        body: {
          "phone": phone,
          "email": email,
          "password": password,
          "name":name
        }
      );
      signUpModel = SignUpModel.fromJson(response.data);
      if(signUpModel.status==true){
        emit(SignUpSuccess());
      }else{
        emit(SignUpError());
      }
    }catch(e){}
  }
  
}
