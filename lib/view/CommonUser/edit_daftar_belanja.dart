import 'package:daftar_belanja/class/daftar.dart';
import 'package:flutter/material.dart';

class EditDaftarBelanja extends StatefulWidget {
  final DaftarBelanja daftarBelanja;
  const EditDaftarBelanja({super.key, required this.daftarBelanja});

  @override
  State<EditDaftarBelanja> createState() => _EditDaftarBelanjaState();
}

class _EditDaftarBelanjaState extends State<EditDaftarBelanja> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _namaDaftar = '';
  String _errorText = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Edit Daftar Belanja',
            textAlign: TextAlign.center,
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
                    initialValue: widget.daftarBelanja.namaDaftar,
                    onChanged: (value) => _namaDaftar = value,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Nama Daftar Belanja Tidak Boleh Kosong';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        label: const Text('Nama Daftar Belanja'),
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
                          bool result = await widget.daftarBelanja.update(_namaDaftar);

                          if (result) {
                            navigatorContext.pop(widget.daftarBelanja);
                          }
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
    );
  }
}