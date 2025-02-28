import 'package:flutter/material.dart';

class LibraryScreen extends StatefulWidget {
  @override
  _LibraryScreenState createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  TextEditingController _searchController = TextEditingController();
  bool _showPlaylists = true;
  bool _isGridView = false;
  bool _isPlaying = false;
  String? _currentPlaying;

  List<Map<String, dynamic>> playlists = [
    {'title': 'Beğenilen Şarkılar', 'subtitle': 'Çalma Listesi'},
    {'title': 'Yeni', 'subtitle': 'Çalma Listesi • Cihan'},
    {'title': 'Yağmurum ol 💕', 'subtitle': 'Çalma Listesi • Cihan'},
    {'title': 'Rock', 'subtitle': 'Çalma Listesi • Cihan'},
    {'title': 'Karışık', 'subtitle': 'Çalma Listesi • Cihan'},
  ];

  List<Map<String, dynamic>> albums = [
    {'title': 'Aman Güzel', 'subtitle': 'Yavaş Yürü • Halodayı'},
  ];

  void _addPlaylist() {
    setState(() {
      playlists.add({'title': 'Yeni Çalma Listesi', 'subtitle': 'Çalma Listesi • Sen'});
    });
  }

  void _playSong(String title) {
    setState(() {
      _currentPlaying = title;
      _isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: TextField(
          controller: _searchController,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: 'Kitaplığında Ara...',
            hintStyle: TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.grid_view, color: Colors.white),
            onPressed: () {
              setState(() {
                _isGridView = !_isGridView;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.add, color: Colors.white),
            onPressed: _addPlaylist,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildToggleButton('Çalma listeleri', true),
              SizedBox(width: 10),
              _buildToggleButton('Albümler', false),
            ],
          ),
          SizedBox(height: 20),
          Text(
            'Son çalınanlar',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: _isGridView ? _buildGridView() : _buildListView(),
          ),
          if (_isPlaying) _buildMusicPlayer(),
        ],
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isPlaylists) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _showPlaylists == isPlaylists ? Colors.green : Colors.grey[800],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        setState(() {
          _showPlaylists = isPlaylists;
        });
      },
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: _showPlaylists ? playlists.length : albums.length,
      itemBuilder: (context, index) {
        var item = _showPlaylists ? playlists[index] : albums[index];
        return _buildItem(context, item['title']!, item['subtitle']!);
      },
    );
  }

  Widget _buildGridView() {
    var items = _showPlaylists ? playlists : albums;
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        var item = items[index];
        return _buildItem(context, item['title']!, item['subtitle']!);
      },
    );
  }

  Widget _buildItem(BuildContext context, String title, String subtitle) {
    return ListTile(
      onTap: () => _playSong(title),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey),
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
            _currentPlaying ?? '',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          IconButton(
            icon: Icon(Icons.pause, color: Colors.white),
            onPressed: () {
              setState(() {
                _isPlaying = false;
              });
            },
          ),
        ],
      ),
    );
  }
}