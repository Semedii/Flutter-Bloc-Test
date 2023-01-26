import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  onpressed(){
    LoginInitial lastState = state as LoginInitial;
    emit(lastState.copyWith(isHidden: !lastState.isHidden));
  }
}
