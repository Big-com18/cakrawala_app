import 'package:flutter/material.dart';
// Pastikan path import di bawah ini disesuaikan dengan struktur folder kamu
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
      initialRoute: '/',
      onGenerateRoute: (settings) {
        
        // 1. Route untuk halaman utama (List Mahasiswa)
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const ListMahasiswaPage(),
          );
        }

        // 2. Route untuk halaman Detail Mahasiswa
        if (settings.name == '/detail') {
          final argsMahasiswa = settings.arguments as Mahasiswa;
          return MaterialPageRoute(
            builder: (context) => DetailMahasiswaPage(
              dataMahasiswa: argsMahasiswa,
            ),
          );
        }

        // 3. Route untuk halaman Avatar (Zoom Foto)
        if (settings.name == '/avatar') {
          final argsAvatar = settings.arguments as Map<String, String>;
          return MaterialPageRoute(
            builder: (context) => AvatarDetailPage(
              fotoUrl: argsAvatar['fotoUrl'] ?? '',
              namaMahasiswa: argsAvatar['namaMahasiswa'] ?? '',
            ),
          );
        }

        // Fallback jika route tidak ditemukan
        return null;
      },
    );
  }
}