import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/CommonUser/homepage_commonuser.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart' as validator;

class LoginForm extends StatefulWidget {
  final CommonUser? user;
  final Seller? seller;
  const LoginForm({super.key, this.user, this.seller});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _errorText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Login',
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
                            bool hasil = await widget.user!.login(_email, _password);

                            if (hasil) {
                              navigatorContext.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomePageCommonUser(user: widget.user!)), (route) => false);
                            }
                          } catch (e) {
                            setState(() {
                              _errorText = e.toString();
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
