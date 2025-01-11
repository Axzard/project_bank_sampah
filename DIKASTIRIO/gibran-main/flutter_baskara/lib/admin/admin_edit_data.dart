import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/AdminBeranda.dart';
import 'package:flutter_baskara/admin/admin_hapus_data.dart';
import 'package:flutter_baskara/admin/admin_tambah_data.dart';
import 'package:flutter_baskara/admin/lihat_data.dart';



class EditDataScreen extends StatelessWidget {
  const EditDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final buttonWidth = screenWidth * 0.7; // Tombol dengan lebar 70% dari layar

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardAdmin()));
          },
        ),
        title: Column(
          children: [
            // Menambahkan garis hijau di bawah teks "EDIT DATA"
            Container(
              width: screenWidth *
                  0.6, // Lebar garis hijau menyesuaikan ukuran teks
              height: 5, // Ketebalan garis
              color: Colors.green, // Warna garis hijau
            ),
            const SizedBox(height: 5), // Jarak antara garis hijau dan teks
            const Text(
              'EDIT DATA',
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.edit,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.add_circle_outline,
                  label: 'Tambah Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const TambahDataScreen()),
                    );
                  },
                  width: buttonWidth,
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.delete,
                  label: 'Hapus Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HapusDataScreen()),
                    );
                  },
                  width: buttonWidth,
                ),
                const SizedBox(height: 16),
                _buildMenuItem(
                  icon: Icons.view_list,
                  label: 'Lihat Data',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LihatData()),
                    );
                  },
                  width: buttonWidth,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    required double width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.green),
            const SizedBox(width: 16),
            Text(
              label,
              style: const TextStyle(fontSize: 16, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}






