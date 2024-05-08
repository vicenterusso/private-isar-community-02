// unsupported enum property type

import 'package:isar_community/isar.dart';

@collection
class Model {
  Id? id;

  @Enumerated(EnumType.value, 'value')
  late MyEnum field;
}

enum MyEnum {
  optionA;

  final bool value = true;
}
