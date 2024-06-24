import 'package:apotik_app/models/model_obat.dart';
import 'package:apotik_app/viewmodels/obat_vm.dart';
import 'package:apotik_app/views/obat/list.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditObatScreen extends StatefulWidget {
  const EditObatScreen({Key? key, required this.obat}) : super(key: key);
  final Obat obat;
  @override
  State<EditObatScreen> createState() =>
      // ignore: no_logic_in_create_state
      _EditObatScreenState(obat);
}

class _EditObatScreenState extends State<EditObatScreen> {
  Obat? obat;
  _EditObatScreenState(this.obat);
  late final TextEditingController _textIDController = TextEditingController();
  late final TextEditingController _textNamaController =
      TextEditingController();
  late final TextEditingController _textJenisController =
      TextEditingController();
  late final TextEditingController _textKategoriController =
      TextEditingController();
  late final TextEditingController _textStokController =
      TextEditingController();
  late final TextEditingController _textKadaluarsaController =
      TextEditingController();
  late String nama = "", jenis = "", kategori = "", stok = "", kadaluarsa = "";

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    _textIDController.text = obat!.id;
    _textNamaController.text = obat!.nama;
    _textJenisController.text = obat!.jenis;
    _textKategoriController.text = obat!.kategori;
    _textStokController.text = obat!.stok;
    _textKadaluarsaController.text = obat!.kadaluarsa;

    nama = obat!.nama;
    jenis = obat!.jenis;
    kategori = obat!.kategori;
    stok = obat!.stok;
    kadaluarsa = obat!.kadaluarsa;
  }

  updateobat() async {
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
          .editObat(obat!.id, nama, jenis, kategori, stok, kadaluarsa)
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
        title: const Text("Edit obat"),
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
                    controller: _textIDController,
                    enabled: false,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (e) => nama = e,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "ID",
                      label: Text("ID"),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  child: TextField(
                    controller: _textNamaController,
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
                    controller: _textJenisController,
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
                    controller: _textKategoriController,
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
                    controller: _textStokController,
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
                    controller: _textKadaluarsaController,
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
                    updateobat();
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
                              color: Color.fromARGB(156, 0, 255, 213),
                              blurRadius: 6,
                              offset: Offset(4, 6))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const <Widget>[
                        Icon(
                          FontAwesomeIcons.pen,
                          color: Colors.black,
                        ),
                        Text(
                          '  UPDATE',
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
