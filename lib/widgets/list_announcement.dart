import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/card_background.dart';

class ListAnnouncement extends StatelessWidget {
  final List<dynamic> listAnnouncement;

  const ListAnnouncement({Key? key, required this.listAnnouncement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (listAnnouncement.isEmpty) {
      // ignore: sized_box_for_whitespace
      return Container(
          width: double.infinity,
          height: size.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ));
    }

    return Container(
      padding: const EdgeInsets.only(top: 40),
      child: ListView.builder(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          itemCount: listAnnouncement.length,
          itemBuilder: (context, index) => _SigleCard(
                // icon: Icons.person,
                color: Theme.of(context).backgroundColor,
                id: listAnnouncement[index]['id'],
                title: listAnnouncement[index]['title'],
                description: listAnnouncement[index]['description'],
                image: listAnnouncement[index]['image'],
                likes: listAnnouncement[index]['likes'],
              )),
    );
  }
}

class _SigleCard extends StatelessWidget {
  // final String? icon;
  final Color color;
  final int id;
  final String title;
  final String description;
  final List<Img> image;
  final int likes;

  const _SigleCard({
    Key? key,
    // this.icon,
    required this.color,
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return CardBackground(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: color,
                child: const CircleAvatar(
                  maxRadius: 50,
                  // backgroundImage: ,
                ),
                radius: 25,
              ),
              const SizedBox(width: 25),
              Text(
                title,
                textAlign: TextAlign.center,
                  style: textTheme.headline5,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 15),
        ),
        const SizedBox(height: 10),
        Container(
          color: Colors.white,
          child: ImageCollage(
              images: image,
              widthSize: 225,
              onClick: (clickedImage, image) {
                inspect(clickedImage);
                inspect(image);
                ShowImageScreen.imagenes(image);
                Navigator.pushReplacementNamed(context, 'show_image');
              }),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            children: [
              const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Text('$likes')
            ],
          ),
        )
      ],
    ));
  }
}
