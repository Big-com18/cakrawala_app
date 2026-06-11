import 'package:flutter/material.dart';

class AvatarDetailPage extends StatelessWidget {
  const AvatarDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String> args = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String fotoUrl = args['fotoUrl'] ?? '';
    final String namaMahasiswa = args['namaMahasiswa'] ?? '';

    return Scaffold(
      backgroundColor: Colors.black, 
      appBar: AppBar(
        title: const Text('Detail Foto'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: fotoUrl, 
              child: Image.network(
                fotoUrl,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              namaMahasiswa,
              style: const TextStyle(
                fontSize: 24, 
                color: Colors.white, 
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 40),
            
            ElevatedButton.icon(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              icon: const Icon(Icons.list),
              label: const Text('Kembali ke Daftar'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}