import 'package:equatable/equatable.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';

abstract class MoviesState extends Equatable {
  const MoviesState();
}

class MoviesEmpty extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesLoading extends MoviesState {
  @override
  List<Object> get props => [];
}

class MoviesPopulated extends MoviesState {
  MoviesPopulated(this.seenMovies, this.unseenMovies);

  final Stream<List<Movie>> seenMovies;
  final Stream<List<Movie>> unseenMovies;

  @override
  List<Object> get props => [seenMovies, unseenMovies];
}

class MoviesError extends MoviesState {
  @override
  List<Object> get props => [];
}
