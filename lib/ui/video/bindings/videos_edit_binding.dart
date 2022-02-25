import 'package:gangapp_flutter/ui/video/controllers/videos_edit_controller.dart';
import 'package:get/get.dart';

class VideosEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideosEditController());
  }
}
