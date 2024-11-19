import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/presensi_provider.dart';
import 'pages/presensi_page.dart';
import 'pages/riwayat_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PresensiProvider(),
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => PresensiPage(),
          '/riwayat': (context) => RiwayatPage(),
        },
      ),
    ),
  );
}
