import 'package:equatable/equatable.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();
}

class InsertMovie extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class GetMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}

class UpdateMovie extends MoviesEvent {
  UpdateMovie(this.movieId);

  final String movieId;

  @override
  List<Object> get props => [movieId];
}

class DeleteMovie extends MoviesEvent {
  DeleteMovie(this.movieId);

  final String movieId;

  @override
  List<Object> get props => [movieId];
}

class EmptyMovies extends MoviesEvent {
  @override
  List<Object> get props => [];
}
