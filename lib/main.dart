import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/ticketList.dart';
import 'screen/homeScreen.dart';
import 'screen/resultScreen.dart';
import 'screen/welcome_sreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TicketList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/home': (context) => HomeScreen(),
          '/result': (context) => ResultScreen()
        },
        home: WelcomeScreen(),
      ),
    );
  }
}
