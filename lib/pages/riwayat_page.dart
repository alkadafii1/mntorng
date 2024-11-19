import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/presensi_provider.dart';

class RiwayatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PresensiProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Presensi')),
      body: provider.riwayat.isEmpty
          ? Center(child: Text('Belum ada riwayat presensi.'))
          : ListView.builder(
              itemCount: provider.riwayat.length,
              itemBuilder: (context, index) {
                final riwayat = provider.riwayat[index];
                return ListTile(
                  title: Text(
                    'Tanggal: ${riwayat['tanggal'].toString().split(' ')[0]}',
                  ),
                  subtitle: Text(
                    'Hadir: ${riwayat['hadir']}, Tidak Hadir: ${riwayat['tidakHadir']}',
                  ),
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.edit), label: 'Pencatatan'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
