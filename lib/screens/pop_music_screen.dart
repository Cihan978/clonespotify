import 'package:flutter/material.dart';

class PopMusicScreen extends StatefulWidget {
  @override
  _PopMusicScreenState createState() => _PopMusicScreenState();
}

class _PopMusicScreenState extends State<PopMusicScreen> {
  final List<Map<String, String>> popSongs = [
    {'title': 'Blinding Lights', 'artist': 'The Weeknd'},
    {'title': 'Levitating', 'artist': 'Dua Lipa'},
    {'title': 'Watermelon Sugar', 'artist': 'Harry Styles'},
    {'title': 'Don’t Start Now', 'artist': 'Dua Lipa'},
    {'title': 'Shape of You', 'artist': 'Ed Sheeran'},
  ];

  final List<Map<String, String>> newSongs = [
    {'title': 'As It Was', 'artist': 'Harry Styles'},
    {'title': 'Stay', 'artist': 'The Kid LAROI & Justin Bieber'},
    {'title': 'Peaches', 'artist': 'Justin Bieber'},
    {'title': 'Save Your Tears', 'artist': 'The Weeknd'},
  ];

  final List<Map<String, String>> turkishSongs = [
    {'title': 'Bi Tek Ben Anlarım', 'artist': 'KÖFN'},
    {'title': 'Yana Yana', 'artist': 'Semicenk'},
    {'title': 'Aşkın Olayım', 'artist': 'Simge'},
  ];

  int _currentSongIndex = -1;
  bool _isNewSong = false;
  bool _isPlaying = false;

  void _shareContent() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(20),
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Paylaş", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.share, color: Colors.white),
                title: Text("Mesaj ile paylaş", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.link, color: Colors.white),
                title: Text("Bağlantıyı kopyala", style: TextStyle(color: Colors.white)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _playSong(int index, {bool isNew = false}) {
    setState(() {
      _currentSongIndex = index;
      _isNewSong = isNew;
      _isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Pop Müzik', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: _shareContent,
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: [
                SizedBox(height: 20),
                Text('Popüler Şarkılar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 10),
                _buildSongList(popSongs, false),
                SizedBox(height: 20),
                Text('Özenle Seçtiğimiz Yeni Şarkılar', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 10),
                _buildSongList(newSongs, true),
                SizedBox(height: 20),
                Text('Editörlerimizden Çalma Listeleri', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                SizedBox(height: 10),
                _buildSongList(turkishSongs, false),
                if (_currentSongIndex != -1) _buildMusicPlayer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSongList(List<Map<String, String>> songs, bool isNew) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => _playSong(index, isNew: isNew),
            child: Container(
              width: 120,
              margin: EdgeInsets.symmetric(horizontal: 6),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _currentSongIndex == index && _isNewSong == isNew ? Colors.grey[800] : Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(songs[index]['title']!, style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(songs[index]['artist']!, style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMusicPlayer() {
    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _isNewSong ? newSongs[_currentSongIndex]['title']! : popSongs[_currentSongIndex]['title']!,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(
              _isPlaying ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
          ),
        ],
      ),
    );
  }
}
