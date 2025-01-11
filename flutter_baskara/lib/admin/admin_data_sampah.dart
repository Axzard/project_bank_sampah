import 'package:flutter/material.dart';

class SampahPage extends StatelessWidget {
  const SampahPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // Membungkus dengan SingleChildScrollView agar konten bisa digulir
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              // Bagian atas dengan latar hijau
              Container(
                color: Colors.green, // Latar belakang hijau
                padding: const EdgeInsets.only(
                  top: 10, // Padding atas untuk status bar
                  bottom:
                      16, // Padding bawah agar teks dan ikon tidak terlalu mepet
                ),
                child: Column(
                  children: [
                    // Garis hijau yang lebih tebal
                    Container(
                      width: MediaQuery.of(context).size.width *
                          0.5, // Garis lebih lebar dari teks
                      height: 4, // Ketebalan garis
                      color: Colors.green, // Warna garis hijau
                    ),
                    const SizedBox(
                        height: 5), // Jarak antara garis hijau dan teks
                    Row(
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(
                                context); // Kembali ke halaman sebelumnya
                          },
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          'Data Sampah',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16), // Jarak antara header dan konten
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.recycling, color: Colors.green, size: 60),
                    const SizedBox(height: 16), // Jarak antara ikon dan list
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height - 200,
                      ),
                      child: ListView(
                        shrinkWrap:
                            true, // Mengurangi ukuran list untuk mencegah overflow
                        children: const [
                          SampahCard(
                            jenisSampah: 'Plastik',
                            beratSampah: '5 Kg',
                            tanggal: '2024-12-20',
                            lokasi: 'Bastiong RW 02',
                            status: 'Diambil',
                            saldo: '25 Poin',
                          ),
                          SampahCard(
                            jenisSampah: 'Kertas',
                            beratSampah: '3 Kg',
                            tanggal: '2024-12-21',
                            lokasi: 'Mangga Dua RW 1',
                            status: 'Belum Diambil',
                            saldo: '15 Poin',
                          ),
                          SampahCard(
                            jenisSampah: 'Logam',
                            beratSampah: '8 Kg',
                            tanggal: '2024-12-22',
                            lokasi: 'Jati RW 2',
                            status: 'Diambil',
                            saldo: '40 Poin',
                          ),
                          SampahCard(
                            jenisSampah: 'Organik',
                            beratSampah: '10 Kg',
                            tanggal: '2024-12-23',
                            lokasi: 'Tafure RW 3',
                            status: 'Belum Diambil',
                            saldo: '50 Poin',
                          ),
                          SampahCard(
                            jenisSampah: 'Plastik',
                            beratSampah: '7 Kg',
                            tanggal: '2024-12-20',
                            lokasi: 'Dufa-Dufa RW 4',
                            status: 'Diambil',
                            saldo: '35 Poin',
                          ),
                        ],
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
}

class SampahCard extends StatelessWidget {
  final String jenisSampah;
  final String beratSampah;
  final String tanggal;
  final String lokasi;
  final String status;
  final String saldo;

  const SampahCard({
    Key? key,
    required this.jenisSampah,
    required this.beratSampah,
    required this.tanggal,
    required this.lokasi,
    required this.status,
    required this.saldo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        border: Border.all(color: Colors.green),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            jenisSampah,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.green,
            ),
          ),
          const SizedBox(height: 8),
          Text('Berat Sampah : $beratSampah'),
          Text('Tanggal : $tanggal'),
          Text('Lokasi : $lokasi'),
          Text('Status : $status'),
          Text('Saldo  : $saldo'),
        ],
      ),
    );
  }
}
