import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {

  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        decoration: _createCardShape(context),
        child: child,
      ),
    );
  }

  BoxDecoration _createCardShape(BuildContext context) => BoxDecoration(
    color: Theme.of(context).canvasColor,
    borderRadius: BorderRadius.circular(25),
    boxShadow: const [
      BoxShadow (
        color: Colors.black12,
        blurRadius: 15,
        offset: Offset(0,5)
      )
    ]
  );

}