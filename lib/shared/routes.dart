import 'package:flutter/material.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/views/add_and_edit_movie_view.dart';
import 'package:movies_list_bloc/views/home_view.dart';
import 'package:seafarer/seafarer.dart';

class Routes {
  static final seafarer = Seafarer(
    options: SeafarerOptions(
      defaultTransitions: [
        SeafarerTransition.fade_in,
      ],
      defaultTransitionCurve: Curves.decelerate,
      defaultTransitionDuration: Duration(milliseconds: 500),
    ),
  );

  static void createRoutes() {
    seafarer.addRoutes(
      <SeafarerRoute>[
        SeafarerRoute(
          name: HomeView.id,
          builder: (context, args, params) => HomeView(),
        ),
        SeafarerRoute(
          name: AddAndEditMovieView.id,
          builder: (context, args, params) => AddAndEditMovieView(
              params.param<Movie>('movie'), params.param<bool>('isNewMovie')!),
          params: [
            SeafarerParam<Movie>(name: 'movie'),
            SeafarerParam<bool>(name: 'isNewMovie'),
          ],
        ),
      ],
    );
  }
}
