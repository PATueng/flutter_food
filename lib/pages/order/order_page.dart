import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  static const routeName = '/order';
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Your Order',
            style: Theme.of(context).textTheme.headline1),
      ),
    );
  }
}
