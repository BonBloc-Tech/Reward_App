import '../model/admin_model.dart';
import '../model/reward_model.dart';

class RewardsController {
  CustomerModel selectedCustomer = CustomerModel.sample();

  final List<String> customers = [
    "BHARAT KALRA & CO",
    "BUS OWNERS CO-OP. SOC LTD",
    "ERODE LORRY OWNERS ASSOCIATION",
    "GVK EMRI STORES",
    "DIVISIONAL CONTROLLER",
    "METTUR TALUK LORRY OWNERS ASSN",
  ];

  final List<RewardModel> rewards = RewardModel.sampleList();
}
