// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final String id;
  final String name;
  final Uint8List cover;
  final String director;
  final int year;
  final bool seen;

  Movie(
      {required this.id,
      required this.name,
      required this.cover,
      required this.director,
      required this.year,
      required this.seen});

  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Movie(
      id: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType().mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      cover: const BlobType().mapFromDatabaseResponse(data['${effectivePrefix}cover'])!,
      director:
          const StringType().mapFromDatabaseResponse(data['${effectivePrefix}director'])!,
      year: const IntType().mapFromDatabaseResponse(data['${effectivePrefix}year'])!,
      seen: const BoolType().mapFromDatabaseResponse(data['${effectivePrefix}seen'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['cover'] = Variable<Uint8List>(cover);
    map['director'] = Variable<String>(director);
    map['year'] = Variable<int>(year);
    map['seen'] = Variable<bool>(seen);
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: Value(id),
      name: Value(name),
      cover: Value(cover),
      director: Value(director),
      year: Value(year),
      seen: Value(seen),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json, {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cover: serializer.fromJson<Uint8List>(json['cover']),
      director: serializer.fromJson<String>(json['director']),
      year: serializer.fromJson<int>(json['year']),
      seen: serializer.fromJson<bool>(json['seen']),
    );
  }

  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'cover': serializer.toJson<Uint8List>(cover),
      'director': serializer.toJson<String>(director),
      'year': serializer.toJson<int>(year),
      'seen': serializer.toJson<bool>(seen),
    };
  }

  Movie copyWith(
          {String? id,
          String? name,
          Uint8List? cover,
          String? director,
          int? year,
          bool? seen}) =>
      Movie(
        id: id ?? this.id,
        name: name ?? this.name,
        cover: cover ?? this.cover,
        director: director ?? this.director,
        year: year ?? this.year,
        seen: seen ?? this.seen,
      );

  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cover: $cover, ')
          ..write('director: $director, ')
          ..write('year: $year, ')
          ..write('seen: $seen')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, cover, director, year, seen);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.name == this.name &&
          other.cover == this.cover &&
          other.director == this.director &&
          other.year == this.year &&
          other.seen == this.seen);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<String> id;
  final Value<String> name;
  final Value<Uint8List> cover;
  final Value<String> director;
  final Value<int> year;
  final Value<bool> seen;

  const MoviesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cover = const Value.absent(),
    this.director = const Value.absent(),
    this.year = const Value.absent(),
    this.seen = const Value.absent(),
  });

  MoviesCompanion.insert({
    required String id,
    required String name,
    required Uint8List cover,
    required String director,
    required int year,
    required bool seen,
  })  : id = Value(id),
        name = Value(name),
        cover = Value(cover),
        director = Value(director),
        year = Value(year),
        seen = Value(seen);
  static Insertable<Movie> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<Uint8List>? cover,
    Expression<String>? director,
    Expression<int>? year,
    Expression<bool>? seen,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cover != null) 'cover': cover,
      if (director != null) 'director': director,
      if (year != null) 'year': year,
      if (seen != null) 'seen': seen,
    });
  }

  MoviesCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<Uint8List>? cover,
      Value<String>? director,
      Value<int>? year,
      Value<bool>? seen}) {
    return MoviesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      director: director ?? this.director,
      year: year ?? this.year,
      seen: seen ?? this.seen,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (cover.present) {
      map['cover'] = Variable<Uint8List>(cover.value);
    }
    if (director.present) {
      map['director'] = Variable<String>(director.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (seen.present) {
      map['seen'] = Variable<bool>(seen.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MoviesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cover: $cover, ')
          ..write('director: $director, ')
          ..write('year: $year, ')
          ..write('seen: $seen')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String? _alias;

  $MoviesTable(this._db, [this._alias]);

  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<String?> id = GeneratedColumn<String?>(
      'id', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  late final GeneratedColumn<Uint8List?> cover = GeneratedColumn<Uint8List?>(
      'cover', aliasedName, false,
      typeName: 'BLOB', requiredDuringInsert: true);
  final VerificationMeta _directorMeta = const VerificationMeta('director');
  late final GeneratedColumn<String?> director = GeneratedColumn<String?>(
      'director', aliasedName, false,
      typeName: 'TEXT', requiredDuringInsert: true);
  final VerificationMeta _yearMeta = const VerificationMeta('year');
  late final GeneratedColumn<int?> year = GeneratedColumn<int?>(
      'year', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _seenMeta = const VerificationMeta('seen');
  late final GeneratedColumn<bool?> seen = GeneratedColumn<bool?>(
      'seen', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (seen IN (0, 1))');

  @override
  List<GeneratedColumn> get $columns => [id, name, cover, director, year, seen];

  @override
  String get aliasedName => _alias ?? 'movies';

  @override
  String get actualTableName => 'movies';

  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(_nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(_coverMeta, cover.isAcceptableOrUnknown(data['cover']!, _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('director')) {
      context.handle(_directorMeta,
          director.isAcceptableOrUnknown(data['director']!, _directorMeta));
    } else if (isInserting) {
      context.missing(_directorMeta);
    }
    if (data.containsKey('year')) {
      context.handle(_yearMeta, year.isAcceptableOrUnknown(data['year']!, _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('seen')) {
      context.handle(_seenMeta, seen.isAcceptableOrUnknown(data['seen']!, _seenMeta));
    } else if (isInserting) {
      context.missing(_seenMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};

  @override
  Movie map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Movie.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MoviesTable movies = $MoviesTable(this);
  late final MoviesDao moviesDao = MoviesDao(this as AppDatabase);

  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();

  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}
