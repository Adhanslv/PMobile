import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreController extends GetxController {
  // Disini kita membuat collection (atau Table) bernama users
  var users = FirebaseFirestore.instance.collection("users").obs;
}
