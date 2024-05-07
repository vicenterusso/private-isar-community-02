// names must not be blank or start with "_"

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  @Index(name: '_index')
  String? str;
}
