import 'package:flutter/material.dart';

class ResponseMessage {
  final String message;
  final Color color;
  bool visible;

  ResponseMessage({
    required this.message,
    this.color = Colors.black,
    this.visible = true,
  });
}
