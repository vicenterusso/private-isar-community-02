// bytes must not be nullable

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  late byte? prop;
}
