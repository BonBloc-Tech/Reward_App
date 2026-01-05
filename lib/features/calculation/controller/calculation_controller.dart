import 'package:get/get.dart';
import 'package:sm_reward_app/features/calculation/model/calculation_model.dart';


class CalculationController extends GetxController {
  final invoices = <InvoiceModel>[].obs;

  final totalEarned = 18000.obs;
  final totalRedeemed = 6000.obs;
  final availablePoints = 12000.obs;

  @override
  void onInit() {
    super.onInit();
    loadInvoices();
  }

  void loadInvoices() {
    invoices.assignAll([
      InvoiceModel(
        invoiceId: 'INV-001',
        amount: 10000,
        earned: 1000,
        maxRedeem: 1000,
        redeemed: 500,
        expiry: '12.06.2026',
        remaining: 0
      ),
      InvoiceModel(
        invoiceId: 'INV-002',
        amount: 15000,
        earned: 1500,
        maxRedeem: 1500,
        redeemed: 1000,
        expiry: '01.01.2026',
         remaining: 0
      ),
      InvoiceModel(
        invoiceId: 'INV-003',
        amount: 8000,
        earned: 800,
        maxRedeem: 800,
        redeemed: 0,
        expiry: '22.03.2026',
         remaining: 0
      ),
      InvoiceModel(
        invoiceId: 'INV-004',
        amount: 20000,
        earned: 2000,
        maxRedeem: 2000,
        redeemed: 1500,
        expiry: '10.09.2026',
         remaining: 0
      ),
      InvoiceModel(
        invoiceId: 'INV-005',
        amount: 12000,
        earned: 1200,
        maxRedeem: 1200,
        redeemed: 1200,
        expiry: '18.11.2026',
         remaining: 0
      ),
      InvoiceModel(
        invoiceId: 'INV-006',
        amount: 9000,
        earned: 900,
        maxRedeem: 900,
        redeemed: 300,
        expiry: '30.12.2026',
         remaining: 0
      ),
    ]);
  }

  // Format currency with ₹ symbol
  String formatCurrency(int amount) {
    return '₹$amount';
  }

  // Format points
  String formatPoints(int points) {
    return '$points pts';
  }
}