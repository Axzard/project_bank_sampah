import 'package:flutter/material.dart';

class UserSetorSampah extends StatefulWidget {
  @override
  _UserSetorSampahState createState() => _UserSetorSampahState();
}

class _UserSetorSampahState extends State<UserSetorSampah> {
  // Menyimpan jumlah setiap sampah yang akan disetor
  Map<String, int> jumlahSampah = {
    'Kertas': 0,
    'Koran': 0,
    'Botol': 0,
    'Kardus': 0,
  };

  Map<String, int> hargaSampah = {
    'Kertas': 5000,
    'Koran': 5000,
    'Botol': 2000,
    'Kardus': 5000,
  };

  // List untuk menyimpan jenis sampah yang ditampilkan
  List<String> sampahList = ['Kertas', 'Koran', 'Botol', 'Kardus'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Setor Sampah',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Fungsi untuk kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Silahkan pilih jenis sampah yang akan di setor...',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 16),
            // Menggunakan ListView untuk menampilkan item dalam kolom
            Expanded(
              child: ListView.builder(
                itemCount: sampahList.length,
                itemBuilder: (context, index) {
                  String title = sampahList[index];
                  return _buildListItem(
                    context,
                    'lib/assets/${title.toLowerCase()}_bekas.jpg',
                    title,
                    hargaSampah[title]!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Membuat item dengan tampilan seperti kartu
  Widget _buildListItem(BuildContext context, String imagePath, String title, int price) {
    return InkWell(
      onTap: () {
        // Tambahkan logika saat item diklik jika diperlukan
      },
      splashColor: Colors.green.withOpacity(0.3), // Efek splash saat diklik
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(10.0), // Menambahkan padding di sekitar card
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200), // Durasi animasi
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green, width: 2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row( // Menggunakan Row untuk menempatkan gambar di kiri dan detail di kanan
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack( // Menggunakan Stack untuk menempatkan delete icon
                children: [
                  // Gambar sampah dengan latar belakang hitam
                  Container(
                    padding: EdgeInsets.only(top: 20), // Menurunkan gambar sedikit
                    width: MediaQuery.of(context).size.width * 0.3, // Menggunakan 30% lebar layar untuk gambar
                    height: 150,  // Menentukan tinggi gambar
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black, // Latar belakang hitam pada gambar
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                        alignment: Alignment.center, // Memastikan gambar berada di tengah
                      ),
                    ),
                  ),
                  // Icon delete di pojok kanan atas
                  
                ],
              ),
              SizedBox(width: 16), // Memberikan jarak antara gambar dan teks
              // Detail sampah dan tombol "Setor Sampah" di sebelah kanan gambar
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    SizedBox(height: 8),
                    // Menampilkan harga per kg dan total harga berdasarkan jumlah
                    Text(
                      'Rp ${price.toString()}/kg',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Total: Rp ${(jumlahSampah[title]! * price).toString()}',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        // Tombol kurangi jumlah sampah
                        IconButton(
                          icon: Icon(Icons.remove_circle_outline, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              if (jumlahSampah[title]! > 0) {
                                jumlahSampah[title] = jumlahSampah[title]! - 1;
                              }
                            });
                          },
                        ),
                        
                        // Menampilkan jumlah sampah
                        Text(
                          '${jumlahSampah[title]} kg',
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                        // Tombol tambah jumlah sampah
                        IconButton(
                          icon: Icon(Icons.add_circle_outline, color: Colors.green),
                          onPressed: () {
                            setState(() {
                              jumlahSampah[title] = jumlahSampah[title]! + 1;
                            });
                          },
                        ),                                         
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        // Menampilkan dialog konfirmasi hapus item
                        _showDeleteConfirmationDialog(context, title);
                      },
                    ),
                
                        
                      ],
                    ),
                    SizedBox(height: 16),
                    // Tombol setor sampah di setiap card
                    ElevatedButton(
                      onPressed: () {
                        // Tampilkan dialog konfirmasi ketika tombol ditekan
                        _showConfirmationDialog(context, title);
                      },
                      style: ElevatedButton.styleFrom(
                        iconColor: Colors.green, // Warna latar belakang tombol hijau
                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), // Padding tombol
                      ),
                      child: Text(
                        'Setor Sampah',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi setor sampah
  void _showConfirmationDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi'),
          content: Text('Apakah Anda yakin ingin setor sampah $title?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog jika memilih "Batal"
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                // Aksi untuk menyerahkan sampah
                print("Menyerahkan sampah $title...");
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Fungsi untuk menampilkan dialog konfirmasi hapus item
  void _showDeleteConfirmationDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Konfirmasi Hapus'),
          content: Text('Apakah Anda yakin ingin menghapus $title dari daftar?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog jika memilih "Batal"
              },
              child: Text('Batal'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Menutup dialog
                // Hapus item dari daftar
                setState(() {
                  sampahList.remove(title);  // Menghapus item dari daftar
                  jumlahSampah.remove(title);  // Menghapus jumlah sampah terkait
                });
                print("Menghapus sampah $title...");
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
