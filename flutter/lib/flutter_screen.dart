// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  final storage = FlutterSecureStorage();
  final String KEY_API_TOKEN = 'api_token';
  String _data = "";

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
                Container(
                  margin: EdgeInsets.all(16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'API TOKEN',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 5)),
                          Text(
                            '$_data',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 10)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text('Generate'),
                                onPressed: _generateApiToken,
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              RaisedButton(
                                child: Text('Save'),
                                onPressed: _saveApiToken,
                              ),
                              Padding(padding: EdgeInsets.all(10)),
                              RaisedButton(
                                child: Text('Read'),
                                onPressed: _readApiToken,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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

  _generateApiToken() {
    var desiredLength = 25;
    var rand = new Random();
    var randomString = new List.generate(desiredLength, (index) {
      return rand.nextInt(33) + 89;
    });

    setState(() {
      // Retrieve generated string
      _data = String.fromCharCodes(randomString);

      // Log
      print("Succesfully generated $_data");
    });
  }

  _saveApiToken() async {
    await storage.write(key: KEY_API_TOKEN, value: _data);

    // Log
    print("Succesfully saved $_data");
  }

  _readApiToken() async {
    String apiToken = await storage.read(key: KEY_API_TOKEN);

    setState(() {
      // Assign the retrieve data locally via synchronous call
      _data = apiToken;

      // Log
      print("Succesfully retrieved $_data");
    });
  }
}
