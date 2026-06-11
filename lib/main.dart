import 'package:flutter/material.dart';
import 'package:cakrawala_app/siswa/list_mahasiswa_page.dart'; 
import 'package:cakrawala_app/siswa/detail_mahasiswa_page.dart';
import 'package:cakrawala_app/siswa/avatar_detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portal Akademik',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF1565C0),
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      initialRoute: '/list',
      routes: {
        '/list': (context) => const ListMahasiswaPage(),
        '/detail': (context) => const DetailMahasiswaPage(),
        '/avatar': (context) => const AvatarDetailPage(),
      },
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({super.key});

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

class _HalamanUtamaState extends State<HalamanUtama> {
  int counter = 0;
  String pesan = 'Belum ditekan';

  void tambah() {
    setState(() {
      counter++;
      pesan = 'Sudah ditekan $counter kali';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar State'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              pesan,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: tambah,
              child: const Text('Tekan Saya'),
            ),
          ],
        ),
      ),
    );
  }
}