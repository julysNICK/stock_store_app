import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SwapScreenLoginHome extends StatefulWidget {
  const SwapScreenLoginHome({super.key});

  @override
  State<SwapScreenLoginHome> createState() => _SwapScreenLoginHomeState();
}

class _SwapScreenLoginHomeState extends State<SwapScreenLoginHome> {
  FlutterSecureStorage storage = const FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCredentials(
      context,
    );
  }

  Future<void> getCredentials(BuildContext context) async {
    try {
      Map<String, String> allValues = await storage.readAll();

      final decodeJsonStore = jsonDecode(allValues['token']!);

      if (!mounted) return;
      print(decodeJsonStore);
      if (decodeJsonStore != null) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/login',
          (route) => false,
        );
      }
    } catch (e) {
      print(e);
      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login',
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(
        color: Colors.red,
      ),
    );
  }
}
