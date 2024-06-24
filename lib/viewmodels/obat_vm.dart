import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model_obat.dart';

class ObatViewModel {
  Future getObats() async {
    try {
      http.Response hasil = await http.get(
          Uri.parse("http://172.20.10.5/test_apii/read.php"),
          headers: {"Accept": "application/json"});
      if (hasil.statusCode == 200) {
// print(hasil.body);
        final data = obatFromJson(hasil.body);
        return data;
      } else {
// print("error status " + hasil.statusCode.toString());
        return null;
      }
    } catch (e) {
// print("error catch $e");
      return null;
    }
  }

  Future deleteObat(String id) async {
    Map data = {"id": id};
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://172.20.10.5/test_apii/delete.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
// print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
// print("error catch $e");
      return false;
    }
  }

  Future createObat(String nama, String jenis, String kategori, String stok,
      String kadaluarsa) async {
    Map data = {
      "nama": nama,
      "jenis": jenis,
      "kategori": kategori,
      "stok": stok,
      "kadaluarsa": kadaluarsa
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://172.20.10.5/test_apii/create.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
// print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
// print("error catch $e");
      return false;
    }
  }

  Future editObat(String id, String nama, String jenis, String kategori,
      String stok, String kadaluarsa) async {
    Map data = {
      "id": id,
      "nama": nama,
      "jenis": jenis,
      "kategori": kategori,
      "stok": stok,
      "kadaluarsa": kadaluarsa
    };
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://172.20.10.5/test_apii/update.php"),
          headers: {"Accept": "application/json"},
          body: json.encode(data));
      if (hasil.statusCode == 200) {
        return true;
      } else {
// print("error status " + hasil.statusCode.toString());
        return false;
      }
    } catch (e) {
// print("error catch $e");
      return false;
    }
  }
}
