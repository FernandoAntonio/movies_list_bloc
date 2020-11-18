import 'package:flutter/material.dart';
import 'package:movies_list_bloc/shared/constants.dart';

class MyBottomNavigatorBar extends StatefulWidget {
  MyBottomNavigatorBar({
    @required this.pageController,
    @required this.currentPage,
  });

  final PageController pageController;
  final double currentPage;
  @override
  _MyBottomNavigatorBarState createState() => _MyBottomNavigatorBarState();
}

class _MyBottomNavigatorBarState extends State<MyBottomNavigatorBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      clipBehavior: Clip.antiAlias,
      child: Container(
        height: 70.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            InkWell(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(
                    0,
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 300),
                  );
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                color: widget.currentPage < 0.5 ? kDark3 : kDark1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/movie.png',
                      height: 20.0,
                      color: kWhite,
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Vistos'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  widget.pageController.animateToPage(
                    1,
                    curve: Curves.ease,
                    duration: Duration(milliseconds: 300),
                  );
                });
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                color: widget.currentPage > 0.5 ? kDark3 : kDark1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/movie-off.png',
                      height: 20.0,
                      color: kWhite,
                    ),
                    SizedBox(height: 3.0),
                    Text(
                      'Não Vistos'.toUpperCase(),
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kWhite, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
