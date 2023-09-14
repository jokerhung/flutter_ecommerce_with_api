import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/components/custom_suffix_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/helper/keyboard.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:shop_app/size_config.dart';

class SignInForm extends StatelessWidget {
  SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return Form(
          child: Column(
            children: [
              buildEmailFormField(context, state.errors, state.email),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              buildPasswordFormField(context, state.errors, state.password),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              FormErrors(errors: state.errors),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              Row(
                children: [
                  Checkbox(
                      value: state.isRemember,
                      activeColor: kPrimaryColor,
                      onChanged: (value) {
                        // TODO
                      }),
                  Text("Remeber Me"),
                  Spacer(),
                  const Text(
                    "Forgot password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  )
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(20),
              ),
              DefaultButton(
                  text: "Continue",
                  press: () {
                    // TODO
                    print("LOG_SignInForm(): User press continue");
                    if (state.errors.isEmpty) {
                      context.read<SignInBloc>().add(ContinueEvent());
                    }
                  }),
              SizedBox(
                height: getProportionateScreenHeight(10),
              ),
              Text(
                state.loginResult != "InProgress" && state.loginResult != "None" ? state.loginResult : "",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  TextFormField buildPasswordFormField(
      BuildContext context, List<String> errors, String defaultPassword) {
    return TextFormField(
      controller: TextEditingController(text: defaultPassword),
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) =>
          context.read<SignInBloc>().add(PasswordEvent(newValue!)),
      onChanged: (value) {
        print("LOG_buildPasswordFormField_onChanged(): value = $value");
        context.read<SignInBloc>().add(PasswordEvent(value));
      },
      decoration: const InputDecoration(
          labelText: "Password",
          hintText: "Enter your password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")),
    );
  }

  TextFormField buildEmailFormField(BuildContext context, List<String> errors, String defaultEmail) {
    return TextFormField(
      controller: TextEditingController(text: defaultEmail),
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) =>
          context.read<SignInBloc>().add(EmailEvent(newValue!)),
      onChanged: (value) {
        context.read<SignInBloc>().add(EmailEvent(value));
      },
      decoration: const InputDecoration(
          labelText: "Email",
          hintText: "Enter your email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg")),
    );
  }
}
