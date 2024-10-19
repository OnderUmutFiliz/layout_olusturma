import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController(); // Arama kontrolü

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Firmalar"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Geri tuşu işlemi
            },
          ),
          backgroundColor: Color(0xFF1e199b), // AppBar rengi #1e199b
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: double.infinity, // Buton genişliği 
                  height: 50, // Yükseklik sabiti
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF1e199b), // Ana renk
                        Color(0xFF1e199b).withOpacity(0.6), // Soluk renk
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // Sağlık butonuna basılma işlemi
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, // Şeffaflık
                      textStyle: TextStyle(fontSize: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png', // Sağlık logosu
                          width: 24, // Logo genişliği
                        ),
                        SizedBox(width: 8), // Logo ile metin arasında boşluk
                        Expanded(
                          child: Text(
                            "Sağlık",
                            textAlign: TextAlign.center, // Metni ortala
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: _searchController, // Arama kontrolü
                decoration: InputDecoration(
                  hintText: "Firma Ara", 
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.search,
                        size: 28, 
                        color: Colors.black, 
                      ),
                      SizedBox(width: 8), 
                    ],
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text("İstediğiniz firmada indirim yakalama fırsatı..."),
              SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    buildFirmaCard("Firma Adı Uzun Firma Adı", "%10"),
                    buildFirmaCard("Firma Adı", "%10"),
                    buildFirmaCard("Firma Adı Uzun Firma Adı", "%10"),
                    buildFirmaCard("Firma Adı", "%10"),
                    buildFirmaCard("Firma Adı Uzun Firma Adı", "%10"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildFirmaCard(String firmaAdi, String indirim) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(Icons.business, size: 28), 
        title: Text(firmaAdi),
        trailing: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF1e199b), 
                Color(0xFF1e199b).withOpacity(0.6), 
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            indirim,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
