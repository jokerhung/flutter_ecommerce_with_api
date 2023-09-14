import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:shop_app/screens/sign_in/components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(listener: (context, state) {
      if (state.loginResult == "Success") {
        Navigator.of(context).pushNamed(HomeScreen.routeName);
      }
    }, child: BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Stack(children: [
          Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Sign In"),
            ),
            body: Body(),
          ),
          if(state.loginResult == "InProgress") const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
          if(state.loginResult == "InProgress") const Center(
            child: CircularProgressIndicator(),
          ),
        ]);
      },
    ));
  }
}
