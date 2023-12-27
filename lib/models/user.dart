import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../screens/MainPage.dart';
import '../providers/responsemessgae_provider.dart';
import 'package:provider/provider.dart';

class CustomUser {
  final int id;
  final String email;
  final String? firstName;
  final String? lastName;
  bool isActive;
  bool isStaff;
  DateTime dateJoined;

  CustomUser({
    required this.id,
    required this.email,
    this.firstName,
    this.lastName,
    this.isActive = true,
    this.isStaff = false,
    required this.dateJoined,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'is_active': isActive,
      'is_staff': isStaff,
      'date_joined': dateJoined.toIso8601String(),
    };
  }

  factory CustomUser.fromJson(Map<String, dynamic> map) {
    return CustomUser(
      id: map['id'],
      email: map['email'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      isActive: map['is_active'],
      isStaff: map['is_staff'],
      dateJoined: DateTime.parse(map['date_joined']),
    );
  }

  CustomUser copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    bool? isActive,
    bool? isStaff,
    DateTime? dateJoined,
  }) {
    return CustomUser(
      id: id ?? this.id,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      isActive: isActive ?? this.isActive,
      isStaff: isStaff ?? this.isStaff,
      dateJoined: dateJoined ?? this.dateJoined,
    );
  }

  static Future<void> registerUser(
      BuildContext context,
      String email,
      String firstName,
      String lastName,
      String password,
      String confirmPassword) async {
    final Uri apiEndpoint = Uri.parse('http://10.0.2.2:8000/user/');

    try {
      if (password != confirmPassword) {
        throw Exception("Passwords do not match.");
      }

      final response = await http.post(
        apiEndpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'first_name': firstName,
          'last_name': lastName,
          'password': password,
          'confirm_password': confirmPassword,
        }),
      );

      if (response.statusCode == 200) {
        String message = jsonDecode(response.body)['message'];

        Provider.of<MessageProvider>(context, listen: false).showMessage(
          message,
          Colors.green,
        );

        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const EtoileConteScreen()),
          );
        });
      } else {
        String message = jsonDecode(response.body)['message'];
        Provider.of<MessageProvider>(context, listen: false).showMessage(
          message,
          Colors.red,
        );
      }
    } catch (e) {
      throw Exception("Error occurred during registration: $e");
    }
  }

  static Future<void> loginUser(
      BuildContext context, String email, String password) async {
    final Uri apiEndpoint = Uri.parse('http://10.0.2.2:8000/login/');

    try {
      final response = await http.post(
        apiEndpoint,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        String message = jsonDecode(response.body)['message'];

        Provider.of<MessageProvider>(context, listen: false).showMessage(
          message,
          Colors.green,
        );

        Future.delayed(const Duration(seconds: 3), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const EtoileConteScreen()),
          );
        });
      } else {
        String message = jsonDecode(response.body)['message'];
        Provider.of<MessageProvider>(context, listen: false).showMessage(
          message,
          Colors.red,
        );
      }
    } catch (e) {
      throw Exception("Error occurred during login: $e");
    }
  }
}
