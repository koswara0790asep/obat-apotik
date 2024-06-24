// To parse this JSON data, do
//
//     final obat = obatFromJson(jsonString);

import 'dart:convert';

List<Obat> obatFromJson(String str) => List<Obat>.from(json.decode(str).map((x) => Obat.fromJson(x)));

String obatToJson(List<Obat> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Obat {
    Obat({
        required this.id,
        required this.nama,
        required this.jenis,
        required this.kategori,
        required this.stok,
        required this.kadaluarsa,
    });

    String id;
    String nama;
    String jenis;
    String kategori;
    String stok;
    String kadaluarsa;

    factory Obat.fromJson(Map<String, dynamic> json) => Obat(
        id: json["id"],
        nama: json["nama"],
        jenis: json["jenis"],
        kategori: json["kategori"],
        stok: json["stok"],
        kadaluarsa: json["kadaluarsa"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "jenis": jenis,
        "kategori": kategori,
        "stok": stok,
        "kadaluarsa": kadaluarsa,
    };
}
