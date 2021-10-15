import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:movies_list_bloc/main.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/model/repository/app_repository.dart';
import 'package:uuid/uuid.dart';

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
        final Stream<List<Movie>> watchedMovies = AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies = AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is InsertMovie) {
      yield MoviesLoading();

      //Get Form info from GlobalKey
      final String name = formKey.currentState!.fields['name']!.value;
      final Uint8List cover =
          (formKey.currentState!.fields['cover']!.value).first.readAsBytesSync();
      final String director = formKey.currentState!.fields['director']!.value;
      final int year = int.parse(formKey.currentState!.fields['year']!.value);
      final bool seen = formKey.currentState!.fields['seen']!.value;

      final Movie movie = Movie(
        id: Uuid().v1(),
        name: name,
        cover: cover,
        director: director,
        year: year,
        seen: seen,
      );

      try {
        await AppRepository().insertMovie(movie);

        final Stream<List<Movie>> watchedMovies = AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies = AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is UpdateMovie) {
      yield MoviesLoading();

      //Get Form info from GlobalKey
      final String name = formKey.currentState!.fields['name']!.value;
      final Uint8List cover =
          (formKey.currentState!.fields['cover']!.value).first.readAsBytesSync();
      final String director = formKey.currentState!.fields['director']!.value;
      final int year = int.parse(formKey.currentState!.fields['year']!.value);
      final bool seen = formKey.currentState!.fields['seen']!.value;

      final Movie movie = Movie(
        id: event.movieId,
        name: name,
        cover: cover,
        director: director,
        year: year,
        seen: seen,
      );

      try {
        AppRepository().updateMovie(movie);

        final Stream<List<Movie>> watchedMovies = AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies = AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is DeleteMovie) {
      yield MoviesLoading();

      try {
        AppRepository().deleteMovie(event.movieId);

        final Stream<List<Movie>> watchedMovies = AppRepository().watchAllWatchedMovies();
        final Stream<List<Movie>> unseenMovies = AppRepository().watchAllUnseenMovies();
        yield MoviesPopulated(watchedMovies, unseenMovies);
      } catch (e) {
        yield MoviesError();
      }
    } else if (event is EmptyMovies) {
      yield MoviesEmpty();
    }
  }
}
