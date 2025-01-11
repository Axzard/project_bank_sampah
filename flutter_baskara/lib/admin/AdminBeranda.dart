import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/admin_data_sampah.dart';
import 'package:flutter_baskara/admin/admin_edit_data.dart';
import 'package:flutter_baskara/admin/admin_lihat_data.dart';
import 'package:flutter_baskara/admin/admin_profil.dart';

class DashboardAdmin extends StatelessWidget {
  const DashboardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            // Menambahkan garis hijau di bawah teks "BASKARA GREEN"
            Container(
              width: screenWidth *
                  0.6, // Lebar garis hijau menyesuaikan ukuran teks
              height: 5, // Ketebalan garis
              color: Colors.green, // Warna garis hijau
            ),
            const SizedBox(height: 5), // Jarak antara garis hijau dan teks
            const Text(
              'BASKARA GREEN',
              style: TextStyle(
                color: Colors.white, // Warna teks putih
                fontSize: 24, // Ukuran font
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green, // Warna background AppBar hijau
        elevation: 1.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Container(
          width: screenWidth * 0.9,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '"Selamat datang di Baskara Green"\nAplikasi Bank Sampah untuk lingkungan\nyang lebih bersih dan hijau...',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditDataScreen()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.edit, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Edit Data',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SampahPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.delete, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Setor Sampah',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardAdmin()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.home, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Beranda',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Informasi()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.info, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Informasi',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const AkunPage()),
                );
              },
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.account_circle, color: Colors.green, size: 24),
                  SizedBox(height: 5),
                  Text(
                    'Akun',
                    style: TextStyle(color: Colors.green, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
