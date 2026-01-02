import 'package:get/get.dart';
import '../controller/calculation_controller.dart';

class CalculationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CalculationController>(CalculationController());
  }
}
