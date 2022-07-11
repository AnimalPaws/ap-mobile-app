import 'dart:ui';

import 'package:flutter/material.dart';

class CardBackground extends StatelessWidget {
  final Widget child;

  const CardBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 390,
            decoration: BoxDecoration(
              //TODO: Cambiar
              borderRadius: BorderRadius.circular(15),
              color: Theme.of(context).splashColor,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
