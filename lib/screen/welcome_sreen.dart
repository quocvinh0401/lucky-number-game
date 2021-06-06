import 'package:flutter/material.dart';
import 'package:game_lucky_number/screen/homeScreen.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Text(
              'Welcome to\nLucky Number Game !',
              style: TextStyle(fontSize: 35, color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Positioned(
            bottom: 40,
            child: FlatButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=> HomeScreen()));
              },
              child: Text(
                'Get started !',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}