// Copyright 2019 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:floor/floor.dart';
import 'package:flutter_addtoapp_basic/models/person.dart';

@dao
abstract class PersonDao {
  @Query('SELECT * FROM Person')
  Future<List<Person>> findAllPersons();

  @Query('SELECT * FROM Person WHERE id = :id')
  Future<Person> findPersonById(int id);

  @insert
  Future<void> insertPerson(Person person);

  @delete
  Future<void> deletePerson(Person person);
}
