// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:floor/floor.dart';
import 'package:meta/meta.dart';

@entity
class Person {
  @primaryKey
  final int id;
  final String name;

  Person(this.id, this.name);
}
