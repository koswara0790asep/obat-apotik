import 'package:apotik_app/viewmodels/obat_vm.dart';
import 'package:apotik_app/views/obat/list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CreateObatScreen extends StatefulWidget {
  const CreateObatScreen({Key? key}) : super(key: key);

  @override
  State<CreateObatScreen> createState() => _CreateObatScreenState();
}

class _CreateObatScreenState extends State<CreateObatScreen> {
  late String nama = "", jenis = "", kategori = "", stok = "", kadaluarsa = "";

  regMhs() async {
    if ((nama == "") ||
        (jenis == "") ||
        (kategori == "") ||
        (stok == "") ||
        (kadaluarsa == "")) {
      Fluttertoast.showToast(
          msg: "Semua Field harus diisi dengan data yang benar!",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.CENTER,
          backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          textColor: const Color.fromARGB(255, 255, 255, 255));
    } else {
      showLoaderDialog(context);
      ObatViewModel()
          .createObat(nama, jenis, kategori, stok, kadaluarsa)
          .then((value) {
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const ListObatScreen()));
      });
    }
  }

  showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 254, 91),
      appBar: AppBar(
        title: const Text("Tambah Obat Baru"),
        backgroundColor: const Color.fromARGB(255, 49, 255, 13),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 12.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (e) => nama = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Nama Obat",
                      label: Text("Nama Obat"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
                    keyboardType: TextInputType.text,
                    onChanged: (e) => jenis = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText:
                          "Bebas/Bebas Terbatas/Keras/Psikotropika & Narkotika",
                      label: Text("Jenis Obat"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
                    onChanged: (e) => kategori = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Tablet/Kapsul/Cair",
                      label: Text("Kategori"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
                    onChanged: (e) => stok = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "kaplet/pcs/botol",
                      label: Text("Stok"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
                    onChanged: (e) => kadaluarsa = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "DD-MM-YYYY",
                      label: Text("Tanggal Kadaluarsa/Expired"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                    child: TextButton(
                  onPressed: () {
                    regMhs();
                  },
                  child: FittedBox(
                      // constraints: const BoxConstraints(maxWidth: fit),
                      child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(156, 0, 255, 234),
                              blurRadius: 6,
                              offset: Offset(4, 6))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.floppyDisk,
                          color: Colors.black,
                        ),
                        Text(
                          '  SIMPAN',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  )),
                ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
