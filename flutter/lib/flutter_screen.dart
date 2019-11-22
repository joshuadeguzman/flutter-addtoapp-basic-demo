// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterScreen extends StatefulWidget {
  static String routeName = "/flutter-screen";

  @override
  State<StatefulWidget> createState() {
    return FlutterScreenState();
  }
}

class FlutterScreenState extends State<FlutterScreen> {
  static const usernameChannel = MethodChannel('channel-username');
  String _username;

  @override
  void initState() {
    super.initState();
    _subscribeToUsernameChannel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            onPressed: () async {
              // Send message to platform and received reply.
              final String reply = await usernameChannel.invokeMethod(
                "close-activity",
              );
              print("Message from the platform: $reply");
            },
          ),
          title: Text("Flutter Screen"),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text("Welcome,"),
                Text(_username ?? ""),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _subscribeToUsernameChannel() {
    // Receive method calls from native platform.
    usernameChannel.setMethodCallHandler((MethodCall call) async {
      switch (call.method) {
        case 'send-username':
          if (call.method is String) {
            setState(() {
              _username = call.arguments;
            });
          }
          return null;
        default:
          throw MissingPluginException();
      }
    });
  }
}
