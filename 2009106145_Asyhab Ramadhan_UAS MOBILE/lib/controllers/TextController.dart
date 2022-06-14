import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextController extends GetxController {
  TextEditingController namaCtrl = TextEditingController();
  TextEditingController merkCtrl = TextEditingController();
  TextEditingController sizeCtrl = TextEditingController();
  TextEditingController deskripsiCtrl = TextEditingController();

  @override
  void onClose() {
    namaCtrl.dispose();
    merkCtrl.dispose();
    sizeCtrl.dispose();
    deskripsiCtrl.dispose();

    print("Data Terhapus");
    super.onClose();
  }
}
