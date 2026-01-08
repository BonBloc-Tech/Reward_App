class RewardModel {
  final String invoice;
  final String date;
  final String activity;
  final int credit;
  final int redeemed;
  final int balance;
  final String expiry;

  RewardModel({
    required this.invoice,
    required this.date,
    required this.activity,
    required this.credit,
    required this.redeemed,
    required this.balance,
    required this.expiry,
  });

  static List<RewardModel> sampleList() {
    return [
      RewardModel(
        invoice: "INV-456",
        date: "12.06.2025",
        activity: "Car Service",
        credit: 10000,
        redeemed: 1000,
        balance: 9000,
        expiry: "12.06.2026",
      ),
      RewardModel(
        invoice: "INV-879",
        date: "01.01.2025",
        activity: "Service Labour",
        credit: 20000,
        redeemed: 2000,
        balance: 18000,
        expiry: "01.01.2026",
      ),
      
    RewardModel(
      invoice: "INV-987",
      date: "2025, 3, 22",
      activity: "Full Car Service",
      credit: 8000,
      redeemed: 800,
      balance: 7200,
      expiry: "2026, 3, 22",
    ),
    RewardModel(
      invoice: "INV-932",
      date:"2025, 5, 5",
      activity: "Purchase Engine Oil",
      credit: 7000,
      redeemed: 700,
      balance: 6300,
      expiry: "2026, 5, 5",
    ),
    RewardModel(
      invoice: "INV-123",
      date: "2025, 7, 7",
      activity: "Headlight Bulb Purchase",
      credit: 5000,
      redeemed: 500,
      balance: 4500,
      expiry:"2026, 7, 7",
    ),
    RewardModel(
      invoice: "INV-124",
      date: "2025, 7, 5",
      activity: "Light Purchase",
      credit: 5000,
      redeemed: 500,
      balance: 4500,
      expiry: "2026, 7, 5",
    ),
    ];
  }
}
