import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/model.dart';

class UserViewModel {
  
  Future createUser(String email, String password) async {
    Map data = {"email": email, "password": password};
    try {
      http.Response hasil = await http.post(
          Uri.parse("http://172.20.10.5/test_apii/register.php"),
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
