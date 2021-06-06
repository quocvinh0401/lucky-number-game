import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:game_lucky_number/models/ticket.dart';

class TicketList extends ChangeNotifier {
  List<Ticket> lists = [];

  void addNumber(Ticket number){
    lists.add(number);
    notifyListeners();
  }

  void removeNumber(Ticket number){
    lists.remove(number);
    notifyListeners();
  }

  void pressTicket(Ticket ticket){
    ticket.checked ? addNumber(ticket) : removeNumber(ticket);
  }
}