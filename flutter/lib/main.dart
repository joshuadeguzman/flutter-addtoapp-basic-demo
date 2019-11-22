// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:gdgph_devfest_flutter/flutter_embedded_view.dart';
import 'package:gdgph_devfest_flutter/flutter_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        FlutterScreen.routeName: (context) => FlutterScreen(),
        FlutterEmbeddedView.routeName: (context) => FlutterEmbeddedView(),
      },
      home: FlutterScreen(),
    );
  }
}
