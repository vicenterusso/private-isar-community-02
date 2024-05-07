// ids cannot be indexed

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  @Index(composite: [CompositeIndex('id')])
  String? str;
}
