import 'package:moor/moor.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';

part 'movies_dao.g.dart';

@UseDao()
class MoviesDao extends DatabaseAccessor<AppDatabase> with _$MoviesDaoMixin {
  MoviesDao(AppDatabase db) : super(db);

  //Create
  Future insertMovie(Insertable<Movie> movie) => into(db.movies).insert(movie);

  //Read
  Stream<List<Movie>> watchAllWatchedMovies() =>
      (select(db.movies)..where((t) => t.seen.equals(true))).watch();

  Stream<List<Movie>> watchAllUnseenMovies() =>
      (select(db.movies)..where((t) => t.seen.equals(false))).watch();

  //Update
  Future updateMovie(Insertable<Movie> movie) => update(db.movies).replace(movie);

  //Delete
  Future deleteMovie(String id) =>
      (delete(db.movies)..where((t) => t.id.equals(id))).go();
}
