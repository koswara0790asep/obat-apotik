import 'package:apotik_app/models/model_obat.dart';
import 'package:apotik_app/viewmodels/obat_vm.dart';
import 'package:apotik_app/views/obat/create.dart';
import 'package:apotik_app/views/obat/edit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ListObatScreen extends StatefulWidget {
  const ListObatScreen({Key? key}) : super(key: key);

  @override
  State<ListObatScreen> createState() => _ListObatScreenState();
}

class _ListObatScreenState extends State<ListObatScreen> {
  List dataObat = [];
  void getDataObat() async {
    ObatViewModel().getObats().then((value) {
      setState(() {
        dataObat = value;
      });
    });
  }

  @override
  void initState() {
// TODO: implement initState
    super.initState();
    getDataObat();
  }

  Widget obatDetails(Obat data) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  const Icon(
                    Icons.healing_outlined,
                    color: Colors.green,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    data.nama,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.wrap_text,
                    color: Colors.blue,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.stok,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  const Icon(
                    Icons.date_range,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    data.kadaluarsa,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0), fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  hapusUser(String id) {
    ObatViewModel().deleteObat(id).then((value) => getDataObat());
  }

  updateUser(Obat obat) {
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => EditObatScreen(
              obat: obat,
            )));
  }

  showDetailDialog(Obat data) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            title: Center(
                child: Container(
                    padding: const EdgeInsets.all(10),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromARGB(169, 33, 149, 243),
                              blurRadius: 6,
                              offset: Offset(4, 6))
                        ]),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Icon(
                            FontAwesomeIcons.circleCheck,
                            color: Colors.white,
                          ),
                          Text(
                            "  Detail Obat",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ]))),
            content: Stack(
                // alignment: Alignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.health_and_safety),
                          Text("Nama Obat: \n ${data.nama}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.card_giftcard),
                          Text("No. ID : ${data.id}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.label),
                          Text("Jenis Obat: ${data.jenis}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.category),
                          Text("Kategori Obat : ${data.kategori}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.health_and_safety_rounded),
                          Text("Stok Obat: ${data.stok}"),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.date_range),
                          Text("Tanggal Kadaluarsa : \n ${data.kadaluarsa}"),
                        ],
                      ),
                    ],
                  ),
                ]),
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () {
                        hapusUser(data.id);
                        Navigator.of(context).pop();
                      },
                      child: FittedBox(
                          // constraints: const BoxConstraints(maxWidth: fit),
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 255, 0, 0),
                            borderRadius: BorderRadius.circular(4),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromARGB(156, 211, 2, 2),
                                  blurRadius: 6,
                                  offset: Offset(4, 6))
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const <Widget>[
                            Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.white,
                            ),
                            Text(
                              '  HAPUS',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ))),
                  TextButton(
                      onPressed: () {
                        updateUser(data);
                      },
                      child: FittedBox(
                          // constraints: const BoxConstraints(maxWidth: fit),
                          child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 0, 255, 213),
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
                              color: Colors.white,
                            ),
                            Text(
                              '  EDIT',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      )))
                ],
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 69, 254, 91),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 49, 255, 13),
        title: const Text("Daftar Obat"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, i) {
            return GestureDetector(
                onTap: () {
                  showDetailDialog(dataObat[i]);
                },
                child: obatDetails(dataObat[i]));
          },
// ignore: unnecessary_null_comparison
          itemCount: dataObat == null ? 0 : dataObat.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const CreateObatScreen()))
        },
        heroTag: 'createNew',
        backgroundColor: const Color.fromARGB(255, 0, 234, 215),
        child: const Icon(Icons.add, color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
