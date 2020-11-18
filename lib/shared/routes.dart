import 'package:flutter/material.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/views/add_and_edit_movie_view.dart';
import 'package:movies_list_bloc/views/home_view.dart';
import 'package:sailor/sailor.dart';

class Routes {
  static final sailor = Sailor(
    options: SailorOptions(
      defaultTransitions: [
        SailorTransition.fade_in,
      ],
      defaultTransitionCurve: Curves.decelerate,
      defaultTransitionDuration: Duration(milliseconds: 500),
    ),
  );

  static void createRoutes() {
    sailor.addRoutes(
      <SailorRoute>[
        SailorRoute(
          name: HomeView.id,
          builder: (context, args, params) => HomeView(),
        ),
        SailorRoute(
          name: AddAndEditMovieView.id,
          builder: (context, args, params) => AddAndEditMovieView(
              params.param<Movie>('movie'), params.param<bool>('isNewMovie')),
          params: [
            SailorParam<Movie>(name: 'movie'),
            SailorParam<bool>(name: 'isNewMovie'),
          ],
        ),
      ],
    );
  }
}
