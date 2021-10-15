import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_list_bloc/bloc/bloc.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/shared/constants.dart';
import 'package:movies_list_bloc/shared/routes.dart';
import 'package:movies_list_bloc/shared/widgets/empty_list_gif.dart';
import 'package:movies_list_bloc/shared/widgets/loading_gif.dart';
import 'package:movies_list_bloc/shared/widgets/movie_card.dart';
import 'package:movies_list_bloc/shared/widgets/my_bottom_navigation_bar.dart';
import 'package:movies_list_bloc/views/add_and_edit_movie_view.dart';

class HomeView extends StatefulWidget {
  static const String id = 'HomeView';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late PageController _pageController;
  late double _currentPage;

  @override
  void initState() {
    super.initState();

    BlocProvider.of<MoviesBloc>(context).add(GetMovies());

    _pageController = PageController(initialPage: 0);
    _currentPage = 0;
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kDark1,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('My Movies List'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: kDark3,
        child: Icon(Icons.add, color: kWhite),
        onPressed: () => Routes.seafarer.navigate(
          AddAndEditMovieView.id,
          params: {'isNewMovie': true},
        ),
      ),
      bottomNavigationBar: MyBottomNavigatorBar(
        currentPage: _currentPage,
        pageController: _pageController,
      ),
      body: _buildHomeBloc(context),
    );
  }

  _buildHomeBloc(BuildContext context) {
    return BlocConsumer<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesEmpty || state is MoviesLoading) {
          return _buildMoviesLoading(context);
        } else if (state is MoviesPopulated) {
          return _buildMoviesPopulated(context, state.seenMovies, state.unseenMovies);
        } else
          return _buildMoviesLoading(context);
      },
      listener: (context, state) {},
    );
  }

  _buildMoviesLoading(BuildContext context) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _pageController.animateToPage(
            index,
            curve: Curves.ease,
            duration: Duration(milliseconds: 300),
          );
        });
      },
      children: [
        LoadingGif(),
        LoadingGif(),
      ],
    );
  }

  _buildMoviesPopulated(BuildContext context, Stream<List<Movie>> watchedMovies,
      Stream<List<Movie>> unseenMovies) {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        setState(() {
          _pageController.animateToPage(
            index,
            curve: Curves.ease,
            duration: Duration(milliseconds: 300),
          );
        });
      },
      children: [
        _buildBodyWatched(context, watchedMovies),
        _buildBodyUnseen(context, unseenMovies),
      ],
    );
  }

  _buildBodyWatched(BuildContext context, Stream<List<Movie>> watchedMovies) {
    return StreamBuilder<List<Movie>>(
      stream: watchedMovies,
      builder: (context, data) {
        if (data.data != null && data.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, index) => MovieCard(data.data!.elementAt(index)),
          );
        } else
          return EmptyListGif();
      },
    );
  }

  _buildBodyUnseen(BuildContext context, Stream<List<Movie>> unseenMovies) {
    return StreamBuilder<List<Movie>>(
      stream: unseenMovies,
      builder: (context, data) {
        if (data.data != null && data.data!.isNotEmpty) {
          return ListView.builder(
            itemCount: data.data!.length,
            itemBuilder: (context, index) => MovieCard(data.data!.elementAt(index)),
          );
        } else
          return EmptyListGif();
      },
    );
  }
}
