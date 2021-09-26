import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(40.0),
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  child: Image.asset('assets/images/profile.png'),
                )
            ),
            Text(
              'Pattaraphorn Uengcharoenwong',
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            Text(
              'uengcharoenwong_p@silpakorn.edu',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
