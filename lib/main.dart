import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/data/repositories/category_api.dart';
import 'package:shop_app/data/repositories/login_api.dart';
import 'package:shop_app/data/repositories/product_api.dart';
import 'package:shop_app/routes.dart';
import 'package:shop_app/screens/home/bloc/home_bloc.dart';
import 'package:shop_app/screens/home/home_screen.dart';
import 'package:shop_app/screens/profile/profile_screen.dart';
import 'package:shop_app/screens/sign_in/bloc/sign_in_bloc.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/size_config.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignInBloc(LoginApi()),
        ),
        BlocProvider(
          create: (context) => HomeBloc(ProductApi(), CategoryApi()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        // home: SplashScreen(),
        initialRoute: SplashScreen.routeName,
        //initialRoute: SignInScreen.routeName,
        //initialRoute: ProfileScreen.routeName,
        //initialRoute: HomeScreen.routeName,
        routes: routes,
      ),
    );
  }
}
