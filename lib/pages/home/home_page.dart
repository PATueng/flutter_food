import 'package:flutter/material.dart';
import 'package:flutter_food/pages/food/food_page.dart';
import 'package:flutter_food/pages/profile/profile_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _subPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Food'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white,
                    Colors.blueGrey,
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40.0),
                      child: Container(
                        width: 80.0,
                        height: 80.0,
                        child: Image.asset('assets/images/profile.png'),
                      )),
                  Text(
                    'Pattaraphorn Uengcharoenwong',
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  Text(
                    'uengcharoenwong_p@silpakorn.edu',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.fastfood,
                    color: _subPageIndex == 0 ? Colors.blueGrey : Colors.black,
                  ),
                  'Food'),
              onTap: () => _showSubPage(0),
            ),
            ListTile(
              title: _buildDrawerItem(
                  Icon(
                    Icons.person,
                    color: _subPageIndex == 1 ? Colors.blueGrey : Colors.black,
                  ),
                  'Profile'),
              onTap: () {
                _showSubPage(1);
                //Navigator.of(context).pushNamed(LoginPage.routeName);
              },
              focusColor: Colors.blueGrey,
              selectedTileColor: Colors.blue,
            ),
          ],
        ),
      ),
      body: Container(
        child: _buildSubPage(),
      ),
    );
  }

  _showSubPage(int index) {
    setState(() {
      _subPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Widget _buildSubPage() {
    switch (_subPageIndex) {
      case 0: //home page
        return FoodPage();
      /*Center(
          child: Text('Food Menu',
              style: Theme.of(context).textTheme.headline1),
        );*/
      case 1:
        return ProfilePage();
      /*Center(
          child: Text('Page1', style: Theme.of(context).textTheme.headline1),
        );*/
      default:
        return SizedBox.shrink();
    }
  }

  Row _buildDrawerItem(Icon icon, String title) {
    return Row(
      children: [
        icon,
        SizedBox(width: 8.0),
        Text(title),
      ],
    );
  }
}
