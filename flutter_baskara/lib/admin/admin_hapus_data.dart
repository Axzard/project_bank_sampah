import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Untuk mengonversi JSON ke objek Dart
import 'dart:io'; // Untuk memanipulasi file


class HapusDataScreen extends StatefulWidget {
  const HapusDataScreen({Key? key}) : super(key: key);

  @override
  _HapusDataScreenState createState() => _HapusDataScreenState();
}

class _HapusDataScreenState extends State<HapusDataScreen> {
  // Menyimpan data sementara, misalnya daftar sampah
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  // Fungsi untuk mengambil data dari Firebase Realtime Database
  Future<void> _fetchData() async {
    final url = 'https://mobiledikastirio-default-rtdb.asia-southeast1.firebasedatabase.app/users/sampah.json'; // URL Firebase
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      List<Map<String, dynamic>> fetchedData = [];

      // Jika data "sampah" tidak kosong, kita ambil setiap item
      data.forEach((key, value) {
        fetchedData.add({
          'key': key, // ID unik dari data
          'image': value['image_url'], // Gambar sampah, tapi untuk Image.file bisa diganti nanti
          'name': value['name'], // Nama sampah
          'price': value['price'], // Harga sampah
        });
      });

      setState(() {
        dataList = fetchedData; // Mengupdate dataList dengan data yang diambil
      });
        } else {
      throw Exception('Failed to load data');
    }
  }

  // Fungsi untuk menghapus data dari Firebase Realtime Database
  Future<void> _deleteData(String dataKey) async {
    final url = 'https://mobiledikastirio-default-rtdb.asia-southeast1.firebasedatabase.app/users/sampah/$dataKey.json';

    final response = await http.delete(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        dataList.removeWhere((data) => data['key'] == dataKey);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil dihapus dari database!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal menghapus data!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hapus Data Sampah'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dataList.isEmpty
            ? const Center(child: CircularProgressIndicator()) // Menampilkan loading indicator jika data masih kosong
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  final item = dataList[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Menampilkan gambar file lokal
                          Image.file(
                            File(item['image']), // Ganti dengan lokasi file lokal
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'], // Nama sampah
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Harga: ${item['price']}',
                                style: const TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              _deleteData(item['key']); // Hapus data berdasarkan key
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
