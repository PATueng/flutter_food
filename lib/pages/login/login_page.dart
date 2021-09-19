import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var input = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ไล่เฉดจากมุมบนซ้ายไปมุมล่างขวาของ Container
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            // ไล่เฉดจากสีแดงไปสีน้ำเงิน
            colors: [
              Colors.amber.shade100,
              Colors.green.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.lock_outline,size: 100.0,),
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        Text('Enter PIN to Login',style: Theme.of(context).textTheme.bodyText2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for(var i = 0; i<input.length; i++)
                              Icon(Icons.circle,size: 25.0,color: Colors.blueAccent,),
                            for(var i = 0; i<6-input.length; i++)
                              Icon(Icons.circle,size: 25.0,color: Colors.blueAccent.shade100,),
                          ],
                        ),

                        Text(input,style: TextStyle(fontSize: 20.0),),
                      ],
                    )),
              ),
              Container(
                //color: Colors.pinkAccent.shade100,
                child: Column(
                  children: [
                    [1,2,3],
                    [4,5,6],
                    [7,8,9],
                    [-2,0,-1],
                  ].map((row) { //row คือลิสต์แต่ละลิสต์ แล้วส่งไปทำงานที่ return
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: row.map((item){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: LoginButton(number: item,onClick: _handleClickButton,),
                        );
                      }).toList(),
                    );
                  }).toList(),
                    /*for(var row = 0;row<3;row++) //ไม่ตอบโจทย์เวลามีเลข 0
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for(var col=1;col<=3;col++)
                            LoginButton(number: row*3 + col,),
                        ],
                      ),*/

                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _handleClickButton(int num){
    var pw = '123456';
    print('Click $num');
    setState(() {
      if(num == -1) {
        if (input.length > 0)
          input = input.substring(0, input.length - 1);
      }
      else {
        if (input.length <= 5) {
          input = '$input$num';
          print(input);}
          if (input == pw) {
            print('success');
            secondPage();
            input = '';
          } else if (input.length==6 && input != pw) {
            _showMaterialDialog('Error', 'Invalid PIN,Please try again.');
            input='';
            print('not success');
          }
        }
    });
  }

  void _showMaterialDialog(String title, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(msg),
          actions: [
            // ปุ่ม OK ใน dialog
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                // ปิด dialog
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void secondPage(){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function(int) onClick;

  const LoginButton({ //constructor ที่คลาสสร้างให้
    required this.number, //ถ้าไม่ใส่คำว่า required โค้ดจะ error required หมายถึงต้องส่งพารามิเตอร์ตัวนี้ทุกครั้ง
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : () => onClick(number),
      child: Container(
        width : 80.0,
        height: 80.0,
        decoration: number == -2
            ? null
            :BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2.0),
        ),
        child: Center(
          child: number>=0 ? Text(
            '$number',
            style: Theme.of(context).textTheme.headline6,
          ):(number == -1
              ? Icon(Icons.backspace_outlined,size: 30.0,)
              : SizedBox.shrink()),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLUTTER FOOD"),
      ),
      body: Center(
        child: Text('THIS IS A HOME PAGE',style: Theme.of(context).textTheme.headline1,),
      ),
    );
  }
}