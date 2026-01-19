import 'package:get/get.dart';

import 'package:sm_reward_app/features/otp_verification/model/otp_model.dart';
import 'package:sm_reward_app/services/credentials/environment_controller.dart';
import 'package:sm_reward_app/services/secure_storage_service.dart';
import 'package:sm_reward_app/services/url/restlet_api.dart';

class AdminPasswordController extends GetxController {
  final isLoading = false.obs;

  late final RestletApi api;
  late final EnvironmentServiceController env;
  late final SecureStorageService storage;

  @override
  void onInit() {
    super.onInit();
    api = Get.find<RestletApi>();
    env = Get.find<EnvironmentServiceController>();
    storage = Get.find<SecureStorageService>();
  }

  Future<bool> verifyAdmin({
    required String email,
    required String password,
  }) async {
    try {
      isLoading.value = true;

      final request = OtpVerifyRequest(
        email: email,
        password: password,
      );

      final response = await api.fetchReportData(
        env.getScriptId('verifyOtp'),
        request.toJson(),
      );

      if (response == null) {
        Get.snackbar("Error", "No response from server");
        return false;
      }

      final result = OtpVerifyResponse.fromJson(response);

      if (result.status == "SUCCESS" && result.isAdmin) {
        // 🔥 SAVE SESSION
        await storage.saveToken(result.token);
        return true;
      }

      Get.snackbar("Error", result.message);
      return false;
    } catch (e) {
      Get.snackbar("Error", "Login failed");
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
