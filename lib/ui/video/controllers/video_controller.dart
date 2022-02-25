import 'package:gangapp_flutter/models/video_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service_videos.dart';
import 'package:get/get.dart';

class VideoController extends GetxController {
  Rx<List<VideoModel>> videosList = Rx<List<VideoModel>>([]);

  @override
  void onReady() {
    videosList.bindStream(DataBaseVideos().videosStream());
    super.onReady();
  }
}
