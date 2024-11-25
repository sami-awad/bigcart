import 'package:bigcart/helper/api_helper.dart';
import 'package:bigcart/screens/registration/login/model/LoginModel.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
 LoginModel loginmodel = LoginModel();

 void login({
    required String email,
    required String password,
}) async{
   emit(LoginLoading());
   try{
     final response = await ApiHelper.instance.post(
       url: 'login',
       body: {
         "email": email,
         "password": password
       }
     );
     loginmodel = LoginModel.fromJson(response.data);
     print(response.data);
     if(loginmodel.status==true){
       emit(LoginSuccess());
     }else{
       emit(LoginError());
     }
   }catch (e){
     emit(LoginError());
   }
 }

}
