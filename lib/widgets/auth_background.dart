import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  
  final Widget child;

  const AuthBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          const  _PurpleBox(),
          //Separador con el noch
          const _HeaderIcon(),

          child,

        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  const _HeaderIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Icon(
          Icons.person_pin, 
          color: Theme.of(context).canvasColor, 
          size: 100
        ),
      ),
    );
  }
}

class _PurpleBox extends StatelessWidget {
  const _PurpleBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      child: Stack(
        children: const [
          Positioned(
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          Positioned(
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            child: _Bubble(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            child: _Bubble(),
            bottom: 120,
            right: 20,
          )
        ],
      )
    );
  }

  BoxDecoration _purpleBackground() => const BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(0, 77, 135, 1),
        Color.fromRGBO(0, 95, 167, 1)
      ]
    )
  );
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
          color: const Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );
  }
}