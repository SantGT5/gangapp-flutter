import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gangapp_flutter/models/product_model.dart';
import 'package:gangapp_flutter/models/user_model.dart';
import 'package:gangapp_flutter/models/video_model.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GetImage {
  late String urlGetImage;
  late String pathImage;
  // final AuthController authController = Get.find();

  final picker = ImagePicker();

  Future uploadFileVideo(BuildContext context, File imageProfile,
      String videoUid, VideoModel updateVideo) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesVideos/$videoUid');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

          updateVideo.urlImage = url;

          // productController.createProduct(updateProduct);
        });
      },
    );
  }

  Future uploadFileProduct(BuildContext context, File imageProfile,
      String productUid, ProductModel updateProduct) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProducts/$productUid');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

          updateProduct.photoUrl = url;

          // productController.createProduct(updateProduct);
        });
      },
    );
  }

  Future uploadFileUser(
      BuildContext context, File imageProfile, UserModel updatedUser) async {
    firebase_storage.Reference storageReference = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child('imagesProfile/${updatedUser.uid}');

    firebase_storage.UploadTask uploadTask =
        storageReference.putFile(imageProfile);

    await uploadTask.whenComplete(
      () async {
        await storageReference.getDownloadURL().then((url) {
          urlGetImage = url;

          updatedUser.photoUrl = url;
        });
      },
    );
  }

  Future<String> _imgFromGallery(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;
    // await _uploadFile(context, File(image.path));
  }

  Future _imgFromCamera(BuildContext context) async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    print(image!.path);

    pathImage = image.path;

    return pathImage;

    // await _uploadFile(context, File(image.path));
  }

  Future showPicker(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
            child: Container(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text("Acceder a la galeria"),
                onTap: () async {
                  await _imgFromGallery(context);
                  Get.back();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text("Acceder a la cámara"),
                onTap: () async {
                  await _imgFromCamera(context);
                  Get.back();
                },
              ),
            ],
          ),
        ));
      },
    );
  }
}
