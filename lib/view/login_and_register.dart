import 'package:daftar_belanja/view/register_form.dart';
import 'package:flutter/material.dart';
import 'package:daftar_belanja/view/login_form.dart';
import 'package:daftar_belanja/class/user.dart';

class LoginOrRegister extends StatelessWidget {
  final String userType;
  const LoginOrRegister({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 101, 255, 125),
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: Image(
                image: AssetImage('assets/girl_use_computer.png'),
                width: 200.0,
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 242, 242, 242),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0)
                  ),
                  border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 98, 212, 116)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Ingin Login Sebagai Apa Nih ?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 19.0
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0)
                          ),
                          border: Border(
                            top: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
                          ),
                        ),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(vertical: 30.0),
                              child: Text('Sudah punya akun?'),
                            ),
                            OutlinedButton(
                              onPressed: () {
                                if (userType == 'CommonUser') {
                                  CommonUser user = CommonUser();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm(user: user)));
                                } else if (userType == 'Seller') {
                                  Seller seller = Seller();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginForm(seller: seller)));
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(220, 36),
                              ),
                              child: const Text(
                                'Log-In',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            OutlinedButton(
                              onPressed: () {
                                if (userType == 'CommonUser') {
                                  CommonUser user = CommonUser();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterForm(user: user)));
                                } else if (userType == 'Seller') {
                                  Seller seller = Seller();
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterForm(seller: seller)));
                                }
                              },
                              style: OutlinedButton.styleFrom(
                                fixedSize: const Size(220, 36),
                              ),
                              child: const Text(
                                'Sign-Up',
                                style: TextStyle(fontSize: 17),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}