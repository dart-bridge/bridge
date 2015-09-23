library migrations;

import 'dart:async';
import 'package:bridge/database.dart';

class CreateUsersTable extends Migration {
  Future run(Gateway gateway) async {
    await gateway.create('users', (schema) {
      schema.id();
      schema.string('email').unique().nullable(false);
      schema.string('password', 60);
      schema.string('first_name');
      schema.string('last_name');
      schema.timestamps();
    });
  }

  Future rollback(Gateway gateway) async {
    await gateway.drop('users');
  }
}