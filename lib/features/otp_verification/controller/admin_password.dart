import 'package:get/get.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/url/restlet_api.dart';

class AdminPasswordController extends GetxController {
  final isLoading = false.obs;

  late final RestletApi api;
  late final EnvironmentServiceController env;

  @override
  void onInit() {
    super.onInit();
    api = Get.find<RestletApi>();
    env = Get.find<EnvironmentServiceController>();
  }

  Future<bool> verifyAdmin({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final response = await api.fetchReportData(
        env.getScriptId('verifyOtp'), // SAME endpoint
        {
          "email": email,
          "otp": "",
          "password": password,
        },
      );

      if (response['status'] == "SUCCESS" &&
          response['isadmin'] == true) {
        return true;
      }

      Get.snackbar("Error", response['message'] ?? "Invalid password");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
