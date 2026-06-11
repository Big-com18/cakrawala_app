import 'package:flutter/material.dart';
import 'list_mahasiswa_page.dart'; 

class DetailMahasiswaPage extends StatelessWidget {
  const DetailMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Mahasiswa dataMahasiswa = ModalRoute.of(context)!.settings.arguments as Mahasiswa;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/avatar',
                    arguments: {
                      'fotoUrl': dataMahasiswa.fotoUrl,
                      'namaMahasiswa': dataMahasiswa.nama,
                    },
                  );
                },
                child: Hero(
                  tag: dataMahasiswa.fotoUrl,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(dataMahasiswa.fotoUrl), 
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Ketuk foto untuk memperbesar',
                style: TextStyle(fontSize: 12, color: Colors.grey, fontStyle: FontStyle.italic),
              ),
            ),
            const SizedBox(height: 24),
            
            _buildInfoRow('Nama Lengkap', dataMahasiswa.nama),
            const Divider(),
            _buildInfoRow('NIM', dataMahasiswa.nim),
            const Divider(),
            _buildInfoRow('Jurusan', dataMahasiswa.jurusan),
            const Divider(),
            
            const SizedBox(height: 16),
            const Text(
              'Tentang Mahasiswa:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              dataMahasiswa.deskripsi,
              style: const TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}