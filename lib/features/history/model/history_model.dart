class HistoryModel {
  final String invoiceId;
  final DateTime date;
  final String activityType;
  final int credit;
  final int redeem;
  final int balance;
  final DateTime expiryDate;

  HistoryModel({
    required this.invoiceId,
    required this.date,
    required this.activityType,
    required this.credit,
    required this.redeem,
    required this.balance,
    required this.expiryDate,
  });
}
