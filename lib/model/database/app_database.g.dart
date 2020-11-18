// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Movie extends DataClass implements Insertable<Movie> {
  final int id;
  final String name;
  final Uint8List cover;
  final String director;
  final int year;
  final bool watched;
  Movie(
      {@required this.id,
      @required this.name,
      @required this.cover,
      @required this.director,
      @required this.year,
      @required this.watched});
  factory Movie.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    final uint8ListType = db.typeSystem.forDartType<Uint8List>();
    final boolType = db.typeSystem.forDartType<bool>();
    return Movie(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      name: stringType.mapFromDatabaseResponse(data['${effectivePrefix}name']),
      cover: uint8ListType
          .mapFromDatabaseResponse(data['${effectivePrefix}cover']),
      director: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}director']),
      year: intType.mapFromDatabaseResponse(data['${effectivePrefix}year']),
      watched:
          boolType.mapFromDatabaseResponse(data['${effectivePrefix}watched']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || cover != null) {
      map['cover'] = Variable<Uint8List>(cover);
    }
    if (!nullToAbsent || director != null) {
      map['director'] = Variable<String>(director);
    }
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || watched != null) {
      map['watched'] = Variable<bool>(watched);
    }
    return map;
  }

  MoviesCompanion toCompanion(bool nullToAbsent) {
    return MoviesCompanion(
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      cover:
          cover == null && nullToAbsent ? const Value.absent() : Value(cover),
      director: director == null && nullToAbsent
          ? const Value.absent()
          : Value(director),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      watched: watched == null && nullToAbsent
          ? const Value.absent()
          : Value(watched),
    );
  }

  factory Movie.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Movie(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      cover: serializer.fromJson<Uint8List>(json['cover']),
      director: serializer.fromJson<String>(json['director']),
      year: serializer.fromJson<int>(json['year']),
      watched: serializer.fromJson<bool>(json['watched']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'cover': serializer.toJson<Uint8List>(cover),
      'director': serializer.toJson<String>(director),
      'year': serializer.toJson<int>(year),
      'watched': serializer.toJson<bool>(watched),
    };
  }

  Movie copyWith(
          {int id,
          String name,
          Uint8List cover,
          String director,
          int year,
          bool watched}) =>
      Movie(
        id: id ?? this.id,
        name: name ?? this.name,
        cover: cover ?? this.cover,
        director: director ?? this.director,
        year: year ?? this.year,
        watched: watched ?? this.watched,
      );
  @override
  String toString() {
    return (StringBuffer('Movie(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('cover: $cover, ')
          ..write('director: $director, ')
          ..write('year: $year, ')
          ..write('watched: $watched')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      id.hashCode,
      $mrjc(
          name.hashCode,
          $mrjc(
              cover.hashCode,
              $mrjc(director.hashCode,
                  $mrjc(year.hashCode, watched.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Movie &&
          other.id == this.id &&
          other.name == this.name &&
          other.cover == this.cover &&
          other.director == this.director &&
          other.year == this.year &&
          other.watched == this.watched);
}

class MoviesCompanion extends UpdateCompanion<Movie> {
  final Value<int> id;
  final Value<String> name;
  final Value<Uint8List> cover;
  final Value<String> director;
  final Value<int> year;
  final Value<bool> watched;
  const MoviesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.cover = const Value.absent(),
    this.director = const Value.absent(),
    this.year = const Value.absent(),
    this.watched = const Value.absent(),
  });
  MoviesCompanion.insert({
    this.id = const Value.absent(),
    @required String name,
    @required Uint8List cover,
    @required String director,
    @required int year,
    @required bool watched,
  })  : name = Value(name),
        cover = Value(cover),
        director = Value(director),
        year = Value(year),
        watched = Value(watched);
  static Insertable<Movie> custom({
    Expression<int> id,
    Expression<String> name,
    Expression<Uint8List> cover,
    Expression<String> director,
    Expression<int> year,
    Expression<bool> watched,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (cover != null) 'cover': cover,
      if (director != null) 'director': director,
      if (year != null) 'year': year,
      if (watched != null) 'watched': watched,
    });
  }

  MoviesCompanion copyWith(
      {Value<int> id,
      Value<String> name,
      Value<Uint8List> cover,
      Value<String> director,
      Value<int> year,
      Value<bool> watched}) {
    return MoviesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      cover: cover ?? this.cover,
      director: director ?? this.director,
      year: year ?? this.year,
      watched: watched ?? this.watched,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (watched.present) {
      map['watched'] = Variable<bool>(watched.value);
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
          ..write('watched: $watched')
          ..write(')'))
        .toString();
  }
}

class $MoviesTable extends Movies with TableInfo<$MoviesTable, Movie> {
  final GeneratedDatabase _db;
  final String _alias;
  $MoviesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _nameMeta = const VerificationMeta('name');
  GeneratedTextColumn _name;
  @override
  GeneratedTextColumn get name => _name ??= _constructName();
  GeneratedTextColumn _constructName() {
    return GeneratedTextColumn(
      'name',
      $tableName,
      false,
    );
  }

  final VerificationMeta _coverMeta = const VerificationMeta('cover');
  GeneratedBlobColumn _cover;
  @override
  GeneratedBlobColumn get cover => _cover ??= _constructCover();
  GeneratedBlobColumn _constructCover() {
    return GeneratedBlobColumn(
      'cover',
      $tableName,
      false,
    );
  }

  final VerificationMeta _directorMeta = const VerificationMeta('director');
  GeneratedTextColumn _director;
  @override
  GeneratedTextColumn get director => _director ??= _constructDirector();
  GeneratedTextColumn _constructDirector() {
    return GeneratedTextColumn(
      'director',
      $tableName,
      false,
    );
  }

  final VerificationMeta _yearMeta = const VerificationMeta('year');
  GeneratedIntColumn _year;
  @override
  GeneratedIntColumn get year => _year ??= _constructYear();
  GeneratedIntColumn _constructYear() {
    return GeneratedIntColumn(
      'year',
      $tableName,
      false,
    );
  }

  final VerificationMeta _watchedMeta = const VerificationMeta('watched');
  GeneratedBoolColumn _watched;
  @override
  GeneratedBoolColumn get watched => _watched ??= _constructWatched();
  GeneratedBoolColumn _constructWatched() {
    return GeneratedBoolColumn(
      'watched',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [id, name, cover, director, year, watched];
  @override
  $MoviesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'movies';
  @override
  final String actualTableName = 'movies';
  @override
  VerificationContext validateIntegrity(Insertable<Movie> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name'], _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('cover')) {
      context.handle(
          _coverMeta, cover.isAcceptableOrUnknown(data['cover'], _coverMeta));
    } else if (isInserting) {
      context.missing(_coverMeta);
    }
    if (data.containsKey('director')) {
      context.handle(_directorMeta,
          director.isAcceptableOrUnknown(data['director'], _directorMeta));
    } else if (isInserting) {
      context.missing(_directorMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
          _yearMeta, year.isAcceptableOrUnknown(data['year'], _yearMeta));
    } else if (isInserting) {
      context.missing(_yearMeta);
    }
    if (data.containsKey('watched')) {
      context.handle(_watchedMeta,
          watched.isAcceptableOrUnknown(data['watched'], _watchedMeta));
    } else if (isInserting) {
      context.missing(_watchedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Movie map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Movie.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $MoviesTable createAlias(String alias) {
    return $MoviesTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $MoviesTable _movies;
  $MoviesTable get movies => _movies ??= $MoviesTable(this);
  MoviesDao _moviesDao;
  MoviesDao get moviesDao => _moviesDao ??= MoviesDao(this as AppDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movies];
}
