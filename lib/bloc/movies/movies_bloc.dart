import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:movies_list_bloc/main.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/model/repository/app_repository.dart';

import '../bloc.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(MoviesEmpty());

  @override
  Stream<MoviesState> mapEventToState(
    MoviesEvent event,
  ) async* {
    if (event is GetMovies) {
      yield MoviesLoading();

      try {
        final Stream<List<Movie>> watchedMovies =
            AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies =
            AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is InsertMovie) {
      yield MoviesLoading();

      //Get Form info from GlobalKey
      final String name =
          formKey.currentState.fields['name'].currentState.value;
      final Uint8List cover =
          (formKey.currentState.fields['cover'].currentState.value)
              .first
              .readAsBytesSync();
      final String director =
          formKey.currentState.fields['director'].currentState.value;
      final int year =
          int.parse(formKey.currentState.fields['year'].currentState.value);
      final bool watched =
          formKey.currentState.fields['watched'].currentState.value;

      // ignore: missing_required_param
      final Movie movie = Movie(
        name: name,
        cover: cover,
        director: director,
        year: year,
        watched: watched,
      );

      try {
        await AppRepository().insertMovie(movie);

        final Stream<List<Movie>> watchedMovies =
            AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies =
            AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is UpdateMovie) {
      yield MoviesLoading();

      //Get Form info from GlobalKey
      final String name =
          formKey.currentState.fields['name'].currentState.value;
      final Uint8List cover =
          (formKey.currentState.fields['cover'].currentState.value)
              .first
              .readAsBytesSync();
      final String director =
          formKey.currentState.fields['director'].currentState.value;
      final int year =
          int.parse(formKey.currentState.fields['year'].currentState.value);
      final bool watched =
          formKey.currentState.fields['watched'].currentState.value;

      // ignore: missing_required_param
      final Movie movie = Movie(
        id: event.movieId,
        name: name,
        cover: cover,
        director: director,
        year: year,
        watched: watched,
      );

      try {
        AppRepository().updateMovie(movie);

        final Stream<List<Movie>> watchedMovies =
            AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies =
            AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is DeleteMovie) {
      yield MoviesLoading();

      try {
        AppRepository().deleteMovie(event.movieId);

        final Stream<List<Movie>> watchedMovies =
            AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies =
            AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is EmptyMovies) {
      yield MoviesEmpty();
    }
  }
}
