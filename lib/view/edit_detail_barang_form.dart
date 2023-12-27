import 'package:daftar_belanja/class/barang.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class EditDetailBarangForm extends StatefulWidget {
  final Barang barang;
  const EditDetailBarangForm({super.key, required this.barang});

  @override
  State<EditDetailBarangForm> createState() => _EditDetailBarangFormState();
}

class _EditDetailBarangFormState extends State<EditDetailBarangForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, dynamic> dataBarang = {};

  String _nama = '';
  String _harga = '';
  String _deskripsi = '';
  String _kategori = '';
  String _kuantitas = '';
  String _url = '';
  String _errorText = '';

  @override
  void initState() {
    super.initState();

    dataBarang = widget.barang.showDetail();

    _nama = dataBarang['Nama'];
    _harga = widget.barang.harga.toString();
    _deskripsi = (dataBarang['Deskripsi'] == '-') ? '' : dataBarang['Deskripsi'];
    _kategori = dataBarang['Kategori'];
    _kuantitas = dataBarang['Kuantitas'].toString();
    _url = (dataBarang['URL'] == '-') ? '' : dataBarang['URL'];
  }

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
                const Text(
                  'Edit Barang',
                  style: TextStyle(
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
                          initialValue: _nama,
                          onChanged: (value) => _nama = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama barang Tidak Boleh Kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: const Text('Nama Barang'),
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
                          initialValue: widget.barang.harga.toString(),
                          onChanged: (value) => _harga = value,
                          validator: (value) {
                            if (!validator.isNumeric(value!)) {
                              return 'Isi dengan Angka';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: const Text('Harga Barang'),
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
                          initialValue: _deskripsi,
                          onChanged: (value) => _deskripsi = value,
                          decoration: InputDecoration(
                              label: const Text('Deskripsi Barang'),
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
                          initialValue: _kategori,
                          onChanged: (value) => _kategori = value,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Kategori Barang Tidak Boleh Kosong';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: const Text('Kategori Barang'),
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
                          initialValue: _kuantitas,
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
                              label: const Text('Kuantitas Barang'),
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
                          initialValue: _url,
                          onChanged: (value) => _url = value,
                          validator: (value) {
                            if (value!.isNotEmpty && !validator.isURL(value)) {
                              return 'URL Tidak Valid';
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                              label: const Text('URL Barang'),
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

                                bool hasil = await widget.barang.update(_nama, harga, deskripsi, _kategori, kuantitas, url);

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