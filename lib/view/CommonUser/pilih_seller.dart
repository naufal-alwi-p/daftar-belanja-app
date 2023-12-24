import 'package:daftar_belanja/class/daftar.dart';
import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/CommonUser/daftar_produk_seller.dart';
import 'package:flutter/material.dart';

class PilihSeller extends StatefulWidget {
  final DaftarBelanja daftarBelanja;
  const PilihSeller({super.key, required this.daftarBelanja});

  @override
  State<PilihSeller> createState() => _PilihSellerState();
}

class _PilihSellerState extends State<PilihSeller> {
  List<Map<String, dynamic>> listSeller = [];

  String notifikasiListKosong = '';

  @override
  void initState() {
    super.initState();

    Seller.getAllSeller().then((value) {
      setState(() {
        listSeller = value;
        notifikasiListKosong = value.isEmpty ? 'Tidak Ada Seller' : '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30.0),
            const Text(
              'Pilih Seller',
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: listSeller.isNotEmpty ?
                ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  itemCount: listSeller.length,
                  itemBuilder: (context, index) {
                    Map<String, dynamic> dataSeller = listSeller[index];

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      child: ListTile(
                        onTap: () async {
                          final NavigatorState navigatorContext = Navigator.of(context);

                          Seller seller = Seller();

                          DaftarProduk daftarProduk = await seller.login(dataSeller['email'], dataSeller['password']);

                          navigatorContext.push(MaterialPageRoute(builder: (context) => DaftarProdukSeller(daftarBelanja: widget.daftarBelanja, seller: seller, daftarProduk: daftarProduk)));
                        },
                        title: Column(
                          children: [
                            const CircleAvatar(
                              child: Icon(Icons.person),
                            ),
                            const SizedBox(height: 7.0),
                            Text(
                              dataSeller['nama_toko'],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 7.0),
                          ],
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'No. Telepon',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dataSeller['nomor_telepon'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Email',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        dataSeller['email'],
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Text(
                              'Alamat Toko',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              dataSeller['alamat'].toString(),
                              maxLines: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
                : Center(child: Text(notifikasiListKosong)),
            )
          ],
        ),
      )
    );
  }
}