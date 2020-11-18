import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class EmptyListGif extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 70),
        child: Container(
          height: 200.0,
          width: 200.0,
          child: FlareActor(
            'assets/flare/empty_list.flr',
            animation: 'idle',
            alignment: Alignment.center,
            fit: BoxFit.contain,
            isPaused: false,
          ),
        ),
      ),
    );
  }
}
