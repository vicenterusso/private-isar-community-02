// names must not be blank or start with "_"

import 'package:isar_community/isar.dart';

@collection
class Model {
  Id? id;

  @Name('_prop')
  String? prop;
}
