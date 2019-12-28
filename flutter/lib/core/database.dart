// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

 // required package imports
 import 'dart:async';
 import 'package:floor/floor.dart';
import 'package:flutter_addtoapp_basic/dao/person_dao.dart';
import 'package:flutter_addtoapp_basic/models/person.dart';
 import 'package:path/path.dart';
 import 'package:sqflite/sqflite.dart' as sqflite;   

 part 'database.g.dart'; // the generated code will be there

 @Database(version: 1, entities: [Person])
 abstract class AppDatabase extends FloorDatabase {
   PersonDao get personDao;
 }