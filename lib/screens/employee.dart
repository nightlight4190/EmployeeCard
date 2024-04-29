// ignore_for_file: non_constant_identifier_names

import 'package:employeecard/service/database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import '../components/field_container.dart';
import '../components/field_name.dart';

class Employee extends StatefulWidget {
  const Employee({super.key});

  @override
  State<Employee> createState() => _EmployeeState();
}

class _EmployeeState extends State<Employee> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Employee",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blue,
                fontSize: 22,
              ),
            ),
            Text(
              "Form",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                fontSize: 22,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FormFieldName(title: "Name"),
              SizedBox(height: 10.0),
              FieldContainer(controller: nameController),
              SizedBox(height: 20.0),
              FormFieldName(title: "Age"),
              SizedBox(height: 10.0),
              FieldContainer(controller: ageController),
              SizedBox(height: 20.0),
              FormFieldName(title: "Location"),
              SizedBox(height: 10.0),
              FieldContainer(controller: locationController),
              SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    String Id = randomAlpha(10);
                    Map<String, dynamic> employeeInfoMap = {
                      "Name": nameController.text,
                      "Age": ageController.text,
                      "Id": Id,
                      "Location": locationController.text,
                    };
                    try {
                      await DatabaseMethods()
                          .addEmployeeDetail(employeeInfoMap, Id);
                      Fluttertoast.showToast(
                        msg: "Employee detail has been uploaded successfully",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.green,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    } catch (e) {
                      print("Error uploading employee detail: $e");
                      Fluttertoast.showToast(
                        msg: "Error uploading employee detail",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.CENTER,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0,
                      );
                    }
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
