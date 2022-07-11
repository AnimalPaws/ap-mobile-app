import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_collage/image_collage.dart';

class AnnouncementService extends ChangeNotifier {
  final String _baseUrl = 'ap-api-server.azurewebsites.net';

  List<dynamic> announcements = [];

  AnnouncementService() {
    getOnDisplayAnnouncement();
  }

  getOnDisplayAnnouncement() async {
    String aux = '';
    List<Img> img = [];

    final url = Uri.https(_baseUrl, '/Announcement');
    final response = await http.get(url);

    announcements = json.decode(response.body);

    for (int i = 0; i < announcements.length; i++) {
      aux = announcements[i]['image'];
      announcements[i]['image'] = aux.split(',' ' ');
    }

    for (int i = 0; i < announcements.length; i++) {
      List<String> aux1 = announcements[i]['image'];
      for (int j = 0; j < aux1.length; j++) {
        img.add(Img(image: aux1[j]));
      }
      announcements[i]['image'] = List<Img>.from(img);
      img.clear();
    }

    notifyListeners();
  }
}
