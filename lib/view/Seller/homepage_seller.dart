import 'package:daftar_belanja/class/barang.dart';
import 'package:daftar_belanja/class/daftar.dart';
import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/detail_barang.dart';
import 'package:daftar_belanja/view/tambah_barang_form.dart';
import 'package:daftar_belanja/view/user_profile.dart';
import 'package:flutter/material.dart';

class HomePageSeller extends StatefulWidget {
  final Seller seller;
  final DaftarProduk daftarProduk;
  const HomePageSeller({super.key, required this.seller, required this.daftarProduk});

  @override
  State<HomePageSeller> createState() => _HomePageSellerState();
}

class _HomePageSellerState extends State<HomePageSeller> {
  int _currentPage = 0;

  Map dataUser = {};

  List<Barang> listBarang = [];

  String notifikasiListKosong = '';

  @override
  void initState() {
    super.initState();

    dataUser = widget.seller.getAllAttributes();

    widget.daftarProduk.getAllBarang().then((value) {

      setState(() {
        listBarang = value;
        notifikasiListKosong = value.isEmpty ? 'Daftar Belanja Masih Kosong' : '';
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
                        Text(
                          dataUser['Nama Toko'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                        const Text(
                          'Seller',
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
                              "Jumlah Produk",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15.0,
                              child: Text(
                                listBarang.length.toString(),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13.0,
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
                                  'Daftar Produk',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border(
                                      top: BorderSide(),
                                      right: BorderSide(),
                                      left: BorderSide(),
                                    ),
                                  ),
                                  margin: const EdgeInsets.symmetric(horizontal: 20),
                                  child: (listBarang.isNotEmpty) ?
                                    ListView.builder(
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      itemCount: listBarang.length,
                                      itemBuilder: (context, index) {
                                        Barang barang = listBarang[index];
                                        Map<String, dynamic> data = barang.showDetail();
                                    
                                        return ListTile(
                                          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                          minVerticalPadding: 2,
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBarang(barang: barang)));
                                          },
                                          title: Text(
                                            data['Nama'],
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          subtitle: Column(
                                            children: [
                                              const SizedBox(height: 3.0),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(
                                                          data['Kategori'],
                                                          style: const TextStyle(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        const Text(
                                                          'URL',
                                                          style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.bold
                                                          ),
                                                        ),
                                                        Text(
                                                          data['URL'],
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(width: 1.0,),
                                                  Expanded(
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          data['Harga'],
                                                          style: const TextStyle(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        Text(
                                                          "Stok: ${data['Kuantitas']}",
                                                          style: const TextStyle(
                                                            fontSize: 13,
                                                          ),
                                                        ),
                                                        TextButton.icon(
                                                          onPressed: () async {
                                                            bool? confirmation = await showDialog(
                                                              context: context,
                                                              builder: (context) {
                                                                return AlertDialog(
                                                                  title: const Text('Hapus Produk'),
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
                                                                bool result = await barang.delete();

                                                                if (result) {
                                                                  List<Barang> newListBarang = await widget.daftarProduk.getAllBarang();

                                                                  setState(() {
                                                                    listBarang = newListBarang;
                                                                  });
                                                                }
                                                              } catch (e) {
                                                                e.toString();
                                                              }
                                                            }
                                                          },
                                                          icon: const Icon(Icons.delete_forever, size: 15,),
                                                          label: const Text(
                                                            'Hapus',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                            ),
                                                          ),
                                                          style: TextButton.styleFrom(
                                                            foregroundColor: Colors.red,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Divider(),
                                            ],
                                          ),
                                        );
                                      },
                                    )
                                  : Center(child: Text(notifikasiListKosong)),
                                ),
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
        UserProfile(user: widget.seller),
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

          try {
            bool? result = await navigatorContext.push(MaterialPageRoute(builder: (context) => TambahBarangForm(daftar: widget.daftarProduk)));

            if (result == true) {
              List<Barang> newListBarang = await widget.daftarProduk.getAllBarang();

              setState(() {
                listBarang = newListBarang;
              });
            }
          } catch (e) {
            e.toString();
          }
        },
        tooltip: 'Tambah Produk',
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 101, 255, 125),
        elevation: 0,
        child: const Icon(Icons.add, size: 40.0),
      ) : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}