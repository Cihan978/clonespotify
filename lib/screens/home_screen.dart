import 'package:flutter/material.dart';
import 'music_detail_screen.dart';
import 'podcast_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedCategory = 'Tümü';

  final List<Map<String, String>> musicList = [
    {
      'title': 'Kurtar Burdan',
      'artist': 'Agoni, Desir',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=M',
    },
    {
      'title': 'ZOR',
      'artist': 'UZI',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=M',
    },
    {
      'title': 'YAKALARSAN',
      'artist': 'cakal',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=M',
    },
  ];

  final List<Map<String, String>> podcastList = [
    {
      'title': 'Bilim ve Gelecek',
      'host': 'Ahmet Yılmaz',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=P',
    },
    {
      'title': 'Tarih Konuşmaları',
      'host': 'Mehmet Demir',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=P',
    },
    {
      'title': 'Teknoloji Sohbetleri',
      'host': 'Elif Kaya',
      'image': 'https://via.placeholder.com/50/000000/FFFFFF?text=P',
    },
  ];


  @override
  Widget build(BuildContext context) {
    List<Widget> getItems() {
      if (_selectedCategory == 'Tümü') {
        return [
          ...musicList.map((music) => _buildMusicTile(context, music)).toList(),
          ...podcastList.map((podcast) => _buildPodcastTile(context, podcast)).toList(),
        ];
      } else if (_selectedCategory == 'Müzik') {
        return musicList.map((music) => _buildMusicTile(context, music)).toList();
      } else {
        return podcastList.map((podcast) => _buildPodcastTile(context, podcast)).toList();
      }
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Ana Sayfa',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _buildCategoryChip('Tümü'),
                SizedBox(width: 10),
                _buildCategoryChip('Müzik'),
                SizedBox(width: 10),
                _buildCategoryChip("Podcast'ler"),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Son Dinlediklerin',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: getItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category) {
    return ChoiceChip(
      label: Text(category, style: TextStyle(color: Colors.white)),
      selected: _selectedCategory == category,
      onSelected: (selected) {
        setState(() {
          _selectedCategory = category;
        });
      },
      selectedColor: Colors.green,
      backgroundColor: Colors.grey[800],
    );
  }

  Widget _buildMusicTile(BuildContext context, Map<String, String> music) {
    return ListTile(
      title: Text(music['title']!, style: TextStyle(color: Colors.white)),
      subtitle: Text(music['artist']!, style: TextStyle(color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MusicDetailScreen(music: music),
          ),
        );
      },
    );
  }

  Widget _buildPodcastTile(BuildContext context, Map<String, String> podcast) {
    return ListTile(
      title: Text(podcast['title']!, style: TextStyle(color: Colors.white)),
      subtitle: Text(podcast['host']!, style: TextStyle(color: Colors.grey)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PodcastDetailScreen(podcast: podcast),
          ),
        );
      },
    );
  }
}