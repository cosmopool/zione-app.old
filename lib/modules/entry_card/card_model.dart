import 'package:zione_app/features/ticket/ticket_model.dart';

abstract class Card {
  bool _isExpanded = false;

  void openCloseCard() {
    _isExpanded = !_isExpanded;
  }
}

class TicketCard extends Card {
  Ticket ticket;

  TicketCard({ required this.ticket });
}
