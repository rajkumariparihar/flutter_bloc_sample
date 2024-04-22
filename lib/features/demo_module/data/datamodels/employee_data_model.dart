import 'dart:convert';

List<EmployeeDatamodel> employeeDatamodelFromJson(String str) =>
    List<EmployeeDatamodel>.from(
        json.decode(str).map((x) => EmployeeDatamodel.fromJson(x)));

String employeeDatamodelToJson(List<EmployeeDatamodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmployeeDatamodel {
  int? id;
  String? imageUrl;
  String? firstName;
  String? lastName;
  String? email;
  String? contactNumber;
  int? age;
  String? dob;
  double? salary;
  String? address;

  EmployeeDatamodel(
      {this.id,
      this.imageUrl,
      this.firstName,
      this.lastName,
      this.email,
      this.contactNumber,
      this.age,
      this.dob,
      this.salary,
      this.address});

  EmployeeDatamodel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['imageUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    contactNumber = json['contactNumber'];
    age = json['age'];
    dob = json['dob'];
    salary = json['salary'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageUrl'] = this.imageUrl;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['contactNumber'] = this.contactNumber;
    data['age'] = this.age;
    data['dob'] = this.dob;
    data['salary'] = this.salary;
    data['address'] = this.address;
    return data;
  }
}
