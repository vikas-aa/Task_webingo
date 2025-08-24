import '../models/seat_model.dart';

class SeatService {
  // In a real app, this would fetch data from an API
  static Set<SeatPosition> getReservedSeats() {
    return {
      const SeatPosition(1, 2), // left bottom black
      const SeatPosition(1, 6), // right top two blacks
      const SeatPosition(2, 6),
    };
  }

  static Set<SeatPosition> getPreSelectedSeats() {
    return {
      const SeatPosition(7, 1),
      const SeatPosition(4, 6),
    };
  }
}