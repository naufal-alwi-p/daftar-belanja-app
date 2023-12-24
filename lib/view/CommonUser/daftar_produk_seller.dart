import 'package:daftar_belanja/class/barang.dart';
import 'package:daftar_belanja/class/daftar.dart';
import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/CommonUser/detail_produk_seller.dart';
import 'package:flutter/material.dart';

class DaftarProdukSeller extends StatefulWidget {
  final DaftarBelanja daftarBelanja;
  final Seller seller;
  final DaftarProduk daftarProduk;
  const DaftarProdukSeller({super.key, required this.daftarBelanja, required this.seller, required this.daftarProduk});

  @override
  State<DaftarProdukSeller> createState() => _DaftarProdukSellerState();
}

class _DaftarProdukSellerState extends State<DaftarProdukSeller> {

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
        notifikasiListKosong = value.isEmpty ? 'Daftar Produk Kosong' : '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        dataUser['Nama Toko'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        dataUser['Nomor Telepon'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                        ),
                      ),
                      Text(
                        dataUser['Email'],
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
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                                  border: Border.all(),
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
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailProdukSeller(daftarBelanja: widget.daftarBelanja, barang: barang)));
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
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(height: 7.0),
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
    );
  }
}