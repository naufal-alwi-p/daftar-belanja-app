import 'package:daftar_belanja/class/daftar.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class TambahBarangForm extends StatefulWidget {
  final Daftar daftar;
  const TambahBarangForm({super.key, required this.daftar});

  @override
  State<TambahBarangForm> createState() => _TambahBarangFormState();
}

class _TambahBarangFormState extends State<TambahBarangForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late final String _penyebutan;

  @override
  void initState() {
    super.initState();

    _penyebutan = (widget.daftar.runtimeType == DaftarBelanja) ? 'Barang' : 'Produk';
  }

  String _nama = '';
  String _harga = '';
  String _deskripsi = '';
  String _kategori = '';
  String _kuantitas = '';
  String _url = '';
  String _errorText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30.0),
                Text(
                  'Tambah $_penyebutan',
                  style: const TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => _nama = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama $_penyebutan Tidak Boleh Kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: Text('Nama $_penyebutan'),
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
                        const SizedBox(height: 30.0),
                        TextFormField(
                          onChanged: (value) => _harga = value,
                          validator: (value) {
                            if (!validator.isNumeric(value!)) {
                              return 'Isi dengan Angka';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: Text('Harga $_penyebutan'),
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
                        const SizedBox(height: 30.0),
                        TextFormField(
                          onChanged: (value) => _deskripsi = value,
                          decoration: InputDecoration(
                              label: Text('Deskripsi $_penyebutan'),
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
                        const SizedBox(height: 30.0),
                        TextFormField(
                          onChanged: (value) => _kategori = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Kategori $_penyebutan Tidak Boleh Kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: Text('Kategori $_penyebutan'),
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
                        const SizedBox(height: 30.0),
                        TextFormField(
                          onChanged: (value) => _kuantitas = value,
                          validator: (value) {
                            if (!validator.isNumeric(value!)) {
                              return 'Isi dengan Angka';
                            } else if (int.parse(value) < 1) {
                              return 'Jumlah Barang Minimal Satu';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: Text('Kuantitas $_penyebutan'),
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
                        const SizedBox(height: 30.0),
                        TextFormField(
                          onChanged: (value) => _url = value,
                          validator: (value) {
                            if (value!.isNotEmpty && !validator.isURL(value)) {
                              return 'URL Tidak Valid';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: Text('URL $_penyebutan'),
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
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () async {
                            final NavigatorState navigatorContext = Navigator.of(context);

                            if (_formKey.currentState!.validate()) {
                              try {
                                String? deskripsi = (_deskripsi.isNotEmpty) ? _deskripsi : null;
                                String? url = (_url.isNotEmpty) ? _url : null;
                                int harga = int.parse(_harga);
                                int kuantitas = int.parse(_kuantitas);

                                bool hasil = await widget.daftar.tambahBarang(_nama, harga, deskripsi, _kategori, kuantitas, url);

                                navigatorContext.pop(hasil);
                              } catch (e) {
                                setState(() {
                                  _errorText = e.toString();
                                });
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 60, 202, 82),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0,),
                Text(
                  _errorText,
                  style: TextStyle(
                    color: Colors.red.shade900,
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