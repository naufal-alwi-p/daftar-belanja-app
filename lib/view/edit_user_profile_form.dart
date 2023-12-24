import 'package:daftar_belanja/class/user.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class EditUserProfileForm extends StatefulWidget {
  final CommonUser? user;
  final Seller? seller;
  const EditUserProfileForm({super.key, this.user, this.seller});

  @override
  State<EditUserProfileForm> createState() => _EditUserProfileFormState();
}

class _EditUserProfileFormState extends State<EditUserProfileForm> {
  // Urus Fitur Ganti Password atau Tidak (Rencana gunakan toggle button)
  // Jika benar ingin mengubah profil, user harus konfirmasi dengan meng-input password saat ini (Bukan password baru)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _confirmationFormKey = GlobalKey<FormFieldState>();

  Map<String, dynamic> dataUser = {};

  String _nama = '';
  String _namaToko = '';
  String _nomorTelepon = '';
  String _alamat = '';
  String _email = '';
  String _oldPassword = '';
  final TextEditingController _newPassword = TextEditingController();
  String _errorText = '';

  late List<Widget> _inputFields;

  final List<bool> _opsiGantiPassword = [false];

  @override
  void initState() {
    super.initState();

    dataUser = widget.user?.getAllAttributes() ?? widget.seller!.getAllAttributes();

    _nama = dataUser['Nama'];
    _namaToko = (widget.seller != null) ? dataUser['Nama Toko'] : '';
    _nomorTelepon = dataUser['Nomor Telepon'];
    _alamat = dataUser['Alamat'];
    _email = dataUser['Email'];

    _inputFields = [
      TextFormField(
        initialValue: dataUser['Nama'],
        onChanged: (value) => _nama = value,
        validator: (value) {
          if (!validator.isAlpha(validator.blacklist(value!, ' '))) {
            return 'Nama Harus Terdiri dari Huruf Saja';
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
            label: const Text('Nama'),
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
    ];

    if (widget.seller != null) {
      _inputFields.insertAll(
        2,
        [
          TextFormField(
            initialValue: dataUser['Nama Toko'],
            onChanged: (value) => _namaToko = value,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Nama Toko Wajib Diisi';
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
                label: const Text('Nama Toko'),
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
        ]
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 30.0),
                  const Text(
                    'Edit Profile',
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
                          ..._inputFields,
                          TextFormField(
                            initialValue: dataUser['Nomor Telepon'],
                            onChanged: (value) => _nomorTelepon = value,
                            validator: (value) {
                              if (!validator.isNumeric(value!)) {
                                return 'Isikan Nomor Telepon';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text('Nomor Telepon'),
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
                            initialValue: dataUser['Alamat'],
                            onChanged: (value) => _alamat = value,
                            validator: (value) {
                              if (!validator.isAscii(value!)) {
                                return 'Isi Alamat dengan Benar';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text('Alamat'),
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
                            initialValue: dataUser['Email'],
                            onChanged: (value) => _email = value,
                            validator: (value) {
                              if (!validator.isEmail(value!)) {
                                return 'Email Tidak Valid';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text('Email'),
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
                          ToggleButtons(
                            onPressed: (index) {
                              setState(() {
                                _opsiGantiPassword[index] = !_opsiGantiPassword[index];

                                if (_opsiGantiPassword[index] == false) {
                                  _newPassword.clear();
                                }
                              });
                            },
                            color: Colors.grey,
                            fillColor: Colors.green.shade400,
                            selectedColor: Colors.white,
                            selectedBorderColor: Colors.green,
                            borderRadius: const BorderRadius.all(Radius.circular(8)),
                            isSelected: _opsiGantiPassword,
                            children: const <Widget>[
                              Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                              child: Text('Ganti Password'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            obscureText: true,
                            enabled: _opsiGantiPassword[0],
                            controller: _newPassword,
                            validator: (value) {
                              if (_opsiGantiPassword[0] && !validator.isLength(value!, 8)) {
                                return 'Password Minimal 8 Karakter';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                label: const Text('Password Baru'),
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
                                bool? confirmation = await showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      surfaceTintColor: Colors.white,
                                      title: const Text('Konfirmasi'),
                                      content: TextFormField(
                                        key: _confirmationFormKey,
                                        obscureText: true,
                                        onChanged: (value) => _oldPassword = value,
                                        validator: (value) {
                                          if (!validator.isLength(value!, 8)) {
                                            return 'Password Minimal 8 Karakter';
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                            label: const Text('Password'),
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
                                  },
                                );
                                if (confirmation == true) {
                                  if (widget.user != null) {
                                    try {
                                      String? newPassword = (_newPassword.text.isEmpty) ? null : _newPassword.text;

                                      bool hasil = await widget.user!.update(_nama, _oldPassword, _nomorTelepon, _alamat, _email, newPassword);

                                      if (hasil) {
                                        navigatorContext.pop(widget.user!);
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _errorText = e.toString();
                                      });
                                    }
                                  } else if (widget.seller != null) {
                                    try {
                                      String? newPassword = (_newPassword.text.isEmpty) ? null : _newPassword.text;
                                      String? namaToko = (_namaToko.isEmpty) ? null : _namaToko;

                                      bool hasil = await widget.seller!.update(_nama, _oldPassword, _nomorTelepon, _alamat, _email, newPassword, namaToko);

                                      if (hasil) {
                                        navigatorContext.pop(widget.seller!);
                                      }
                                    } catch (e) {
                                      setState(() {
                                        _errorText = e.toString();
                                      });
                                    }
                                  }
                                }
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 60, 202, 82),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('Submit'),
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
      ),
    );
  }

  @override
  void dispose() {
    _newPassword.dispose();
    super.dispose();
  }
}