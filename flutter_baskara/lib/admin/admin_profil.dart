import 'package:flutter/material.dart';
import 'package:flutter_baskara/login/login.dart';

class AkunPage extends StatelessWidget {
  const AkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green, // Warna hijau AppBar
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigasi kembali
          },
        ),
        title: const Text(
          'Akun',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Ikon profil
              CircleAvatar(
                radius: screenSize.width < 600 ? 40 : 60, // Responsif
                backgroundColor: Colors.green,
                child: Icon(
                  Icons.person,
                  size: screenSize.width < 600 ? 40 : 60, // Responsif
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              // Nama pengguna
              Text(
                'ADMIN BASKARA GREEN',
                style: TextStyle(
                  fontSize: screenSize.width < 600 ? 18 : 22, // Responsif
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 16),
              // Informasi pengguna
              _buildInfoRow(
                context,
                icon: Icons.person_outline,
                label: 'Admin Baskara Green',
              ),
              _buildInfoRow(
                context,
                icon: Icons.monetization_on_outlined,
                label: 'Rp 2.000.000',
              ),
              _buildInfoRow(
                context,
                icon: Icons.location_on_outlined,
                label: 'BANK SAMPAH 1',
              ),
              // Tombol keluar
              SizedBox(height: 16),
              _buildInfoRow(
                context,
                icon: Icons.logout,
                label: 'Keluar',
                isExit: true, // Untuk tombol khusus
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk baris informasi
  Widget _buildInfoRow(BuildContext context,
      {required IconData icon, required String label, bool isExit = false}) {
    return GestureDetector(
      onTap: isExit
          ? () => _showLogoutConfirmation(context) // Show confirmation dialog
          : null,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isExit ? Colors.red : Colors.green,
            ),
            SizedBox(width: 12),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: isExit ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to show logout confirmation
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Keluar"),
          content: Text("Apakah Anda yakin ingin keluar?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              child: Text(
                "Keluar",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}
