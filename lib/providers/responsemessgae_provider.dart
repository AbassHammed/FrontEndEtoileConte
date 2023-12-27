import 'package:flutter/material.dart';
import '../models/response_message.dart';

class MessageProvider with ChangeNotifier {
  ResponseMessage? _currentMessage;

  ResponseMessage? get currentMessage => _currentMessage;

  void showMessage(String message, Color color) {
    _currentMessage = ResponseMessage(message: message, color: color);
    notifyListeners();

    Future.delayed(const Duration(seconds: 3), () {
      hideMessage();
    });
  }

  void hideMessage() {
    _currentMessage = null;
    notifyListeners();
  }
}
