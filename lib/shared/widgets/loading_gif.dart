import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class LoadingGif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Container(
          height: 150.0,
          width: 150.0,
          child: FlareActor(
            'assets/flare/loading_circle.flr',
            animation: 'loading',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            isPaused: false,
          ),
        ),
      ),
    );
  }
}
