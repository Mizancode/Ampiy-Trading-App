import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketService {
  WebSocketChannel? _channel;

  void connect() {
    _channel = WebSocketChannel.connect(
      Uri.parse('ws://prereg.ex.api.ampiy.com/prices'),
    );
    _subscribe();
  }

  void _subscribe() {
    if (_channel != null) {
      final subscriptionMessage = {
        "method": "SUBSCRIBE",
        "params": ["all@ticker"],
        "cid": 1,
      };
      _channel?.sink.add(jsonEncode(subscriptionMessage));
    }
  }
  Stream get stream => _channel!.stream;
}