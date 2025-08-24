import 'package:flutter/material.dart';
import '../models/seat_model.dart';
import '../models/ticket_model.dart';

class ChooseSeatsViewModel with ChangeNotifier {
  final int totalRows = 8;
  final Set<SeatPosition> _reservedSeats;
  final Set<SeatPosition> _selectedSeats = {};
  final TicketInfo ticketInfo;

  ChooseSeatsViewModel({
    required this.ticketInfo,
    Set<SeatPosition>? reservedSeats,
    Set<SeatPosition>? preSelectedSeats,
  }) : _reservedSeats = reservedSeats ?? {} {
    if (preSelectedSeats != null) {
      _selectedSeats.addAll(preSelectedSeats);
    }
  }

  Set<SeatPosition> get selectedSeats => _selectedSeats;
  Set<SeatPosition> get reservedSeats => _reservedSeats;

  int getSeatCountForRow(int rowIndex) {
    if (rowIndex == 0 || rowIndex == totalRows - 1) {
      return 7;
    }
    return 8;
  }

  bool isReserved(int row, int col) {
    return _reservedSeats.contains(SeatPosition(row, col));
  }

  bool isSelected(int row, int col) {
    return _selectedSeats.contains(SeatPosition(row, col));
  }

  void toggleSeatSelection(int row, int col) {
    final seat = SeatPosition(row, col);
    if (_reservedSeats.contains(seat)) return;
    
    if (_selectedSeats.contains(seat)) {
      _selectedSeats.remove(seat);
    } else {
      _selectedSeats.add(seat);
    }
    notifyListeners();
  }

  String getFormattedSeats() {
    if (_selectedSeats.isEmpty) return '-';
    
    final sorted = _selectedSeats.toList()
      ..sort((a, b) {
        if (a.row != b.row) return a.row.compareTo(b.row);
        return a.column.compareTo(b.column);
      });
    
    return sorted.map((seat) => (seat.column + 1).toString()).join(',');
  }
  
  String getFormattedRows() {
    if (_selectedSeats.isEmpty) return '-';
    
    final rows = _selectedSeats.map((seat) => (seat.row + 1).toString()).toSet().toList()..sort();
    
    return rows.join(',');
  }
  
  String getFormattedPrice() {
    final total = _selectedSeats.length * ticketInfo.pricePerSeat;
    return '\$${total.toStringAsFixed(2)}';
  }
}