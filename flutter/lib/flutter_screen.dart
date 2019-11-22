// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class FlutterScreen extends StatefulWidget {
  static String routeName = "/flutter-screen";

  @override
  State<StatefulWidget> createState() {
    return FlutterScreenState();
  }
}

class FlutterScreenState extends State<FlutterScreen> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
