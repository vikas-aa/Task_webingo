class SeatPosition {
  final int row;
  final int column;

  const SeatPosition(this.row, this.column);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SeatPosition &&
          runtimeType == other.runtimeType &&
          row == other.row &&
          column == other.column;

  @override
  int get hashCode => row.hashCode ^ column.hashCode;

  @override
  String toString() => 'SeatPosition(row: $row, column: $column)';
}