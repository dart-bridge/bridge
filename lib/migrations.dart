library migrations;

import 'dart:async';
import 'package:bridge/database.dart';

class CreateUsersTable extends Migration {
  Future run(Gateway gateway) async {
    await gateway.model('users', (schema) {
      schema.string('email').unique().nullable(false);
      schema.string('password', 60);
      schema.string('first_name');
      schema.string('last_name');
    });
  }

  Future rollback(Gateway gateway) async {
    await gateway.drop('users');
  }
}