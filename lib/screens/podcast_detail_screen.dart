import 'package:flutter/material.dart';

class PodcastDetailScreen extends StatelessWidget {
  final Map<String, String> podcast;

  PodcastDetailScreen({required this.podcast});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(podcast['title']!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(podcast['image']!, width: 150, height: 150),
            SizedBox(height: 20),
            Text(podcast['title']!, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text(podcast['host']!, style: TextStyle(color: Colors.grey, fontSize: 18)),
            SizedBox(height: 30),
            IconButton(
              icon: Icon(Icons.play_circle_fill, color: Colors.green, size: 60),
              onPressed: () {
                // Podcast oynatma mantığını buraya ekleyebilirsin.
              },
            ),
          ],
        ),
      ),
    );
  }
}
