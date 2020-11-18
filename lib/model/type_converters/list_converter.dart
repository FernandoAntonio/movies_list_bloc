import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

part 'list_converter.g.dart';

@JsonSerializable()
class ListDatabase {
  ListDatabase(this.list);

  List<dynamic> list;

  factory ListDatabase.fromJson(Map<String, dynamic> json) =>
      _$ListDatabaseFromJson(json);

  Map<String, dynamic> toJson() => _$ListDatabaseToJson(this);
}

class ListConverter extends TypeConverter<ListDatabase, String> {
  const ListConverter();

  @override
  ListDatabase mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    return ListDatabase.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String mapToSql(ListDatabase value) {
    if (value == null) {
      return null;
    }

    return json.encode(value.toJson());
  }
}
