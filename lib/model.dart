// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<Welcome> welcomeFromJson(String str) => List<Welcome>.from(json.decode(str).map((x) => Welcome.fromJson(x)));

String welcomeToJson(List<Welcome> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Welcome {
  Employee employee;

  Welcome({
    required this.employee,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    employee: Employee.fromJson(json["employee"]),
  );

  Map<String, dynamic> toJson() => {
    "employee": employee.toJson(),
  };
}

class Employee {
  String name;
  int salary;
  bool married;

  Employee({
    required this.name,
    required this.salary,
    required this.married,
  });

  factory Employee.fromJson(Map<String, dynamic> json) => Employee(
    name: json["name"],
    salary: json["salary"],
    married: json["married"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "salary": salary,
    "married": married,
  };
}
