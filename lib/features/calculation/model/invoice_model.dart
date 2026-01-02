class InvoiceModel {
  final String invoiceId;
  final int amount;
  final int earned;
  final int maxRedeem;
  final int redeemed;
  final String expiry;

  InvoiceModel({
    required this.invoiceId,
    required this.amount,
    required this.earned,
    required this.maxRedeem,
    required this.redeemed,
    required this.expiry, required int remaining,
  });

  int get remaining => earned - redeemed;
}