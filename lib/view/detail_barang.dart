import 'package:daftar_belanja/class/barang.dart';
import 'package:flutter/material.dart';

class DetailBarang extends StatefulWidget {
  final Barang barang;
  const DetailBarang({super.key, required this.barang});

  @override
  State<DetailBarang> createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Detail Barang'),
      ),
    );
  }
}