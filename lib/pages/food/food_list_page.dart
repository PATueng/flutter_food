import 'package:flutter/material.dart';

class FoodListPage extends StatelessWidget {
  static const routeName = '/foodList';
  const FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Food Menu',
            style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
