// links type must not be nullable

import 'package:isar_community/isar.dart';

@collection
class Model {
  Id? id;

  final IsarLink<Model2?> link = IsarLink();
}

@collection
class Model2 {
  Id? id;
}
