import 'dart:math';
import 'package:game_lucky_number/models/ticketList.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int luckyNumber;
  String comment = '';

  String commentText() {
    if (Provider
        .of<TicketList>(context)
        .lists
        .length == 0 || luckyNumber == null) {
      comment = '';
    } else {
      Provider
          .of<TicketList>(context)
          .lists
          .map((e) => e.number)
          .contains(luckyNumber) ?  comment = 'Congratulation' : comment ='Unlucky, try again';
    }
    return comment;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Result'),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, left: 10),
            child: Text(
              'Your numbers are: ',
              style: TextStyle(fontSize: 30),
            ),
          ),
          SizedBox(height: 30),
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: Provider.of<TicketList>(context).lists.map((ticket) {
                return Container(
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.only(left: 5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.red)
                  ),
                  child: Center(child: Text(ticket.number.toString(), style: TextStyle(fontSize: 30, color: Colors.red),)),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 30),
          Text('Lucky number is: ', style: TextStyle(fontSize: 30),),
          SizedBox(height: 30),
          Text(
            luckyNumber == null ? ' ' : luckyNumber.toString(),
            style: TextStyle(fontSize: 80, color: Colors.red, ),
          ),
          SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              setState(() {
                luckyNumber = Random().nextInt(20) + 1;
              });
            },
            child: Text('Roll'),
          ),
          SizedBox(height: 30),
          Text(commentText(), style: TextStyle(fontSize: 40, color: Colors.red),)
        ],
      ),
    );
  }
}
