import 'package:flutter/material.dart';

class Mahasiswa {
  final String nama;
  final String nim;
  final String jurusan;
  final String deskripsi;
  final String fotoUrl;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.jurusan,
    required this.deskripsi,
    required this.fotoUrl,
  });
}

final List<Mahasiswa> daftarMahasiswaDummy = [
  Mahasiswa(
    nama: 'Andi Saputra',
    nim: '24110300011',
    jurusan: 'Ilmu Komputer',
    deskripsi: 'Andi sangat menyukai pengembangan backend dan sering menggunakan Node.js.',
    fotoUrl: 'https://i.pravatar.cc/300?img=10',
  ),
  Mahasiswa(
    nama: 'Budi Santoso',
    nim: '24110300012',
    jurusan: 'Ilmu Komputer',
    deskripsi: 'Budi adalah asisten laboratorium untuk mata kuliah Struktur Data.',
    fotoUrl: 'https://i.pravatar.cc/300?img=11',
  ),
  Mahasiswa(
    nama: 'Citra Kirana',
    nim: '24110300013',
    jurusan: 'Sistem Informasi',
    deskripsi: 'Citra fokus pada UI/UX Design dan mahir menggunakan Figma.',
    fotoUrl: 'https://i.pravatar.cc/300?img=12',
  ),
  Mahasiswa(
    nama: 'Dewi Lestari',
    nim: '24110300014',
    jurusan: 'Ilmu Komputer',
    deskripsi: 'Dewi aktif di komunitas open source dan sering berkontribusi di GitHub.',
    fotoUrl: 'https://i.pravatar.cc/300?img=13',
  ),
];

class ListMahasiswaPage extends StatelessWidget {
  const ListMahasiswaPage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Mahasiswa'),
      ),
      body: ListView.builder(
        itemCount: daftarMahasiswaDummy.length, 
        itemBuilder: (context, index) {
          final mhs = daftarMahasiswaDummy[index];
          
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            elevation: 2,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(mhs.fotoUrl), 
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                mhs.nama, 
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('NIM: ${mhs.nim}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Menggunakan Named Route dan mengirim objek mhs ke parameter arguments
                Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: mhs, 
                );
              },
            ),
          );
        },
      ),
    );
  }
}