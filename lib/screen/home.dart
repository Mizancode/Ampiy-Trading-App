import 'dart:convert';

import 'package:ampiy/global.dart';
import 'package:ampiy/widget/card_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final WebSocketService _webSocketService = WebSocketService();
  Map<String, dynamic>? tickerData;

  @override
  void initState() {
    super.initState();
    _webSocketService.connect();
    _webSocketService.stream.listen((event) {
      setState(() {
        tickerData = jsonDecode(event);
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = tickerData != null && tickerData!['data'] is List
        ? tickerData!['data'] as List
        : [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        elevation: 0,
      ),
      body: data.isEmpty
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 20.0, top: 10, bottom: 5),
                  child: Text(
                    'LIVE TRADING',
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 22,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final coin = tickerData!['data'][index];
                      return CardView(coin: coin);
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
