import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  //for adding data to the firestore
  Future<void> addEmployeeDetail(
      Map<String, dynamic> employeeInfoMap, String id) async {
    try {
      await FirebaseFirestore.instance
          .collection("Employee")
          .doc(id)
          .set(employeeInfoMap);
      print("Employee detail added successfully");
    } catch (e) {
      print("Error adding employee detail: $e");
      // Handle error if necessary
    }
  }

  //READ
  //for getting the data from the firestore
  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  //UPDATE
  //for updating data in firestore
  Future updateEmployeeDetail(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .update(updateInfo);
  }

//DELETE
  //delete employee details
  Future deleteEmployeeDetail(String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .delete();
  }
}
