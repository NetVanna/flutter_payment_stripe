import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseMethod {
  Future addUserDetails(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("user")
        .doc(id)
        .set(userInfoMap);
  }

  Future addProduct(
      Map<String, dynamic> userInfoMap, String categoryName) async {
    return await FirebaseFirestore.instance
        .collection(categoryName)
        .add(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getProducts(String category) async {
    return FirebaseFirestore.instance.collection(category).snapshots();
  }

  Future<Stream<QuerySnapshot>> getOrders() async {
    return FirebaseFirestore.instance.collection("Orders").snapshots();
  }

  Future<Stream<QuerySnapshot>> allOrders() async {
    return FirebaseFirestore.instance
        .collection("Orders")
        .where("Status", isEqualTo: "On the way")
        .snapshots();
  }
  updateStatus(String id) async {
    return await FirebaseFirestore.instance
        .collection("Orders").doc(id)
        .update({"Status":"Delivered"});
  }

  // Future<Stream<QuerySnapshot>> getOrder(String email) async {
  //   return FirebaseFirestore.instance
  //       .collection("Orders")
  //       .where("Email", isEqualTo: email)
  //       .snapshots();
  // }

  Future orderDetails(Map<String, dynamic> userInfoMap) async {
    return await FirebaseFirestore.instance
        .collection("Orders")
        .add(userInfoMap);
  }
}
