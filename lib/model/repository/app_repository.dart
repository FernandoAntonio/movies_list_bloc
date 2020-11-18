import 'package:moor_flutter/moor_flutter.dart';
import 'package:movies_list_bloc/main.dart';
import 'package:movies_list_bloc/model/daos/movies_dao.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';

class AppRepository {
  AppRepository() {
    AppDatabase db = database;
    _moviesDao = db.moviesDao;
  }

  MoviesDao _moviesDao;

  Future insertMovie(Insertable<Movie> movie) => _moviesDao.insertMovie(movie);

  Stream<List<Movie>> watchAllWatchedMovies() => _moviesDao.watchAllWatchedMovies();
  Stream<List<Movie>> watchAllUnseenMovies() => _moviesDao.watchAllUnseenMovies();

  updateMovie(Insertable<Movie> movie) => _moviesDao.updateMovie(movie);

  deleteMovie(int id) => _moviesDao.deleteMovie(id);
}
