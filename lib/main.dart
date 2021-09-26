import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_list_page.dart';
import 'package:flutter_food/pages/food/food_page.dart';
import 'package:flutter_food/pages/home/home_page.dart';
import 'package:flutter_food/pages/login/login_page.dart';
import 'package:flutter_food/pages/login/login_page_aj.dart';
import 'package:flutter_food/pages/order/order_page.dart';
import 'package:flutter_food/pages/profile/profile_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        textTheme: const TextTheme(
            headline1: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
          headline6: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
          bodyText2: TextStyle(fontSize: 18.0),
          bodyText1: TextStyle(fontSize: 14.0,),
          headline2: TextStyle(fontSize: 16.0,),
          headline4: TextStyle(fontSize: 20.0,),
        ),
      ),
      //กำหนด route จะไม่กำหนด home
      //home: LoginPage(),
      routes: {
        LoginPage.routeName : (context) => const LoginPage(),/*_test,*/ //แบบนี้หรือแบบข้างล่าง
        HomePage.routeName :(context) => const HomePage(),
        ProfilePage.routeName:(context) => const ProfilePage(),
        FoodPage.routeName :(context) => const FoodPage(),
        FoodListPage.routeName : (context) => const FoodListPage(),
        OrderPage.routeName : (context) => const OrderPage(),
      },
      initialRoute: LoginPage.routeName,
    );
  }
  /*Widget _test(BuildContext context){
    //Processing //ถ้ามีการดำเนินการต่างๆต้องกำหนดแบบนี้
    return const LoginPage();
  }*/
}
