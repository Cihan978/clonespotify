import 'package:flutter/material.dart';

class PremiumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'Premium',
          style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildPremiumPlan('Bireysel', '1 Premium hesabı', ['İstediğin zaman iptal et'], Colors.pinkAccent),
            _buildPremiumPlan('Öğrenci', '1 Premium hesabı', ['Öğrenci indirimi', 'İstediğin zaman iptal et'], Colors.blueAccent),
            _buildPremiumPlan('Duo', '2 Premium hesap', ['İstediğin zaman iptal et'], Colors.amberAccent),
            _buildPremiumPlan('Aile', '6 Premium hesabı', ['Sansürsüz içerik kontrolü', 'İstediğin zaman iptal et'], Colors.lightBlue),
            SizedBox(height: 20),
            Text(
              'Neden Premiuma katılmalısın?',
              style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildFeatureItem(Icons.music_note, 'Reklamsız Müzik Dinle'),
            _buildFeatureItem(Icons.download, 'İndir ve Çevrimdışı Dinle'),
            _buildFeatureItem(Icons.shuffle, 'Şarkıları İstediğin Sırada Çal'),
            _buildFeatureItem(Icons.headphones, 'Yüksek Ses Kalitesi'),
            _buildFeatureItem(Icons.group, 'Arkadaşlarınla Aynı Anda Dinle'),
            _buildFeatureItem(Icons.playlist_play, 'Dinleme Sırasını Düzenle'),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumPlan(String title, String subtitle, List<String> features, Color color) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.workspace_premium, color: Colors.white),
              SizedBox(width: 8),
              Text(
                'Premium',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: color, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          SizedBox(height: 8),
          ...features.map((feature) => Text('• $feature', style: TextStyle(color: Colors.white))),
          SizedBox(height: 8),
          Text(
            'Uygulama içinden Premiuma geçemezsin. İdeal bir durum olmadığının farkındayız.',
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
          SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              child: Text(
                'Satın Al',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
