import 'package:flutter/material.dart';
import 'siswa/list_mahasiswa_page.dart';
import 'siswa/detail_mahasiswa_page.dart';
import 'siswa/avatar_detail_page.dart';
import 'sesi5/product_list_page.dart';
import 'sesi5/product_detail_page.dart';  
import 'sesi5/checkout_page.dart';

// 1. IMPORT FILE BARUNYA DI SINI
import 'state/state_coba.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Navigasi',
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
        // Route Halaman 1: List Mahasiswa
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => const ListMahasiswaPage(),
          );
        }

        // Route Halaman 2: Detail Mahasiswa
        if (settings.name == '/detail') {
          final args = settings.arguments as Mahasiswa;
          return MaterialPageRoute(
            builder: (context) => DetailMahasiswaPage(dataMahasiswa: args),
          );
        }

        // Route Halaman 3: Avatar Detail
        if (settings.name == '/avatar') {
          final args = settings.arguments as Map<String, dynamic>;
          return MaterialPageRoute(
            builder: (context) => AvatarDetailPage(
              fotoUrl: args['fotoUrl'],
              namaMahasiswa: args['namaMahasiswa'],
            ),
          );
        }

        // 2. TAMBAHKAN ROUTE BARU UNTUK STATE COBA DI SINI
        if (settings.name == '/belajar-state') {
          return MaterialPageRoute(
            // Pastikan 'Belajarstate' adalah nama class yang ada di dalam state_coba.dart
            builder: (context) => const Belajarstate(), 
          );
        }

        return null;
      },
    );
  }
}