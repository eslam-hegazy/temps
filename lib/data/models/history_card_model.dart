class HistoryCardModel {
  final String startTrip;
  final String endTrip;
  final String price;
  final String status;
  final Function? pressStatus;
  HistoryCardModel({
    required this.startTrip,
    required this.endTrip,
    required this.price,
    required this.status,
    this.pressStatus,
  });
}
