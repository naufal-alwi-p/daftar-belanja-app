import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/edit_user_profile_form.dart';
import 'package:daftar_belanja/view/login_as.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  final CommonUser? user;
  final Seller? seller;
  const UserProfile({super.key, this.user, this.seller});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic> dataUser = {};

  late List<Widget> widgetColumn;

  @override
  void initState() {
    super.initState();

    dataUser = widget.user?.getAllAttributes() ?? widget.seller!.getAllAttributes();
  }
  @override
  Widget build(BuildContext context) {
    widgetColumn = [
      const SizedBox(height: 5.0,),
    ];

    if (widget.seller != null) {
      widgetColumn.addAll(
        [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 70,
                child: Text(
                  'Toko',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  dataUser['Nama Toko'],
                  style: const TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 20.0),
        ]
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(
            top: 60.0,
            left: 20.0,
            right: 20.0,
          ),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 35.0,
                child: Icon(Icons.person, size: 40.0),
              ),
              const SizedBox(height: 10.0),
              Text(
                dataUser['Nama'],
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
              const SizedBox(height: 5.0),
              const Divider(),
              const Row(
                children: [
                  Text(
                    'Info Profil',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                ],
              ),
              ...widgetColumn,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 70,
                    child: Text(
                      'Nomor',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      dataUser['Nomor Telepon'],
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
                    width: 70,
                    child: Text(
                      'Alamat',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      dataUser['Alamat'].toString(),
                      softWrap: true,
                      maxLines: 10,
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
                    width: 70,
                    child: Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      dataUser['Email'],
                      style: const TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ),
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
                      if (widget.user != null) {
                        CommonUser? user = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserProfileForm(user: widget.user)));

                        if (user != null) {
                          setState(() {
                            dataUser = user.getAllAttributes();
                          });
                        }
                      } else if (widget.seller != null) {
                        Seller? seller = await Navigator.push(context, MaterialPageRoute(builder: (context) => EditUserProfileForm(seller: widget.seller)));

                        if (seller != null) {
                          setState(() {
                            dataUser = seller.getAllAttributes();
                          });
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.blue.shade300,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Edit Profile',
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
                            title: const Text('Sign Out ?'),
                            content: const Text('Apakah yakin ingin keluar dari akun ini ?'),
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
                        bool? hasil;

                        if (widget.user != null) {
                          hasil = widget.user!.logOut();
                        } else if (widget.seller != null) {
                          hasil = widget.seller!.logOut();
                        }

                        if (hasil == true) {
                          navigatorContext.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginAs()), (route) => false);
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              TextButton(
                onPressed: () async {
                  final NavigatorState navigatorContext = Navigator.of(context);

                  bool? confirmation = await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Hapus Akun ?'),
                        content: const Text('Apakah yakin ingin menghapus akun ?'),
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
                    bool? hasil;

                    if (widget.user != null) {
                      hasil = await widget.user!.deleteAccount();
                    } else if (widget.seller != null) {
                      hasil = await widget.seller!.deleteAccount();
                    }

                    if (hasil == true) {
                      navigatorContext.pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginAs()), (route) => false);
                    }
                  }
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.red.shade300,
                ),
                child: const Text(
                  'Hapus Akun',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}