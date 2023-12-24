import 'package:daftar_belanja/class/barang.dart';
import 'package:daftar_belanja/view/edit_detail_barang_form.dart';
import 'package:flutter/material.dart';

class DetailBarang extends StatefulWidget {
  final Barang barang;
  const DetailBarang({super.key, required this.barang});

  @override
  State<DetailBarang> createState() => _DetailBarangState();
}

class _DetailBarangState extends State<DetailBarang> {
  Map<String, dynamic> dataBarang = {};

  @override
  void initState() {
    super.initState();

    dataBarang = widget.barang.showDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              top: 50.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Column(
              children: [
                const Text(
                  'Detail Barang',
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Nama',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['Nama'],
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Harga',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['Harga'],
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Kategori',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['Kategori'],
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Jumlah',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['Kuantitas'].toString(),
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'URL',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['URL'],
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: Text(
                        'Deskripsi',
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        dataBarang['Deskripsi'],
                        style: const TextStyle(
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20.0),
                const Divider(),
                const SizedBox(height: 30.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        bool? hasil = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditDetailBarangForm(barang: widget.barang)));
    
                        if (hasil == true) {
                          setState(() {
                            dataBarang = widget.barang.showDetail();
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.blue.shade300,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Edit Barang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        final NavigatorState navigatorContext = Navigator.of(context);
    
                        bool? confirmation = await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Hapus Produk'),
                              content: const Text('Apakah yakin ingin menghapus ?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, false);
                                  },
                                  child: const Text('Tidak'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context, true);
                                  },
                                  child: const Text('Ya'),
                                ),
                              ],
                            );
                          },
                        );
    
                        if (confirmation == true) {
                          bool hasil = await widget.barang.delete();

                          if (hasil) {
                            navigatorContext.pop();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Hapus Barang',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}