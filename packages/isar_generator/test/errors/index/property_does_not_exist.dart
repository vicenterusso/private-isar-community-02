// property does not exist

import 'package:isar-community/isar.dart';

@collection
class Model {
  Id? id;

  @Index(composite: [CompositeIndex('myProp')])
  String? str;
}
