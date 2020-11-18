import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:movies_list_bloc/bloc/bloc.dart';
import 'package:movies_list_bloc/main.dart';
import 'package:movies_list_bloc/model/database/app_database.dart';
import 'package:movies_list_bloc/shared/constants.dart';
import 'package:movies_list_bloc/shared/routes.dart';
import 'package:movies_list_bloc/shared/widgets/loading_gif.dart';
import 'package:movies_list_bloc/views/home_view.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sailor/sailor.dart';

class AddAndEditMovieView extends StatefulWidget {
  static const String id = 'AddAndEditMovieView';

  AddAndEditMovieView(this.movie, this.isNewMovie);

  final Movie movie;
  final bool isNewMovie;

  @override
  _AddAndEditMovieViewState createState() => _AddAndEditMovieViewState();
}

class _AddAndEditMovieViewState extends State<AddAndEditMovieView> {
  FocusNode _firstFocusNode;
  FocusNode _secondFocusNode;
  FocusNode _thirdFocusNode;

  MaskedTextController _yearController;

  List<FocusNode> _focusList;

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
      file.writeAsBytesSync(widget.movie.cover);
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
        MaskedTextController(mask: '0000', text: widget?.movie?.year?.toString() ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => Routes.sailor.navigate(
        HomeView.id,
        navigationType: NavigationType.pushReplace,
      ),
      child: Scaffold(
        backgroundColor: kDark1,
        appBar: AppBar(
          title: Text('Adicionar Filme'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Routes.sailor.navigate(
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
                    'cover': widget?.movie?.cover != null ? [data.data] : [],
                    'name': widget?.movie?.name ?? '',
                    'director': widget?.movie?.director ?? '',
                    'watched': widget?.movie?.watched ?? false,
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        FormBuilderImagePicker(
                          attribute: 'cover',
                          decoration: InputDecoration(
                            labelText: 'Imagem de capa',
                            labelStyle: TextStyle(color: kWhite),
                            border: InputBorder.none,
                          ),
                          defaultImage: AssetImage('assets/images/placeholder.png'),
                          maxImages: 1,
                          maxWidth: 640,
                          iconColor: kWhite,
                          cameraLabel: Text('Câmera'),
                          galleryLabel: Text('Galeria'),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigarório'),
                          ],
                        ),
                        FormBuilderTextField(
                          attribute: 'name',
                          decoration: InputDecoration(
                            hintText: 'Título',
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
                          onFieldSubmitted: (value) => _onContinuePressed(),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigarório'),
                            FormBuilderValidators.maxLength(30,
                                errorText: 'Máximo de 30 caracteres'),
                          ],
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderTextField(
                          attribute: 'director',
                          decoration: InputDecoration(
                            hintText: 'Diretor',
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
                          onFieldSubmitted: (value) => _onContinuePressed(),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigarório'),
                            FormBuilderValidators.maxLength(30,
                                errorText: 'Máximo de 30 caracteres'),
                          ],
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderTextField(
                          attribute: 'year',
                          decoration: InputDecoration(
                            hintText: 'Ano',
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
                          onFieldSubmitted: (value) => _onContinuePressed(),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: 'Campo obrigarório'),
                            FormBuilderValidators.min(1900,
                                errorText: 'Ano mínimo: 1900'),
                            FormBuilderValidators.max(2100,
                                errorText: 'Ano máximo: 2100'),
                          ],
                        ),
                        SizedBox(height: 24.0),
                        FormBuilderCheckbox(
                          checkColor: kDark1,
                          attribute: 'watched',
                          focusColor: kWhite,
                          activeColor: kWhite,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            fillColor: kWhite,
                          ),
                          label: Text(
                            'Filme já assistido?',
                            style: TextStyle(color: kWhite, fontSize: 16.0),
                          ),
                        ),
                        RaisedButton(
                          color: kDark3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Inserir Filme'.toUpperCase(),
                              style: TextStyle(color: kWhite),
                            ),
                          ),
                          onPressed: () {
                            final form = formKey.currentState;
                            if (form.saveAndValidate()) {
                              if (widget.isNewMovie) {
                                BlocProvider.of<MoviesBloc>(context).add(InsertMovie());
                              } else if (!widget.isNewMovie) {
                                BlocProvider.of<MoviesBloc>(context)
                                    .add(UpdateMovie(widget.movie.id));
                              }
                              Routes.sailor.navigate(
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
