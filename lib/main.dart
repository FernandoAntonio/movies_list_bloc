import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:movies_list_bloc/bloc/bloc.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/shared/constants.dart';
import 'package:movies_list_bloc/shared/routes.dart';
import 'package:movies_list_bloc/views/home_view.dart';

late AppDatabase database;

final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

void main() {
  Routes.createRoutes();
  database = AppDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MoviesBloc>(
          create: (_) => MoviesBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: kDark1,
          unselectedWidgetColor: kWhite,
          highlightColor: kWhite,
          indicatorColor: kWhite,
          dividerColor: kWhite,
          colorScheme:
              ColorScheme.fromSwatch().copyWith(primary: kDark1, secondary: kWhite),
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: kWhite,
            selectionColor: kWhite,
            selectionHandleColor: kWhite,
          ),
        ),
        initialRoute: HomeView.id,
        navigatorKey: Routes.seafarer.navigatorKey,
        onGenerateRoute: Routes.seafarer.generator(),
      ),
    );
  }
}
