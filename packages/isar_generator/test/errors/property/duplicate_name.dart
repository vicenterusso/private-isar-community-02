// same name

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  String? prop1;

  @Name('prop1')
  String? prop2;
}
