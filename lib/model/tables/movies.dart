import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Movies extends Table {
  TextColumn get id => text()();

  TextColumn get name => text()();

  BlobColumn get cover => blob()();

  TextColumn get director => text()();

  IntColumn get year => integer()();

  BoolColumn get seen => boolean()();

  @override
  Set<Column> get primaryKey => {id};
}
