import 'package:daftar_belanja/class/barang.dart';
import 'package:daftar_belanja/class/daftar.dart';
import 'package:daftar_belanja/class/user.dart';
import 'package:daftar_belanja/view/detail_barang.dart';
import 'package:daftar_belanja/view/tambah_barang_form.dart';
import 'package:flutter/material.dart';

class DaftarBelanjaCommonUser extends StatefulWidget {
  final CommonUser user;
  final DaftarBelanja daftarBelanja;
  const DaftarBelanjaCommonUser({super.key, required this.user, required this.daftarBelanja});

  @override
  State<DaftarBelanjaCommonUser> createState() => _DaftarBelanjaCommonUserState();
}

class _DaftarBelanjaCommonUserState extends State<DaftarBelanjaCommonUser> {
  Map dataUser = {};
  List<Barang> listBarang = [];
  String totalHarga = '';
  int jumlahBarang = 0;
  String notifikasiListKosong = '';

  @override
  void initState() {
    super.initState();

    dataUser = widget.user.getAllAttributes();
    widget.daftarBelanja.getAllBarang().then((value) {
      String harga = widget.daftarBelanja.hitungTotalHarga(value);
      int jumlah = widget.daftarBelanja.hitungJumlahBarang(value);

      setState(() {
        listBarang = value;
        totalHarga = harga;
        jumlahBarang = jumlah;
        notifikasiListKosong = value.isEmpty ? 'Daftar Belanja Kosong' : '';
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
                              "Jumlah Barang",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15.0,
                              child: Text(
                                jumlahBarang.toString(),
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
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 20.0),
                                child: Text(
                                  widget.daftarBelanja.namaDaftar,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    border: Border.all()
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
                                          onTap: () async {
                                            await Navigator.push(context, MaterialPageRoute(builder: (context) => DetailBarang(barang: barang)));

                                            List<Barang> newListBarang = await widget.daftarBelanja.getAllBarang();

                                            String harga = widget.daftarBelanja.hitungTotalHarga(newListBarang);
                                            int jumlah = widget.daftarBelanja.hitungJumlahBarang(newListBarang);

                                            setState(() {
                                              listBarang = newListBarang;
                                              totalHarga = harga;
                                              jumlahBarang = jumlah;
                                              notifikasiListKosong = listBarang.isEmpty ? 'Daftar Belanja Kosong' : '';
                                            });
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
                                                          "Jumlah: ${data['Kuantitas']}",
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
                                                                  title: const Text('Hapus Barang'),
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
                                                                  List<Barang> newListBarang = await widget.daftarBelanja.getAllBarang();

                                                                  String harga = widget.daftarBelanja.hitungTotalHarga(newListBarang);
                                                                  int jumlah = widget.daftarBelanja.hitungJumlahBarang(newListBarang);

                                                                  setState(() {
                                                                    listBarang = newListBarang;
                                                                    totalHarga = harga;
                                                                    jumlahBarang = jumlah;
                                                                    notifikasiListKosong = listBarang.isEmpty ? 'Daftar Belanja Kosong' : '';
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
                              Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                padding: const EdgeInsets.only(
                                  top: 10.0,
                                  left: 20.0,
                                  right: 20.0,
                                  bottom: 5.0,
                                ),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(),
                                    left: BorderSide(),
                                    bottom: BorderSide(),
                                  ),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20.0),
                                    bottomRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      'Total Harga',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(totalHarga),
                                        const SizedBox(height: 10.0),
                                        OutlinedButton.icon(
                                          onPressed: () async {
                                            final NavigatorState navigatorContext = Navigator.of(context);

                                            bool? confirmation = await showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text('Tambah Barang Dari Mana ?'),
                                                  content: const Text('Apakah ingin menambah barang dari produk milik seller atau isi sendiri ?'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context, false);
                                                      },
                                                      child: const Text('Isi Sendiri'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.pop(context, true);
                                                      },
                                                      child: const Text('Produk dari Seller'),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );

                                            if (confirmation == false) {
                                              bool? result = await navigatorContext.push(MaterialPageRoute(builder: (context) => TambahBarangForm(daftar: widget.daftarBelanja)));

                                              if (result == true) {
                                                List<Barang> newListBarang = await widget.daftarBelanja.getAllBarang();
                                                
                                                String harga = widget.daftarBelanja.hitungTotalHarga(newListBarang);
                                                int jumlah = widget.daftarBelanja.hitungJumlahBarang(newListBarang);

                                                setState(() {
                                                  listBarang = newListBarang;
                                                  totalHarga = harga;
                                                  jumlahBarang = jumlah;
                                                  notifikasiListKosong = listBarang.isEmpty ? 'Daftar Belanja Kosong' : '';
                                                });
                                              }
                                            }
                                          },
                                          icon: const Icon(Icons.add),
                                          label: const Text('Tambah'),
                                          style: OutlinedButton.styleFrom(
                                            // elevation: 0.0,
                                            side: BorderSide.none,
                                            backgroundColor: Colors.black,
                                            foregroundColor: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              )
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