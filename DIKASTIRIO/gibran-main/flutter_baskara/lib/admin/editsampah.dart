import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditSampah extends StatefulWidget {
  final String initialName;
  final String initialPrice;
  final String initialImageUrl;

  const EditSampah({
    Key? key,
    required this.initialName,
    required this.initialPrice,
    required this.initialImageUrl, required String dataKey,
  }) : super(key: key);
  
  get dataKey => null;

  @override
  _EditSampahState createState() => _EditSampahState();
}

class _EditSampahState extends State<EditSampah> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  String? _imageUrl;
  File? _imageFile;  // Menyimpan file gambar yang dipilih

  final ImagePicker _picker = ImagePicker();
  
  get dataKey => null;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.initialName;
    _priceController.text = widget.initialPrice;
    _imageUrl = widget.initialImageUrl;
  }

  Future<void> _updateData() async {
    // Mengambil harga sebagai double
    double? price = double.tryParse(_priceController.text);
    if (price == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Harga tidak valid! Harap masukkan angka.')),
      );
      return;
    }

    // Jika ada gambar yang dipilih, upload gambar terlebih dahulu
    if (_imageFile != null) {
      // Proses upload gambar ke Firebase Storage atau server (pastikan Anda melakukan upload gambar terlebih dahulu)
      // Misalnya menggunakan Firebase Storage, atau menyimpan gambar di server dan mendapatkan URL-nya.
      // Berikut contoh URL dummy untuk menggantikan URL gambar.
      _imageUrl = 'https://your-storage-url.com/your-image.jpg'; // Ganti dengan URL gambar yang diupload.
    }

    // URL yang mengarah ke entri yang akan diupdate berdasarkan dataKey
    final url = 'https://mobiledikastirio-default-rtdb.asia-southeast1.firebasedatabase.app/users/sampah/$dataKey.json';

    // Mengirim request PATCH untuk memperbarui data yang sesuai dengan dataKey
    final response = await http.patch(
      Uri.parse(url),
      body: json.encode({
        'Key': dataKey,
        'name': _nameController.text,
        'price': price,  // Menggunakan harga sebagai double
        'image_url': _imageUrl,  // Menyimpan URL gambar yang sudah dipilih
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Data berhasil diperbarui!')),
      );
      Navigator.pop(context); // Kembali ke layar sebelumnya
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Gagal memperbarui data!')),
      );
    }
  }

  // Fungsi untuk memilih gambar dari galeri atau kamera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery); // Sumber: Kamera atau Galeri
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Data Sampah'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama Sampah',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _priceController,
                decoration: const InputDecoration(
                  labelText: 'Harga Sampah',
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true), // Untuk input angka dengan desimal
              ),
              const SizedBox(height: 16),
              // Menampilkan gambar yang sudah dipilih
              _imageFile == null
                  ? (widget.initialImageUrl.isEmpty
                      ? const Text('Tidak ada gambar')
                      : Image.network(widget.initialImageUrl)) // Menampilkan gambar yang ada sebelumnya
                  : Image.file(_imageFile!), // Menampilkan gambar yang dipilih
              const SizedBox(height: 16),
              // Tombol untuk memilih gambar
              ElevatedButton(
                onPressed: _pickImage,
                child: const Text('Pilih Gambar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _updateData,
                child: const Text('Perbarui Data'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  textStyle: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
