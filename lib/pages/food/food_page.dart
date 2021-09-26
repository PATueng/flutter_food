import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_list_page.dart';
import 'package:flutter_food/pages/order/order_page.dart';

class FoodPage extends StatefulWidget {

  static const routeName = '/food';
  const FoodPage({Key? key}) : super(key: key);

  @override
  _FoodPageState createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  var _selectedBottomNavIndex = 0;
  List<Widget> _pageWidget = <Widget>[
    FoodListPage(),
    OrderPage(),
  ];
  List<BottomNavigationBarItem> _menuBar
  = [
    BottomNavigationBarItem(
      icon: Icon(Icons.menu_book),
      label: 'Menu',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Your Order',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageWidget.elementAt(_selectedBottomNavIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: _menuBar,
        currentIndex: _selectedBottomNavIndex,
        selectedItemColor: Colors.blueGrey,
        unselectedItemColor: Colors.grey,
        onTap: (index){
          setState(() {
            _selectedBottomNavIndex = index;
          });

        },
      ),
    );
  }
}
