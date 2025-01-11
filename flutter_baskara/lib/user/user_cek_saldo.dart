import 'package:flutter/material.dart';

class CekSaldoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mendapatkan ukuran layar untuk menyesuaikan tampilan
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Warna hijau untuk AppBar
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali ke halaman sebelumnya
          },
        ),
        title: Text(
          'Cek Saldo',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            width: screenSize.width < 600
                ? screenSize.width * 0.8
                : 400, // Responsif: lebar kotak
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.green, // Warna latar hijau
              borderRadius: BorderRadius.circular(12), // Sudut membulat
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Tinggi menyesuaikan konten
              crossAxisAlignment: CrossAxisAlignment.start, // Teks rata kiri
              children: [
                Text(
                  'Saldo Anda',
                  style: TextStyle(
                    fontSize: screenSize.width < 600
                        ? 18
                        : 20, // Ukuran teks responsif
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // Jarak antara teks
                Text(
                  'Rp 20.000',
                  style: TextStyle(
                    fontSize: screenSize.width < 600
                        ? 24
                        : 28, // Ukuran teks responsif
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8), // Jarak antara teks
                Text(
                  'Jaenudin Zaelani',
                  style: TextStyle(
                    fontSize: screenSize.width < 600
                        ? 16
                        : 18, // Ukuran teks responsif
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
