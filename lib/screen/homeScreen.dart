import 'package:flutter/material.dart';
import 'package:game_lucky_number/widgets/ticketGrid.dart';
import 'resultScreen.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose your numbers'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => ResultScreen()));
                })
          ],
        ),
        body: TicketGrid()
    );
  }
}