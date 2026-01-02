import 'package:get/get.dart';
import '../model/history_model.dart';

class HistoryController extends GetxController {
  /// 🔹 ORIGINAL DATA (FIGMA DATA)
  final historyList = <HistoryModel>[
    HistoryModel(
      invoiceId: "INV-456",
      date: DateTime(2025, 6, 12),
      activityType: "Car Service",
      credit: 10000,
      redeem: 1000,
      balance: 9000,
      expiryDate: DateTime(2026, 6, 12),
    ),
    HistoryModel(
      invoiceId: "INV-879",
      date: DateTime(2025, 1, 1),
      activityType: "Service Labour",
      credit: 20000,
      redeem: 2000,
      balance: 18000,
      expiryDate: DateTime(2026, 1, 1),
    ),
    HistoryModel(
      invoiceId: "INV-987",
      date: DateTime(2025, 3, 22),
      activityType: "Full Car Service",
      credit: 8000,
      redeem: 800,
      balance: 7200,
      expiryDate: DateTime(2026, 3, 22),
    ),
    HistoryModel(
      invoiceId: "INV-932",
      date: DateTime(2025, 5, 5),
      activityType: "Purchase Engine Oil",
      credit: 7000,
      redeem: 700,
      balance: 6300,
      expiryDate: DateTime(2026, 5, 5),
    ),
    HistoryModel(
      invoiceId: "INV-123",
      date: DateTime(2025, 7, 7),
      activityType: "Headlight Bulb Purchase",
      credit: 5000,
      redeem: 500,
      balance: 4500,
      expiryDate: DateTime(2026, 7, 7),
    ),
    HistoryModel(
      invoiceId: "INV-124",
      date: DateTime(2025, 7, 5),
      activityType: "Light Purchase",
      credit: 5000,
      redeem: 500,
      balance: 4500,
      expiryDate: DateTime(2026, 7, 5),
    ),
  ].obs;

  /// 🔹 FILTERED DATA (USED IN UI)
  final filteredList = <HistoryModel>[].obs;

  final isLast30Days = false.obs;
  final searchText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredList.assignAll(historyList);
  }

  /// 🔍 SEARCH HANDLER
  void onSearch(String value) {
    searchText.value = value.toLowerCase();
    _applyFilters();
  }

  /// 📅 LAST 30 DAYS TOGGLE
  void toggleLast30Days(bool value) {
    isLast30Days.value = value;
    _applyFilters();
  }

  /// 🔄 APPLY SEARCH + DATE FILTER
  void _applyFilters() {
    /// 🔴 IMPORTANT
    /// For demo/testing → keep fixed date
    /// For production → use DateTime.now()
    final DateTime now = DateTime(2025, 7, 31);
    // final DateTime now = DateTime.now();

    filteredList.assignAll(
      historyList.where((item) {
        /// 📅 DATE FILTER
        bool dateMatch = true;
        if (isLast30Days.value) {
          final last30 = now.subtract(const Duration(days: 30));
          dateMatch =
              item.date.isAfter(last30) && item.date.isBefore(now);
        }

        /// 🔍 SEARCH FILTER
        bool searchMatch =
            item.invoiceId.toLowerCase().contains(searchText.value) ||
                item.activityType
                    .toLowerCase()
                    .contains(searchText.value);

        return dateMatch && searchMatch;
      }).toList(),
    );
  }
}
