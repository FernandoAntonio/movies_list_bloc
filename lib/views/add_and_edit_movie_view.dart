import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:movies_list_bloc/bloc/bloc.dart';
import 'package:movies_list_bloc/main.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/shared/constants.dart';
import 'package:movies_list_bloc/shared/routes.dart';
import 'package:movies_list_bloc/shared/widgets/loading_gif.dart';
import 'package:movies_list_bloc/views/home_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:seafarer/seafarer.dart';

class AddAndEditMovieView extends StatefulWidget {
  static const String id = 'AddAndEditMovieView';

  AddAndEditMovieView(this.movie, this.isNewMovie);

  final Movie? movie;
  final bool isNewMovie;

  @override
  _AddAndEditMovieViewState createState() => _AddAndEditMovieViewState();
}

class _AddAndEditMovieViewState extends State<AddAndEditMovieView> {
  late FocusNode _firstFocusNode;
  late FocusNode _secondFocusNode;
  late FocusNode _thirdFocusNode;

  late MaskedTextController _yearController;

  late List<FocusNode> _focusList;

  _onContinuePressed() {
    if (_focusList.last.hasFocus) {
      _focusList.last.unfocus();
    } else {
      for (int i = 0; i < _focusList.length; i++) {
        if (_focusList[i].hasFocus) {
          _focusList[i + 1].requestFocus();
        }
      }
    }
  }

  Future<File> _getImageFromBytes() async {
    if (widget.isNewMovie) {
      return File('assets/images/placeholder.png');
    } else {
      final tempDir = await getTemporaryDirectory();
      var file =
          await File('${tempDir.path}/image${DateTime.now().millisecondsSinceEpoch}.jpg')
              .create();
      file.writeAsBytesSync(widget.movie!.cover);
      return file;
    }
  }

  @override
  void initState() {
    super.initState();

    _focusList = [
      _firstFocusNode = FocusNode(),
      _secondFocusNode = FocusNode(),
      _thirdFocusNode = FocusNode(),
    ];

    _yearController =
        MaskedTextController(mask: '0000', text: widget.movie?.year.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Routes.seafarer.navigate(
        HomeView.id,
        navigationType: NavigationType.pushReplace,
      ),
      child: Scaffold(
        backgroundColor: kDark1,
        appBar: AppBar(
          title: Text(widget.isNewMovie ? 'Add Movie' : 'Edit Movie'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Routes.seafarer.navigate(
              HomeView.id,
              navigationType: NavigationType.pushReplace,
            ),
          ),
        ),
        body: FutureBuilder<File>(
          future: _getImageFromBytes(),
          builder: (context, data) {
            if (data.hasData) {
              return SingleChildScrollView(
                child: FormBuilder(
                  key: formKey,
                  initialValue: {
                    'cover': widget.movie?.cover != null ? [data.data] : [],
                    'name': widget.movie?.name ?? '',
                    'director': widget.movie?.director ?? '',
                    'seen': widget.movie?.seen ?? false,
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormBuilderImagePicker(
                          name: 'cover',
                          decoration: InputDecoration(
                            labelText: 'Cover Image',
                            labelStyle: TextStyle(color: kWhite),
                            border: InputBorder.none,
                          ),
                          placeholderImage: AssetImage('assets/images/placeholder.png'),
                          maxImages: 1,
                          maxWidth: 640,
                          iconColor: kWhite,
                          validator: FormBuilderValidators.required(context),
                        ),
                        FormBuilderTextField(
                          name: 'name',
                          decoration: InputDecoration(
                            hintText: 'Title',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                          ),
                          style: TextStyle(color: kWhite),
                          focusNode: _firstFocusNode,
                          onSubmitted: (value) => _onContinuePressed(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.maxLength(context, 70,
                                errorText: 'Maximum of 70 characters'),
                          ]),
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderTextField(
                          name: 'director',
                          decoration: InputDecoration(
                            hintText: 'Director',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                          ),
                          style: TextStyle(color: kWhite),
                          focusNode: _secondFocusNode,
                          onSubmitted: (value) => _onContinuePressed(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.maxLength(context, 70,
                                errorText: 'Maximum of 70 characters'),
                          ]),
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderTextField(
                          name: 'year',
                          decoration: InputDecoration(
                            hintText: 'Year',
                            hintStyle: TextStyle(color: Colors.grey),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: kWhite),
                            ),
                          ),
                          style: TextStyle(color: kWhite),
                          controller: _yearController,
                          focusNode: _thirdFocusNode,
                          keyboardType: TextInputType.number,
                          onSubmitted: (value) => _onContinuePressed(),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.min(context, 1900,
                                errorText: 'Minimun year: 1900'),
                            FormBuilderValidators.max(context, 2100,
                                errorText: 'Maximum year: 2100'),
                          ]),
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderCheckbox(
                          checkColor: kDark1,
                          name: 'seen',
                          activeColor: kWhite,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: kWhite,
                          ),
                          title: Text(
                            'Seen?',
                            style: TextStyle(color: kWhite, fontSize: 16.0),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: kDark3),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Add Movie'.toUpperCase(),
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                          onPressed: () {
                            final form = formKey.currentState;
                            if (form!.saveAndValidate()) {
                              if (widget.isNewMovie) {
                                BlocProvider.of<MoviesBloc>(context).add(InsertMovie());
                              } else if (!widget.isNewMovie) {
                                BlocProvider.of<MoviesBloc>(context)
                                    .add(UpdateMovie(widget.movie!.id));
                              }
                              Routes.seafarer.navigate(
                                HomeView.id,
                                navigationType: NavigationType.pushReplace,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else
              return LoadingGif();
          },
        ),
      ),
    );
  }
}
