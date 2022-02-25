import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gangapp_flutter/models/video_model.dart';
import 'package:gangapp_flutter/services/firestore/firestore_service.dart';

class DataBaseVideos {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static String _collection = "videos";
  static FirestoreService _service = FirestoreService(_collection);

  Stream<List<VideoModel>> videosStream() {
    return _firestore
        .collection(_collection)
        .snapshots()
        .map((QuerySnapshot query) {
      List<VideoModel> retVal = [];
      for (var element in query.docs) {
        retVal.add(VideoModel.fromJson(element.data() as Map<String, dynamic>));
      }
      print(retVal);
      return retVal;
    });
  }

  Future<bool> createNewVideo(VideoModel video) async {
    try {
      video.uid = _service.generateId();
      await _firestore.collection(_collection).doc(video.uid).set({
        "uid": video.uid,
        "title": video.title,
        "subtitle": video.subtitle,
        "urlVideo": video.urlVideo,
        "urlImage": video.urlImage,

        //   this.originalPrice,
        // this.realPrice,
        // this.productCategory
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  /// GENERATE ID
  String generateIdVideos() {
    return FirebaseFirestore.instance.collection(_collection).doc().id;
  }
}
