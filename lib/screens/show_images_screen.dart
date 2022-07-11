// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:image_collage/image_collage.dart';
import 'package:productos_app/widgets/card_background.dart';

class ShowImageScreen extends StatelessWidget {
  static List<Img> listImh = [];

  const ShowImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'home');
          },
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(bottom: 10, left: 15),
        width: double.infinity,
        child: ListView.builder(
          itemCount: listImh.length,
          itemBuilder: (_, int index) => _CardImage(listImh[index].image),
        ),
      ),
    );
  }

  static void imagenes(List<Img> list) {
    listImh = list;
  }
}

class _CardImage extends StatelessWidget {
  String image;

  _CardImage(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      child: SizedBox(
          height: 250,
          width: 250,
          child: FadeInImage(
            image: NetworkImage(image),
            placeholder: const AssetImage('assets/loading.gif'),
            fit: BoxFit.cover,
          )),
    );
  }
}
