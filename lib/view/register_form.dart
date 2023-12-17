import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/CommonUser/homepage_commonuser.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class RegisterForm extends StatefulWidget {
  final CommonUser? user;
  final Seller? seller;
  const RegisterForm({super.key, this.user , this.seller});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _nama = '';
  String _nomorTelepon = '';
  String _alamat = '';
  String _email = '';
  String _password = '';
  String errorText = '';

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
                  const Text(
                    'Register',
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
                          TextFormField(
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
                          TextFormField(
                            obscureText: true,
                            onChanged: (value) => _password = value,
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
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            onPressed: () async {
                              final NavigatorState navigatorContext = Navigator.of(context);
                              if (_formKey.currentState!.validate()) {
                                if (widget.user != null) {
                                  try {
                                    bool hasil = await widget.user!.createAccount(_nama, _password, _nomorTelepon, _alamat, _email);
            
                                    if (hasil) {
                                      navigatorContext.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePageCommonUser(user: widget.user!)), (route) => false);
                                    }
                                  } catch (e) {
                                    setState(() {
                                      errorText = e.toString();
                                    });
                                  }
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
                    errorText,
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
}