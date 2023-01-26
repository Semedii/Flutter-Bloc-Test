
part of 'login_cubit.dart';

abstract class LoginState{ 
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {
  final bool isHidden;

  LoginInitial({this.isHidden=true});
  
  LoginInitial copyWith({
   bool? isHidden,
}) {
  return LoginInitial(isHidden: isHidden?? this.isHidden);
}

}
