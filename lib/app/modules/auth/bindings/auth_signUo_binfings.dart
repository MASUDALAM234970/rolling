import 'package:get/get.dart';
import 'package:rolling/app/modules/auth/controllers/SignUp_Controller.dart';



class SignUpbinding extends Bindings {
  void dependencies() {


    Get.put<SignUpController>(SignUpController());
  }
}
