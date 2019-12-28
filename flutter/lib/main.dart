// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_addtoapp_basic/core/database.dart';
import 'package:flutter_addtoapp_basic/flutter_embedded_view.dart';
import 'package:flutter_addtoapp_basic/flutter_screen.dart';
import 'package:flutter_addtoapp_basic/models/person.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _setupDatabase();
  }

  _setupDatabase() async {
    final database =
        await $FloorAppDatabase.databaseBuilder('app_database1.db').build();

    Person person = await database.personDao.findPersonById(1);

    if (person == null) {
      person = Person(1, "Joshua");
    } else {
      await database.personDao.deletePerson(person);
      await database.personDao.insertPerson(person);
    }

    print("JDG ${person.name}");
  }

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
