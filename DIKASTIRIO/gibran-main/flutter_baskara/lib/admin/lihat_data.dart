import 'package:flutter/material.dart';
import 'package:flutter_baskara/admin/editsampah.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';  // Untuk menggunakan Image.file

class LihatData extends StatefulWidget {
  const LihatData({Key? key}) : super(key: key);

  @override
  _LihatDataState createState() => _LihatDataState();
}

class _LihatDataState extends State<LihatData> {
  List<Map<String, dynamic>> dataList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final url = 'https://mobiledikastirio-default-rtdb.asia-southeast1.firebasedatabase.app/users/sampah.json';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> fetchedData = [];

        // Periksa apakah ada data yang diterima
        if (data.isNotEmpty) {
          data.forEach((key, value) {
            fetchedData.add({
              'key': key,
              'image': value['image_url'],  // URL gambar
              'name': value['name'],
              'price': value['price'],
            });
          });
          setState(() {
            dataList = fetchedData;
          });
        } else {
          setState(() {
            dataList = [];
          });
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print("Error fetching data: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memuat data')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lihat Data Sampah'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: dataList.isEmpty
            ? const Center(child: CircularProgressIndicator())
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
                          // Ganti Image.network dengan Image.file
                          SizedBox(
                            width: 70,
                            height: 70,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                File(item['image']), // Tampilkan gambar dari file lokal
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item['name'],
                                  style: const TextStyle(
                                    fontSize: 18, 
                                    fontWeight: FontWeight.bold,
                                  ),
                                  overflow: TextOverflow.ellipsis, // Agar teks panjang tidak meluap
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Harga: ${item['price']}',
                                  style: const TextStyle(fontSize: 16),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EditSampah(dataKey: '', initialName: '', initialPrice: '', initialImageUrl: '',

                                  ),
                                )
                              );
                              // Logika untuk edit data, misalnya navigasi ke halaman edit
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
