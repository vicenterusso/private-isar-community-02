import 'package:isar-community/isar.dart';
import 'package:isar_test/isar_test.dart';
import 'package:test/test.dart';

part 'add_remove_link_test.g.dart';

@collection
@Name('Col')
class Col1 {
  Col1(this.id);
  Id? id;

  final IsarLink<Col1> link = IsarLink<Col1>();

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) => other is Col1 && id == other.id;
}

@collection
@Name('Col')
class Col2 {
  Col2(this.id);
  Id? id;

  @Name('link')
  final IsarLink<Col2> link1 = IsarLink<Col2>();

  final IsarLink<Col2> link2 = IsarLink<Col2>();

  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) => other is Col2 && id == other.id;
}

void main() {
  isarTest('Add remove link', () async {
    final isar1 = await openTempIsar([Col1Schema]);
    await isar1.tWriteTxn(() async {
      final obj = Col1(1);
      final linkedObj = Col1(2);
      await isar1.col1s.tPutAll([obj, linkedObj]);

      obj.link.value = linkedObj;
      await obj.link.tSave();
    });
    expect(await isar1.close(), true);

    final isar2 = await openTempIsar([Col2Schema], name: isar1.name);
    final obj = await isar2.col2s.tGet(1);
    await obj!.link1.tLoad();
    await obj.link2.tLoad();
    expect(obj.link1.value, Col2(2));
    expect(obj.link2.value, null);
    await isar2.tWriteTxn(() async {
      final obj3 = Col2(3);
      await isar2.col2s.tPut(obj3);

      obj.link2.value = obj3;
      await obj.link2.tSave();
    });
    expect(await isar2.close(), true);

    final isar3 = await openTempIsar([Col1Schema], name: isar1.name);
    final obj1 = await isar3.col1s.tGet(1);
    await obj1!.link.tLoad();
    expect(obj1.link.value, Col1(2));
  });
}
