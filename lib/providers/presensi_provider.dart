import 'package:flutter/material.dart';

class Siswa {
  String name;
  bool isHadir;

  Siswa({required this.name, this.isHadir = false});
}

class PresensiProvider extends ChangeNotifier {
  List<Siswa> siswa = [
    Siswa(name: 'Alkadafi'),
    Siswa(name: 'Dani'),
    Siswa(name: 'Isma'),
  ];

  List<Map<String, dynamic>> riwayat = [];

  void toggleKehadiran(int index, bool isHadir) {
    siswa[index].isHadir = isHadir;
    notifyListeners();
  }

  void simpanPresensi() {
    int hadir = siswa.where((s) => s.isHadir).length;
    int tidakHadir = siswa.length - hadir;

    riwayat.insert(0, {
      'tanggal': DateTime.now(),
      'hadir': hadir,
      'tidakHadir': tidakHadir,
    });

    for (var s in siswa) {
      s.isHadir = false;
    }

    notifyListeners();
  }
}
