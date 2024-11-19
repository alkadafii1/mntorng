import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/presensi_provider.dart';

class PresensiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PresensiProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Presensi Siswa'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: provider.siswa.length,
              itemBuilder: (context, index) {
                final siswa = provider.siswa[index];
                return ListTile(
                  title: Text(siswa.name),
                  trailing: Checkbox(
                    value: siswa.isHadir,
                    onChanged: (value) {
                      provider.toggleKehadiran(index, value ?? false);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: provider.siswa.any((s) => s.isHadir)
                  ? () {
                      provider.simpanPresensi();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Presensi berhasil disimpan!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                  : null,
              child: Text('Simpan'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/riwayat');
          }
        },
      ),
    );
  }
}
