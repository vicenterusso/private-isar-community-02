// objects may not be indexed

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  @Index()
  EmbeddedModel? obj;
}

@embedded
class EmbeddedModel {}
