import 'package:flutter/material.dart';

class Belajarstate extends StatefulWidget {
  const Belajarstate({super.key});

  @override
  State<Belajarstate> createState() => _BelajarstateState();
}

class _BelajarstateState extends State<Belajarstate> {
  final List<Map<String, String>> _transactions = [
    {'name': 'Tokopedia', 'amount': '-Rp 150.000'},
    {'name': 'GoPay Top Up', 'amount': '+Rp 200.000'},
    {'name': 'Indomaret', 'amount': '-Rp 25.000'},
    {'name': 'Transfer ke Ani', 'amount': '-Rp 500.000'},
  ];

  final TextEditingController _controller = TextEditingController();
  String _displayText = "Kosong";
  List<String> _listItems = [];

  void _onSubmit() {
    setState(() {
      _displayText = _controller.text;
      _listItems.add(_controller.text);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BCA Mobile'),
      ),
      // Membungkus Column dengan Padding agar UI tidak kepotong/menempel di pinggir
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Masukkan teks',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onSubmit,
              child: const Text('Submit'),
            ),
            const SizedBox(height: 16),
            Text(
              'Result : $_displayText',
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16), // Jarak tambahan agar list tidak terlalu rapat
            Expanded(
              child: ListView.builder(
                itemCount: _listItems.length,
                itemBuilder: (context, index) {
                  return Text('- ${_listItems[index]}'); // Tambahan strip agar lebih rapi
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}