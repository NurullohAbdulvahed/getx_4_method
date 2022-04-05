import 'package:get/get.dart';
import 'package:getx_4_method/controller/create_controller.dart';
import 'package:getx_4_method/controller/edit_controller.dart';
import 'package:getx_4_method/controller/home_controller.dart';

class DIService {
  static Future<void> init() async {
    //Get.put<PaymentController>(PaymentController());
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);
    Get.lazyPut<EditController>(() => EditController(), fenix: true);
    Get.lazyPut<CreateController>(() => CreateController(), fenix: true);
  }
}