import 'package:bloctest/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginCubit _loginCubit = LoginCubit();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _loginCubit,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Bloc test"),
          ),
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            bloc: _loginCubit,
            builder: (context, state) {
              if(state is LoginInitial){
              return Column(
                children: [
                  _getEmailForm(), _getPasswordform(state.isHidden, _loginCubit)
                  ],
              );} else return Container();
            },
          )),
    );
  }
}

_getEmailForm() {
  return TextField(
    decoration: InputDecoration(prefix: Icon(Icons.email), hintText: "Email"),
  );
}

_getPasswordform(bool isHidden, LoginCubit loginCubit) {
  return TextField(
    obscureText: isHidden,
    decoration: InputDecoration(
        prefix: Icon(Icons.lock),
        suffix: getSuffixIcon(isHidden, loginCubit), //getSuffixIcon(state.isHidden, _loginCubit),
        hintText: "password"),
  );
}

getSuffixIcon(bool isHidden, LoginCubit loginCubit) {
  return GestureDetector(
      onTap: loginCubit.onpressed,
      child: isHidden ? Icon(Icons.hide_source) : Icon(Icons.circle_outlined));
}
