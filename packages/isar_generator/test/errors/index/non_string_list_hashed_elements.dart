// only string lists may have hashed elements

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  @Index(type: IndexType.hashElements)
  List<int>? list;
}
