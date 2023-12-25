import 'package:daftar_belanja/class/barang.dart';
import 'package:daftar_belanja/class/daftar.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class DetailProdukSeller extends StatefulWidget {
  final DaftarBelanja daftarBelanja;
  final Barang barang;
  const DetailProdukSeller({super.key, required this.daftarBelanja, required this.barang});

  @override
  State<DetailProdukSeller> createState() => _DetailProdukSellerState();
}

class _DetailProdukSellerState extends State<DetailProdukSeller> {
  final GlobalKey<FormFieldState> _confirmationFormKey = GlobalKey<FormFieldState>();

  Map<String, dynamic> dataBarang = {};

  String _kuantitas = '';

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
                  'Detail Produk',
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
                        'Stok',
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
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () async {
                    final NavigatorState navigatorContext = Navigator.of(context);

                    bool? confirmation = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          surfaceTintColor: Colors.white,
                          title: const Text('Input Jumlah Barang'),
                          content: TextFormField(
                            key: _confirmationFormKey,
                            onChanged: (value) => _kuantitas = value,
                            validator: (value) {
                              if (!validator.isNumeric(value!)) {
                                return 'Isi dengan Angka';
                              } else if (int.parse(value) < 1) {
                                return 'Jumlah Barang Minimal Satu';
                              } else if (int.parse(value) > dataBarang['Kuantitas']) {
                                return 'Stok Tidak Cukup';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text('Jumlah Barang'),
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(),
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red.shade900,
                                  ),
                                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                ),
                              ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: const Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_confirmationFormKey.currentState!.validate()) {
                                  Navigator.pop(context, true);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 60, 202, 82),
                                foregroundColor: Colors.white,
                                elevation: 0.0,
                              ),
                              child: const Text('Submit'),
                            ),
                          ],
                        );
                      }
                    );

                    if (confirmation == true) {
                      String? deskripsi = (dataBarang['Deskripsi'] == '-') ? null : dataBarang['Deskripsi'];
                      String? url = (dataBarang['URL'] == '-') ? null : dataBarang['URL'];
                      int kuantitas = int.parse(_kuantitas);

                      bool hasil = await widget.daftarBelanja.tambahBarang(dataBarang['Nama'], widget.barang.harga, deskripsi, dataBarang['Kategori'], kuantitas, url);
                      
                      navigatorContext.pop();
                      navigatorContext.pop();
                      navigatorContext.pop(hasil);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    backgroundColor: const Color.fromARGB(255, 60, 202, 82),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Pilih Barang',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}