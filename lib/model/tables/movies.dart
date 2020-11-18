import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';

class Movies extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  BlobColumn get cover => blob()();
  TextColumn get director => text()();
  IntColumn get year => integer()();
  BoolColumn get watched => boolean()();
}
