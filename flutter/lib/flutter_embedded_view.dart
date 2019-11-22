// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlutterEmbeddedView extends StatefulWidget {
  static String routeName = "/flutter-embedded-view";

  @override
  State<StatefulWidget> createState() {
    return FlutterEmbeddedViewState();
  }
}

class FlutterEmbeddedViewState extends State<FlutterEmbeddedView> {
  static const embeddedMessagesChannel =
      BasicMessageChannel<String>('channel-embedded-messages', StringCodec());

  TextEditingController _textMessageToAndroidController;
  String _messageFromAndroid;
  bool _isValidMessage = true;

  @override
  void initState() {
    super.initState();
    _textMessageToAndroidController = TextEditingController();
    _subscribeToUsernameChannel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "FLUTTER VIEW",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text("Message from Android:"),
                  Text(_messageFromAndroid ?? ""),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text("Message to Android:"),
                  ),
                  TextField(
                    controller: _textMessageToAndroidController,
                    decoration: InputDecoration(
                      hintText: "Message...",
                      errorText:
                          _isValidMessage ? null : "Message is required!",
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (_textMessageToAndroidController.text.isNotEmpty) {
                        // Send message to native platform.
                        embeddedMessagesChannel.send(
                          _textMessageToAndroidController.text,
                        );
                        _isValidMessage = true;
                      } else {
                        setState(() {
                          _isValidMessage = false;
                        });
                      }
                    },
                    color: Colors.greenAccent,
                    child: Container(
                      child: Text("Send to Android"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _subscribeToUsernameChannel() {
    // Receive messages from the native platform.
    embeddedMessagesChannel.setMessageHandler((String message) async {
      if (message is String && message.isNotEmpty) {
        setState(() {
          _messageFromAndroid = message;
        });
      }
      return;
    });
  }
}
