import 'package:flutter/material.dart';

class MusicDetailScreen extends StatelessWidget {
  final Map<String, String> music;

  MusicDetailScreen({required this.music});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(music['title']!),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(music['image']!, width: 150, height: 150),
            SizedBox(height: 20),
            Text(music['title']!, style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text(music['artist']!, style: TextStyle(color: Colors.grey, fontSize: 18)),
            SizedBox(height: 30),
            IconButton(
              icon: Icon(Icons.play_circle_fill, color: Colors.green, size: 60),
              onPressed: () {
                // Şarkıyı çalmak için bir oynatıcı ekleyebilirsin.
              },
            ),
          ],
        ),
      ),
    );
  }
}
