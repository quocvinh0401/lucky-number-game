import 'package:flutter/material.dart';
import 'package:game_lucky_number/models/ticket.dart';
import 'package:game_lucky_number/models/ticketList.dart';
import 'package:provider/provider.dart';

class TicketGrid extends StatefulWidget {
  @override
  _TicketGridState createState() => _TicketGridState();
}

class _TicketGridState extends State<TicketGrid> {
  List<Ticket> tickets = [];
  int count = 0;
  @override
  void initState() {
    super.initState();
    tickets = List.generate(20, (index) {
      return Ticket(number: index + 1, checked: false);
    }
    );
  }
  void tapTicketItem(Ticket ticket){
    setState(() {
      ticket.checked = !ticket.checked;
    });
    Provider.of<TicketList>(context, listen: false).pressTicket(ticket);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 4,
      children: tickets.map((ticket)  {
        return GestureDetector(
          onTap: () {
            if (count < 7 ){
              if (Provider.of<TicketList>(context, listen: false).lists.map((ticketItem) => ticketItem.number).contains(ticket.number)){
                tapTicketItem(ticket);
                count--;
              } else {
                tapTicketItem(ticket);
                count++;
              }
            }
            if (count == 7 && Provider.of<TicketList>(context, listen: false).lists.map((ticketItem) => ticketItem.number).contains(ticket.number)){
              tapTicketItem(ticket);
              count--;
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ticket.checked ? Colors.green : Colors.red
            ),
            child: Center(
              child: Text(
                ticket.number.toString(),
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
