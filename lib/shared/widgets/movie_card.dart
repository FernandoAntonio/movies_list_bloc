import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_list_bloc/bloc/bloc.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/shared/constants.dart';
import 'package:movies_list_bloc/shared/routes.dart';
import 'package:movies_list_bloc/views/add_and_edit_movie_view.dart';
import 'package:sailor/sailor.dart';

class MovieCard extends StatelessWidget {
  MovieCard(this.movie);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kDark2,
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140.0,
            width: 90.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: MemoryImage(
                  movie.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, bottom: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: kYellow,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    movie.director,
                    textAlign: TextAlign.start,
                    style: TextStyle(color: kGreyDark),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    movie.year.toString(),
                    textAlign: TextAlign.start,
                    style: TextStyle(color: kGreyDark),
                  ),
                  SizedBox(height: 4.0),
                  Row(
                    children: [
                      Text(
                        movie.watched ? 'Assistido' : 'Não Assistido',
                        textAlign: TextAlign.start,
                        style: TextStyle(color: kGreyDark),
                      ),
                      SizedBox(width: 4.0),
                      Icon(
                        movie.watched
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                        color: kGreyDark,
                        size: 14.0,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          PopupMenuButton(
            color: kDark3,
            onSelected: (value) => _onSelected(context, value),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0, top: 16.0),
              child: Icon(
                Icons.more_vert,
                color: kGreyDark,
              ),
            ),
            itemBuilder: (BuildContext context) {
              return ['Editar', 'Excluir'].map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                  textStyle: TextStyle(color: kWhite),
                );
              }).toList();
            },
          )
        ],
      ),
    );
  }

  _onSelected(BuildContext context, String value) {
    switch (value) {
      case 'Editar':
        Routes.sailor.navigate(
          AddAndEditMovieView.id,
          navigationType: NavigationType.pushReplace,
          params: {'movie': movie, 'isNewMovie': false},
        );
        break;
      case 'Excluir':
        BlocProvider.of<MoviesBloc>(context).add(DeleteMovie(movie.id));
        break;
    }
  }
}
