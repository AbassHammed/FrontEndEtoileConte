import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/response_message.dart';
import '../providers/responsemessgae_provider.dart';
import 'dart:ui' as ui;

class ResponseMessageWidget extends StatefulWidget {
  const ResponseMessageWidget({super.key});

  @override
  _ResponseMessageWidgetState createState() => _ResponseMessageWidgetState();
}

class _ResponseMessageWidgetState extends State<ResponseMessageWidget>
    with SingleTickerProviderStateMixin {
  AnimationController? _fadeController;

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _fadeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MessageProvider>(
      builder: (context, messageProvider, child) {
        final responseMessage = messageProvider.currentMessage;

        if (responseMessage?.visible ?? false) {
          _fadeController?.reset();
          _fadeController?.forward();
        }

        return AnimatedBuilder(
          animation: _fadeController!,
          builder: (context, child) => FadeTransition(
            opacity: _fadeController!,
            child: responseMessage?.visible ?? false
                ? _buildMessageContainer(responseMessage!)
                : const SizedBox.shrink(),
          ),
        );
      },
    );
  }

  Widget _buildMessageContainer(ResponseMessage responseMessage) {
    return Center(
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.7),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, blurRadius: 10, offset: Offset(0, 2)),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            responseMessage.message,
            style: TextStyle(color: responseMessage.color),
          ),
        ),
      ),
    );
  }
}
