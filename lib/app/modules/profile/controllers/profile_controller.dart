import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../network/utils/log_util.dart';

class ProfileController extends GetxController {
  RxString userProfileImg = "https://ymw.edu.in/wp-content/uploads/2022/02/dummy-profile-01.png".obs;
  RxString userName = "Alex".obs;
  RxString userPhone = "9548216523".obs;
  RxString email = "xyz@gmail.com".obs;

  //Edit Profile
  final pickedImage = Rx<File?>(null).obs;
  final picker = ImagePicker();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  var ctrFirstName = TextEditingController();
  var ctrLastName = TextEditingController();
  var ctrlEmail = TextEditingController();
  var ctrPhone = TextEditingController();
  var ctrlSellPercentage = TextEditingController();
  var ctrlBuyPercentage = TextEditingController();

  FocusNode firstNameFocus = FocusNode();
  FocusNode lastNameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  FocusNode sellPercFocus = FocusNode();
  FocusNode buyPercFocus = FocusNode();

  RxBool hidePassword = true.obs;
  RxBool hidePasswordCon = true.obs;

  @override
  void onInit() {
    ctrFirstName.text = "ALex";
    ctrlEmail.text = "xyz@knoxweb.com";
    ctrPhone.text = "9512824252";
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<bool> checkPermissions() async {
    var cameraStatus = await Permission.camera.status;
    PermissionStatus storageStatus;
    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      storageStatus = (deviceInfo.version.sdkInt >= 32 ? await Permission.photos.status : await Permission.storage.status);
    } else {
      storageStatus = await Permission.storage.status;
    }

    if (cameraStatus.isDenied || storageStatus.isDenied) {
      Alert.log(runtimeType.toString(), "Permission is denied.");
      return request();
    } else if (cameraStatus.isGranted && storageStatus.isGranted) {
      Alert.log(runtimeType.toString(), "Permission is already granted.");
      return true;
    } else if (cameraStatus.isPermanentlyDenied || storageStatus.isPermanentlyDenied) {
      Alert.log(runtimeType.toString(), "Permission is permanently denied");
      return false;
    } else if (cameraStatus.isRestricted || storageStatus.isRestricted) {
      Alert.log(runtimeType.toString(), "Permission is OS restricted.");
      return false;
    }
    return false;
  }

  Future<bool> request() async {
    Permission storagePermission;

    if (Platform.isAndroid) {
      final deviceInfo = await DeviceInfoPlugin().androidInfo;
      storagePermission = deviceInfo.version.sdkInt > 32 ? Permission.photos : Permission.storage;
    } else {
      storagePermission = Permission.storage;
    }

    Map<Permission, PermissionStatus> statuses = await [Permission.camera, storagePermission].request().then((value) {
      Alert.log(runtimeType.toString(), "PERMISSION REQUESTED => $value");
      return value;
    });

    Alert.log(runtimeType.toString(), "PERMISSION =>\nCAMERA : ${statuses[Permission.camera]}\nSTORAGE : ${statuses[Permission.storage]}");

    if (statuses[Permission.camera] == PermissionStatus.granted && statuses[Permission.storage] == PermissionStatus.granted) {
      return true;
    } else {
      return false;
    }
  }

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Alert.log(runtimeType.toString(), "PICK GALLERY IMAGE PATH ${pickedFile.path}");
      pickedImage.value.value = File(pickedFile.path);
      Alert.log(runtimeType.toString(), "PICK GALLERY IMAGE PATH 1 ${pickedImage.value.value}");
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      Alert.log(runtimeType.toString(), "PICK CAMERA IMAGE PATH ${pickedFile.path}");
      pickedImage.value.value = File(pickedFile.path);
      Alert.log(runtimeType.toString(), "PICK CAMERA IMAGE PATH 1 ${pickedImage.value.value}");
    }
  }
}
