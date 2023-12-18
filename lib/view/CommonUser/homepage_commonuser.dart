import 'package:daftar_belanja/class/daftar.dart';
import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/CommonUser/daftar_belanja_commonuser.dart';
import 'package:daftar_belanja/view/CommonUser/edit_daftar_belanja.dart';
import 'package:daftar_belanja/view/CommonUser/tambah_daftar_belanja.dart';
import 'package:daftar_belanja/view/user_profile.dart';
import 'package:flutter/material.dart';

class HomePageCommonUser extends StatefulWidget {
  final CommonUser user;
  const HomePageCommonUser({super.key, required this.user});

  @override
  State<HomePageCommonUser> createState() => _HomePageCommonUserState();
}

class _HomePageCommonUserState extends State<HomePageCommonUser> {
  int _currentPage = 0;

  Map dataUser = {};
  List<DaftarBelanja> listDaftarBelanja = [];
  String notifikasiListKosong = '';

  @override
  void initState() {
    super.initState();

    dataUser = widget.user.getAllAttributes();

    widget.user.getAllDaftarBelanja().then((value) {
      setState(() {
        listDaftarBelanja = value;
        notifikasiListKosong = (value.isEmpty) ? 'Tidak Ada Daftar Belanja' : '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
          Container(
          color: const Color.fromARGB(255, 89, 231, 111),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 90.0,bottom: 30.0, left: 30.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35.0,
                      child: Icon(Icons.person, size: 40.0,),
                    ),
                    const SizedBox(width: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          dataUser['Nama'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Text(
                          'Customer',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 242, 242, 242),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    ),
                    border: Border(
                      top: BorderSide(color: Color.fromARGB(255, 98, 212, 116)),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Jumlah Daftar Saat Ini",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15.0,
                              child: Text(
                                listDaftarBelanja.length.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13.0
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0)
                            ),
                            border: Border(
                              top: BorderSide(color: Color.fromARGB(255, 217, 217, 217)),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
                                child: Text(
                                  'Daftar Belanja',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: (listDaftarBelanja.isNotEmpty) ?
                                  ListView.builder(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    itemCount: listDaftarBelanja.length,
                                    itemBuilder: (context, index) {
                                      DaftarBelanja daftarBelanja = listDaftarBelanja[index];
                                      List data = daftarBelanja.getAttributes();
                            
                                      return Card(
                                        clipBehavior: Clip.antiAlias,
                                        child: ListTile(
                                          title: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                data[0],
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              PopupMenuButton(
                                                itemBuilder: (context) {
                                                  return [
                                                    const PopupMenuItem(
                                                      value: 0,
                                                      child: Text('Edit'),
                                                    ),
                                                    const PopupMenuItem(
                                                      value: 1,
                                                      child: Text('Hapus', style: TextStyle(color: Colors.red),),
                                                    ),
                                                  ];
                                                },
                                                onSelected: (value) async {
                                                  switch (value) {
                                                    case 0:
                                                      final NavigatorState navigatorContext = Navigator.of(context);

                                                      DaftarBelanja? result = await navigatorContext.push(MaterialPageRoute(builder: (context) => EditDaftarBelanja(daftarBelanja: daftarBelanja)));

                                                      if (result != null) {
                                                        setState(() {
                                                          data = result.getAttributes();
                                                        });
                                                      }
                                                      break;
                                                    case 1:
                                                      bool? confirmation = await showDialog(
                                                        context: context,
                                                        builder: (context) {
                                                          return AlertDialog(
                                                            title: const Text('Hapus Daftar Tabel'),
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
                                                        try {
                                                          bool result = await daftarBelanja.delete();

                                                          if (result) {
                                                            List<DaftarBelanja> newListDaftarBelanja = await widget.user.getAllDaftarBelanja();

                                                            setState(() {
                                                              listDaftarBelanja = newListDaftarBelanja;
                                                            });
                                                          }
                                                        } catch (e) {
                                                          e.toString();
                                                        }
                                                      }
                                                      break;
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                          subtitle: Column(
                                            children: [
                                              const SizedBox(height: 30),
                                              const Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text('Created'),
                                                  Text('Updated')
                                                ],
                                              ),
                                              const Divider(),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(data[1]),
                                                  Text(data[2]),
                                                ],
                                              ),
                                            ],
                                          ),
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarBelanjaCommonUser(user: widget.user, daftarBelanja: daftarBelanja)));
                                          },
                                        ),
                                      );
                                    },
                                  )
                                : Center(child: Text(notifikasiListKosong)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        UserProfile(user: widget.user),
      ][_currentPage],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24.0),
            topRight: Radius.circular(24.0)
          ),
          border: Border(
            top: BorderSide(color: Colors.grey.shade400, width: 1.5),
          ),
        ),
        child: NavigationBar(
          selectedIndex: _currentPage,
          destinations: const [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                size: 40.0,
              ),
              selectedIcon: Icon(
                Icons.home,
                size: 40.0,
              ),
              label: 'Home'
            ),
            NavigationDestination(
              icon: Icon(
                Icons.person_outline,
                size: 40.0,
              ),
              selectedIcon: Icon(
                Icons.person,
                size: 40.0,
              ),
              label: 'User'
            ),
          ],
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          elevation: 0.0,
          backgroundColor: Colors.white10,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
          setState(() {
            _currentPage = index;
          });
          },
        ),
      ),
      floatingActionButton: _currentPage == 0 ? FloatingActionButton(
        onPressed: () async {
          final NavigatorState navigatorContext = Navigator.of(context);

          final DaftarBelanja? result = await navigatorContext.push(MaterialPageRoute(builder: (context) => TambahDaftarBelanja(user: widget.user)));
          List<DaftarBelanja> newListDaftarBelanja = await widget.user.getAllDaftarBelanja();

          if (result != null) {
            setState(() {
              listDaftarBelanja = newListDaftarBelanja;
            });
          }
        },
        tooltip: 'Tambah Barang',
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 101, 255, 125),
        elevation: 0,
        child: const Icon(Icons.add, size: 40.0),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}