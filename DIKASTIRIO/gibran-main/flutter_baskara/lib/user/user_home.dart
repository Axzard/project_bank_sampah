import 'package:flutter/material.dart';
import 'package:flutter_baskara/user/user_setor_sampah.dart';
import 'package:flutter_baskara/user/user_profil.dart';
import 'info.dart'; // Impor halaman info

class DashboardUser extends StatefulWidget {
  const DashboardUser({super.key});

  @override
  _DashboardUserState createState() => _DashboardUserState();
}

class _DashboardUserState extends State<DashboardUser> {
  bool _isHovered = false;

  void _showHoverEffect(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            // Garis hijau memanjang sesuai ukuran teks
            Container(
              width: screenWidth *
                  0.6, // Lebar garis menyesuaikan dengan lebar teks
              height: 5, // Ketebalan garis
              color: Colors.green,
            ),
            const SizedBox(height: 5), // Jarak antara garis dan teks
            const Text(
              'BASKARA GREEN',
              style: TextStyle(
                color: Colors.white, // Mengubah warna teks menjadi putih
                fontSize: 24, // Ukuran font bisa disesuaikan
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        backgroundColor:
            Colors.green, // Mengubah warna background AppBar menjadi hijau
        elevation: 1.0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Container(
            width: screenWidth * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
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
      ),
      bottomNavigationBar: Container(
        width: screenWidth,
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildIconButton(Icons.delete, 'Setor Sampah', context),
            _buildIconButton(Icons.home, 'Beranda', context),
            _buildIconButton(Icons.info, 'Informasi', context),
            _buildIconButton(Icons.account_circle, 'Akun', context),
          ],
        ),
      ),
    );
  }

  Widget _buildIconButton(IconData icon, String label, BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _showHoverEffect(true),
      onExit: (_) => _showHoverEffect(false),
      child: AnimatedScale(
        duration: const Duration(milliseconds: 100),
        scale: _isHovered ? 1.2 : 1.0,
        child: GestureDetector(
          onTap: () {
            if (label == 'Setor Sampah') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserSetorSampah()),
              );
            } else if (label == 'Akun') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AkunPage()),
              );
            } else if (label == 'Informasi') {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoPage()),
              );
            } else if (label == 'Beranda') {
              // Tidak ada aksi navigasi untuk ikon Home (tetap di halaman ini)
              print('Sudah berada di halaman Beranda');
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.green, size: 25),
              const SizedBox(height: 5),
              Text(
                label,
                style: const TextStyle(color: Colors.green, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
